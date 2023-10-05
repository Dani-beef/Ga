<?php

$faq_categories = $db->orderBy('faq_order', 'asc')->get('faq_categories');
$faq = $db->orderBy('faq_order', 'asc')->get('faq_questions');

foreach($faq as &$f)
{
  $f['answer'] = str_replace("WEBSITE_URL", configs('url'), $f['answer']);
}
$tVars['faq_categories'] = $faq_categories;
$tVars['faq'] = $faq;

$tVars['display'] = 'faq/faq.tpl';