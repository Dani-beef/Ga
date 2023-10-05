{include file="header_home.tpl"}


		
				
				<div class="well text-center mb10">
				
				Type your search query bellow. A search will be made throughout the entire Alpha database.
				</div>
				
				{include file="error_success.tpl"}
				
				<div class="row">
				  <div class="col-md-3">
          
              <form  method="post">
        
                        <select name="type" class="mb10">
                          <option value="user" {if $GET.type eq "user"}selected{/if}>Citizen</option>
                          <option value="org" {if  $GET.type eq "org"}selected{/if}>Organization</option>
                          <option value="blog" {if  $GET.type eq "blog"}selected{/if}>Blog</option>
                          <option value="article" {if $GET.type eq "article"}selected{/if}>Article</option>
                        </select>
                      <input type="text" class="mb10" name="query" autofocus="autofocus" maxlength="100" placeholder="QUERY DATABASE" value="{$GET.query}"/>
                      <input type="submit" value="Query"/>
          
              </form>
            
             
		    </div>
		    <div class="col-md-9">
		       {if $results}
              <div class="alert alert-warning">
                {$count} matches
              </div>
                {if $GET.type eq "user"}
                  {foreach from = $results item = result}
                  
                    <div class="row">
                      <div class="col-md-12">
                        <div class="row-fluid">
                          <div class="col-md-4 nopadding">
                            <div class="well black">
                              {$result.username|profile_link}
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                            <div class="well  text-center">
                            Rank #{$result.rank|number_format}
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                           <div class="well black text-center">
                            Zone rank #{$result.zrank|number_format}
                            </div>
                          </div>
                          <div class="col-md-2 nopadding">
                            <a href="{$config.url}profile/hacker/{$result.username}" class="button text-center">PROFILE</a>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  
                                            
                 
                  {/foreach}
                 
          
          
                {elseif $GET.type eq "org"}
                  {foreach from=$results item=result}
                  <div class="row">
                      <div class="col-md-12">
                        <div class="row-fluid">
                          <div class="col-md-4 nopadding">
                            <div class="well black">
                              <a href="{$config.url}organization/show/{$result.name|urlencode}">{$result.name}</a>
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                            <div class="well  text-center">
                            Rank #{$result.orank|number_format}
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                           <div class="well black text-center">
                            {$result.nrm|number_format} members
                            </div>
                          </div>
                          <div class="col-md-2 nopadding">
                            <a href="{$config.url}organization/show/{$result.name|urlencode}" class="button text-center">VIEW</a>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  {/foreach}
                 
            
            
                {elseif $GET.type eq "blog"}
          
            
                 {foreach from=$results item=result}
                  <div class="row">
                      <div class="col-md-12">
                        <div class="row-fluid">
                          <div class="col-md-4 nopadding">
                            <div class="well black">
                              <a href="{$config.url}blogs/blog/{$result.blog_id}">{$result.name}</a>
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                            <div class="well  text-center">
                             {$result.nrs|number_format} subscribers
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                           <div class="well black text-center">
                            {$result.nrs|number_format} articles
                            </div>
                          </div>
                          <div class="col-md-2 nopadding">
                            <a href="{$config.url}blogs/blog/{$result.blog_id}" class="button text-center">VIEW</a>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  {/foreach}
            
            
            {elseif $GET.type eq "article"}
          
            
                 {foreach from=$results item=result}
                  <div class="row">
                      <div class="col-md-12">
                        <div class="row-fluid">
                          <div class="col-md-4 nopadding">
                            <div class="well black">
                              <a href="{$config.url}blogs/article/{$result.article_id}">{$result.title}</a>
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                            <div class="well  text-center">
                             {$result.nrv|number_format} votes
                            </div>
                          </div>
                          <div class="col-md-3 nopadding">
                           <div class="well black text-center">
                            {$result.nrc|number_format} comments
                            </div>
                          </div>
                          <div class="col-md-2 nopadding">
                            <a href="{$config.url}blogs/article/{$result.article_id}" class="button text-center">VIEW</a>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  {/foreach}
            
            
             {elseif $GET.type eq "forum" || $GET.type eq "orgForum"}
          
            
                 {foreach from=$results item=result}
                  <div class="row">
                      <div class="col-md-12">
                        <div class="row-fluid">
                          <div class="col-md-7 nopadding">
                            <div class="well black">
                              {if $result.parent}
                                 <a href="{$config.url}forum/tid/{$result.parent}">{$result.parent_title}</a>
                              {else}
                                <a href="{$config.url}forum/tid/{$result.id}">{$result.title}</a>
                              {/if}
                            </div>
                          </div>
                        
                          <div class="col-md-3 nopadding">
                            <div class="well black text-center">
                              {if $result.parent}
                                {$result.parent_views|number_format} views
                              {else}
                                {$result.views|number_format} views
                              {/if}
                            </div>
                          </div>
                          
                          <div class="col-md-2 nopadding">
                            <a href="{$config.url}blogs/article/{$result.article_id}" class="button text-center">VIEW</a>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  {/foreach}
            
          
                {/if}
                <div class="text-center">
          
                        {$pages}
                
                  </div>
            
        
              {elseif $GET.query}
              <div class="alert alert-error">
                No results to display
              </div>
              {/if}
		    </div>
		  </div>