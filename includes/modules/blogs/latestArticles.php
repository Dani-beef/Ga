<?php
  	

  $pages                 = new Paginator;
  $pages->items_total    = $db->getOne('blog_articles', 'count(*) nra')['nra'];
  $pages->items_per_page = 30;
  $pages->paginate();
    
  $tVars["articles"] = 
    $db->rawQuery('select article_id, title, u.username, user_id, nrc, votes, ba.created
                   from blog_articles ba
                   left outer join blogs b on b.blog_id = ba.blog_id
                   left outer join users u on u.id = b.user_id
                   order by ba.created desc
                   '.$pages->limit);
  
  $tVars["display"] = "blog/latestArticles.tpl";
