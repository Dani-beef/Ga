<?php

	


if ($GET['inAppIFrame'])
{
	$_SESSION['inAppIFrame'] = true;
}
// login form has been submitted
if (isset($_POST['process'])) {
  if ($cardinal->loginSystem->loginUser()) 
  {
      $cardinal->redirect($_SESSION['afterLoginRedirect'] ? $_SESSION['afterLoginRedirect'] : URL);
  }
}

if(ctype_digit($id=base64_decode($_GET["code"]))){
  $_SESSION["referred"]=$id;
}
  
if (!$_SESSION['showedVideo'])
{
	$_SESSION['showedVideo'] = true;
	$tVars['showVideo'] = true;
}
  $smarty->caching = 1; // lifetime is per cache
  $smarty->cache_lifetime = 360;
  
  if(!$smarty->isCached('home/main_stats.tpl')){
	  $reviews = array(
		               "Analytical and speedy gameplay: You need to be a quick thinker, and even quicker at typing to play this game on a high level. And even if you suck, jut like in halo multiplayer, it's still fun.",
				       "Living the dream: Just like most mmo's you get to live as some-one in a world you'd never see in real life, but rather then a sword-wielding knight or a laser pistol-toting alien, you get to be a hacker. Think something like a more technical aspect of Watch_Dogs but in a dystopian universe. Yeah. It's that cool",
					   "Odd seemingly random epic/funny events during my gameplay.Now then, let's embark on this rather unexpected journey shall we?",
	  				   "1st rule of hacking dont get cocky 2nd be smart and not just act it 3rd be careful who u friend 4th hack 5th have fun 6th dont get caught",
		               "My first hours after I moved from gaming my life away to become what some people might call a hacker.... Seriously I didn't knew it was that hard, but okay everything new is hard in some way...",
	                   "I'm really enjoying this game. I've played a few different ones and so far I'm liking this one as a tie for #1. It's complicated but not overly so for the inexperienced. Makes you think and work things out. ",
                       "I think this game concludes my search for the best free hacking sim. Which I have been searching gor a few weeks now",
                       "This game = most of my day"
                      );
    $orgs = $db->orderBy('id', 'desc')->get('organizations', 5, 'id, name');
    $hackers = $db->orderBy('id', 'desc')->where('username','','!=')->get('users', 5, 'id, username');
    $online = $db->rawQuery("select count(*) nro from users where lastActive >= ? ",
						    array(time() - 2 * 24 * 60 * 60));
	  
    $orgHackers = array_merge($orgs, $hackers);
    shuffle($orgHackers);
	  
      $lastNews = $db->where('(fid = 2 or fid = 11)')->where('parent is null')->orderBy('created', 'desc')->getOne('forum_posts', 'title, id tid');
      $lastArticle = $db->orderBy('created', 'desc')->getOne('blog_articles', 'title, article_id');
      $smarty->assign('review', $reviews[rand(0,count($reviews) - 1)]);
      $smarty->assign('config', $config);
      $smarty->assign('lastNews', $lastNews);
      $smarty->assign('lastArticle', $lastArticle);
      $smarty->assign('orgHackers', $orgHackers);
      $smarty->assign('online', $online[0]['nro']);
  }
  $tVars["main_stats"] = $smarty->fetch("home/main_stats.tpl");
  $smarty->caching = 0;
	
	$messenger[] = array("message" => "Please authenticate on the Grid.");
$messenger[] = array("message" => "Access restricted.", "type" => "error");
  
  $tVars["no_footer_bar"] = true;
  $tVars["display"] = 'home/splash_screen.tpl';	
		
