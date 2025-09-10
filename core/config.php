<?php
	$domain = 'http://localhost/matchme';

    // Database Configuration
	$_db['host'] = 'localhost';
	$_db['user'] = 'root';
	$_db['pass'] = 'root';
	$_db['name'] = 'matchme';

	$site_name = 'MatchMe';
	$meta['keywords'] = '';
	$meta['description'] = '';

    // Facebook Login Configuration
	$fb_app_id = '1018459751633376'; 
	$fb_secret_key = '1d4b541198de9a8aa6a0b4365c1b422c'; 

    // Misc Configuration
	$minimum_age = '16'; 
	$email_sender = ''; 
	
	// Units of Measurement
	$unit['height'] = 'cm';
	$unit['weight'] = 'kg';
	
	$db = new mysqli($_db['host'], $_db['user'], $_db['pass'], $_db['name']) or die('MySQL Error');

	error_reporting(0);
	