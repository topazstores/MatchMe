<?php
define('IS_AJAX', true);
session_set_cookie_params(172800);
session_start();
require('../core/config.php');
require('../core/auth.php');
require('../core/system.php');
$auth = new Auth;
$system = new System;

$system->domain = $domain;
$system->db = $db;

$menu['pages'] = 'active';
$page['name'] = 'Manage Pages';

$user = $system->getUserInfo($_SESSION['user_id']);

if(!$auth->isLogged() || $user->is_admin != 1) {
	header('Location: index.php');
	exit;
}

$pages = $db->query("SELECT * FROM pages ORDER BY id DESC");

if(isset($_GET['delete']) && isset($_GET['delid'])) {
	$delid = $_GET['delid'];
	$db->query("DELETE FROM pages WHERE id='".$delid."'");
	header('Location: pages.php');
	exit;
}

require('../inc/admin/top.php');
require('../layout/admin/pages.php');
require('../inc/admin/bottom.php');