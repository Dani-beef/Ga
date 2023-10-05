 <div class="well">

                        <h3 style="margin-top:10px; margin-bottom:10px;"><a href="{$f.url}">{$f.name}</a> <span style="font-size:13px">{$f.threads|number_format} threads</span></h3>
                        <p>{$f.description}</p>
                        {if $f.last_post_id}
                        	<div class="text-right">
                        		<small><a href="{$furl}tid/{if $f.last_parent}{$f.last_parent}{else}{$f.last_post_id}{/if}">last post</a> by {$f.last_user|profile_link} {$f.last_created}</small>
                        	</div>
                        {/if}
                
                                  
                       </div>