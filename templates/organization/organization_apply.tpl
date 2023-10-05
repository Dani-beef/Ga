{if $can_apply}
				<blockquote>
            {if $org.app_intro}
              {$org.app_intro}
            {else}
              There is no intro set for the applications. You can write whatever comes to mind.
            {/if}
		  	</blockquote>
			
			
			
				<form method="post" action="#">
				
				<textarea name="content" class="glass-input" placeholder="Your application [max {$config.org_application_size} characters]">{$smarty.post.content}</textarea>
					<br/><br/>
				<input type="submit" value="Send application"/>

				</form>
				<br/>
				<div class="well text-center black">
					Take care when deciding what to write in your application. It can be a decisive factor.
				</div>
			
		{elseif $myApplication}
		<div class="well black">
		  {$myApplication.created}
		  <hr/>
		  {$myApplication.content}
		</div>
		
		{/if}