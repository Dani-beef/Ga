{include file="header_home.tpl"}

      <h3>Create blog</h3>
			{include file="error_success.tpl"}
      <form method="post" action="#">
        <input type="text" name="title" maxlength="45" placeholder="Blog title" class="text-center" value="{$smarty.post.title|htmlspecialchars}"/>
       
       <div class="row">
        <div class="col-md-12">
          <div class="row-fluid">
            <div class="col-md-8 nopadding">
              <input type="submit" value="Create blog" c/>
            </div>
            <div class="col-md-4 nopadding">
              <a href="{$config.url}blogs" class="button text-center">CANCEL</a>
            </div>
          </div>
        </div>
      </div>
      </form>
				
				
			
	
	{include file="footer_home.tpl"}
		