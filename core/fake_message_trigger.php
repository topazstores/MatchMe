<?php 
function maybeSendFakeMessage($user, $db) {
    $now = time();

    // First fake within 0–5 sec after register
    $has_fake = $db->query("
        SELECT 1 FROM messages 
        WHERE user2='{$user->id}' AND is_fake_sent=1
        LIMIT 1
    ")->fetch_object();

    if (!$has_fake) {
        scheduleFakeMessage($user, $db, rand(0,5));
        return;
    }

    // Allow MANY fakes, not just one
    $last_fake = $db->query("
        SELECT time FROM messages 
        WHERE user2='{$user->id}' AND is_fake_sent=1 
        ORDER BY time DESC LIMIT 1
    ")->fetch_object();

    $elapsed = $now - $last_fake->time;
    $next_interval = rand(5, 1200); // 5s – 20 min

    if ($elapsed >= $next_interval) {
        scheduleFakeMessage($user, $db, 0);
    }
}

/**
 * Get online users (last_active in last 5 min or your own flag)
 */
function getOnlineUsers($db, $online_window = 300) {
    $now = time();
    $result = $db->query("SELECT * FROM users WHERE last_active > ($now - $online_window)");
    $users = [];
    while($user = $result->fetch_object()) {
        $users[] = $user;
    }
    return $users;
}

/**
 * Call this periodically (via cron or ajax polling)
 */
function checkAndSendFakesForOnlineUsers($db) {
    $onlineUsers = getOnlineUsers($db);
    foreach ($onlineUsers as $user) {
        maybeSendFakeMessage($user, $db);
    }
}

function scheduleFakeMessage($user, $db, $delay) {
    // Choose a fake user matching prefs
    $where = "is_fake=1";
    if($user->sexual_interest == 1) { 
        $where .= $user->gender == 'Male' ? " AND gender='Female'" : " AND gender='Male'";
    } elseif($user->sexual_interest == 2) { 
        $where .= " AND gender='".$user->gender."'";
    } elseif($user->sexual_interest == 3) { 
        $where .= " AND gender='Female'";
    } elseif($user->sexual_interest == 4) { 
        $where .= " AND (gender='Male' OR gender='Female')";
    }

    $fake = $db->query("
      SELECT * FROM users 
      WHERE $where 
      ORDER BY RAND() LIMIT 1
    ")->fetch_object();

    if (!$fake) return;

    // Build giant pool of messages
    $mood_messages = buildFakeMessages();

    // Flatten all
    $all_messages = [];
    foreach ($mood_messages as $msgs) {
        $all_messages = array_merge($all_messages, $msgs);
    }

    // Pick random
    $msg = $all_messages[array_rand($all_messages)];

    // Avoid repeats
    $sent = [];
    $rs = $db->query("SELECT message FROM messages WHERE user2='{$user->id}' AND is_fake_sent=1");
    while($row = $rs->fetch_object()) $sent[] = $row->message;
    if (in_array($msg, $sent)) return;

    if ($delay > 0) sleep($delay);

    $db->query("INSERT INTO messages 
      (message,user1,user2,is_sticker,is_photo,sticker_id,time,is_fake_sent) 
      VALUES (
        '".$db->real_escape_string($msg)."',
        '".$fake->id."',
        '".$user->id."',
        0,0,0,
        '".time()."',
        1
    )");
}

function buildFakeMessages() {
    return [
        "friendly" => [
            "Hey 👋",
            "How’s your day going?",
            "I was just scrolling and your profile caught my eye, you seem cool 😄",
            "You have a really nice vibe, what do you usually do for fun?",
            "So I’ve been on this app for a while and honestly most convos die in 2 messages, but you look like someone I’d actually want to talk to. Do you usually meet nice people here?",
            "I just made coffee and now I’m too awake to sleep, thought I’d see who’s online 😅",
            "Sometimes I feel this app is full of bots, but you seem like a real person lol",
            "Where are you from originally?",
            "What’s the best part of your week so far?",
            "If you could travel anywhere right now, where would you go?",
            "You seem like someone with a good sense of humor 😂",
            "Okay so random question: pineapple on pizza, yes or no?",
            "Do you like movies or are you more of a series binge watcher?",
            "What’s the last song you had on repeat?",
            "So… tell me something interesting about you that’s not on your profile 😉",
            "It feels nice to just chat without pressure, don’t you think?",
            "I feel like we might actually vibe well if we keep talking 😊",
            "Ever had a random chat turn into a great friendship?",
            "What kind of food do you love most?",
            "I’m curious, are you more of a morning person or night owl?",
        ],
        "horny" => [
            "You look sooo hot 🔥",
            "Can’t stop staring at your pics 😏",
            "Not gonna lie, I’m kinda turned on just scrolling here…",
            "Honestly, I keep wondering what it’d be like if we met in person, just the two of us 😈",
            "I like people who know what they want… do you? 😉",
            "You have that look that makes me imagine things I probably shouldn’t be saying here…",
            "Ever had one of those nights where you just can’t stop thinking about… stuff?",
            "So be honest, are you here for fun or something serious?",
            "Imagine if I was sitting next to you right now… what would we be doing?",
            "I’m curious… do you like teasing or going straight to the point?",
            "You seem like someone who knows how to keep things exciting 😘",
            "You make me want to type things I shouldn’t lol",
            "I bet you’re the kind of person who doesn’t hold back when it matters 😉",
            "Do you like slow and sensual or fast and rough?",
            "I feel like if we keep talking, things might get a little naughty 😏",
            "You have this energy that makes me want more…",
            "I can almost imagine whispering things in your ear right now…",
            "Do you like a bit of roleplay or keeping it real?",
            "You seem like the adventurous type 😈",
            "Bet you’re fun when the lights go out 😉",
        ],
        "happy" => [
            "Today’s been surprisingly good ☀️ how about yours?",
            "I love when I randomly meet cool people online!",
            "Nothing beats good vibes and good convos 😁",
            "Do you believe some people just click instantly?",
            "I’m literally smiling while typing this lol",
            "Sometimes random chats make my whole day better 💛",
            "If we vibe here, who knows, maybe we’ll be good friends too",
            "What usually puts you in a good mood?",
            "You seem like a positive person, am I right?",
            "Do you laugh easily or are you more serious?",
            "I think laughter really is the best medicine 😄",
            "Have you ever laughed so hard you cried?",
            "Music always makes me feel better, what about you?",
            "Today’s energy just feels good ✨",
            "Some days just feel brighter, don’t you agree?",
        ],
        "sad" => [
            "Kinda feeling low today tbh…",
            "Some days are harder than others, right?",
            "I don’t even know why I’m here, just felt like talking to someone…",
            "Do you ever just sit and think too much?",
            "Sorry if I sound off, just not in the best mood",
            "I think chatting helps sometimes, takes your mind off things",
            "Do you usually talk about your feelings or keep them in?",
            "Have you ever felt like nobody understands you?",
            "Some nights feel heavier than others 😔",
            "Not gonna lie, I just needed someone to talk to",
            "Do you believe talking to strangers can sometimes feel easier than talking to friends?",
            "Life can be tough, but I guess we get through it step by step",
            "Do you have that one thing that cheers you up instantly?",
        ],
        "bored" => [
            "Scrolling endlessly because I’m bored 😂",
            "I need someone to distract me from doing nothing lol",
            "This app feels like my entertainment when I’m lazy",
            "Do you ever just scroll for hours without realizing?",
            "I think boredom makes me more talkative lol",
            "Wanna chat and kill some time?",
            "Literally just sitting here refreshing my feed haha",
            "Do you ever chat just for fun with no expectations?",
            "Feels like everyone’s asleep and I’m just awake with nothing to do 😅",
            "Sometimes boredom makes the best convos happen",
        ],
        "mature" => [
            "I like meaningful conversations, not just small talk",
            "What do you value most in people?",
            "I believe in honesty above everything else",
            "Do you think people meet genuinely good connections online?",
            "I’m not here to waste time, I prefer depth",
            "What’s your long-term goal in life?",
            "I think people underestimate the power of real conversations",
            "Do you like talking about big ideas or keeping it casual?",
            "I value loyalty more than anything else",
            "Do you believe in second chances?",
        ],
        "angry" => [
            "Ugh this app is annoying sometimes 😤",
            "People ghost too much, it’s frustrating",
            "Why do people even sign up if they don’t reply?",
            "Not in the best mood tbh",
            "Maybe I just need to vent lol",
            "Tired of people being so fake here",
            "Do you ever just get fed up with things?",
            "Honestly this place tests my patience sometimes",
        ],
        "rude" => [
            "You better not be another boring person 🙄",
            "Most people here are lame, prove me wrong",
            "Don’t waste my time if you’re not fun",
            "What’s your deal anyway?",
            "You look okay but let’s see if you’re actually interesting",
            "I’m not here to stroke egos",
            "You gonna reply or nah?",
        ],
        "confused" => [
            "Idk how this app even works lol",
            "Am I doing this right? 😂",
            "Why are there so many random profiles?",
            "Do people actually meet here or just chat?",
            "Kinda feels like I’m lost here haha",
            "Do you actually use this app seriously?",
        ],
        "chill" => [
            "Just relaxing and scrolling, nothing serious",
            "Good vibes only ✌️",
            "I’m here to meet cool people, no pressure",
            "Do you like taking things slow?",
            "Music + chill convos = perfect night",
            "Some convos are just better when they’re easygoing",
            "I like relaxed energy, nothing forced",
            "This feels like a good time to just vibe and chat",
        ]
    ];


        // Flatten 200+ lines
        $all_messages = [];
        foreach ($mood_messages as $msgs) {
            $all_messages = array_merge($all_messages, $msgs);
        }

        // Pick random
        $msg = $all_messages[array_rand($all_messages)];

        // Avoid duplicates
        $sent_msgs = [];
        $rs = $db->query("SELECT message FROM messages WHERE user2='{$user->id}' AND is_fake_sent=1");
        while($row = $rs->fetch_object()) $sent_msgs[] = $row->message;
        if (in_array($msg, $sent_msgs)) return;

        // Optional delay
        if ($delay > 0) sleep($delay);

        $db->query("INSERT INTO messages 
          (message,user1,user2,is_sticker,is_photo,sticker_id,time,is_fake_sent) 
          VALUES (
            '".$db->real_escape_string($msg)."',
            '".$fake->id."',
            '".$user->id."',
            0,0,0,
            '".time()."',
            1
        )");
    }

?>
