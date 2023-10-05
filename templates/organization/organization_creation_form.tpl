       						{include file="error_success.tpl"}

        <form method="post">
		<div class="row">
			<div class="col-md-7">
            <input type="text"  name="name" maxlength="{$config.org_name_size}" placeholder="Organization Name" value="{$smarty.post.name|htmlspecialchars}" />
            </div><div class="col-md-5">
			<input type="text"  name="tag" maxlength="4" placeholder="Organization TAG" value="{$smarty.post.tag|htmlspecialchars}" />
            </div>
			</div><br/>
            <div class="row">
              <div class="col-md-12">
                <div class="row-fluid">
                  <div class="col-md-8 nopadding">
                   <button type="submit" >Take a leap of fate</button>
                  </div>
                  <div class="col-md-4 nopadding">
                    <a href="{$config.url}organization"><button type="button">Cancel</button></a>
                  </div>
                </div>
              </div>
            </div>
        </form>
        	
	