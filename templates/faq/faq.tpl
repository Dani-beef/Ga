{include file="header_home.tpl"}
<br/><Br/>

<div class="text-center">
  <span style="font-size:126px; " class="fa fa-question-circle"></span>
 </div><br/>
<div class="panel-group" id="accordion" role="tablist">
  {foreach $faq_categories as $cat}<br/>
  <h1 id="{$cat.shortname}">{$cat.title}</h1>
    {foreach $faq as $f}
      {if $f.cat_id == $cat.cat_id}
        <a data-toggle="collapse" data-parent="#accordion" href="#{$f.shortname}-content" id="{$f.shortname}"> 
            <button class="text-left mb10">
              {$f.question}
            </button>
        </a>
      

      <div id="{$f.shortname}-content" class="panel-collapse collapse {if $GET.open eq $f.shortname}in{/if}" role="tabpanel">
         <div class="panel panel-glass mb10">
           <div class="panel-body">
              {$f.answer}
           </div>
         </div>
      </div>

      {if $GET.open eq $f.shortname}
      <script>
      $(document).ready(function(){
        scrollToElement('#{$GET.open}');
      });
      </script>
      {/if}

      {/if}
    {/foreach}
    {if $GET.open eq $cat.shortname}
      <script>
      $(document).ready(function(){
        scrollToElement('#{$GET.open}');
      });
      </script>
      {/if}
  {/foreach}
</div>