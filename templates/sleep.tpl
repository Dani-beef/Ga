{include file="header_home.tpl"}


			
						
					
								<div class="well">
									Hey, sleeping beauty. You have to wait {$config.sleep_wait/60/60} hours after every nap before you can have another one. Sleeping helps you recover your energy but while you're dreaming you cannot undertake any other task.<br/>
									<br/>
									The world of dreams is a mysterious place. Dark secrets can be revealed by our subcounscious.<br/><br/>
									
									While sleeping you can still visit the home page and the public forums or logout from your account
								</div>	
								<br/>
								
								<div class="well text-center">
									{if $user.can_sleep}
									<form method="post">
										<input type="hidden" name="sleep" value="1"/>
										<button type="submit" class="btn">Enter sleeping pod</button>
									
										</form>
										{$config.sleep_energy_bonus}% of your energy will be restored. You will sleep for {$sleep_time}.
										
									{else}
										{if !$sleeptask}
										
										{include file="progress_bar.tpl" text_left="You can't go Zzzz-ing right now. You'll have to wait until the end of this countdown" remaining=$remaining takes=$config.sleep_wait}
										{else}
										
										{include file="progress_bar.tpl" text_left="You are in the hibernation chamber. Sweet dreams!" remaining=$sleeptask.remaining takes=$config.sleep_period}

										
										{/if}
									{/if}
								</div>	
								{if $sleeptask}
								
								
									<div class="well">
										{if $dream.story}
										
											<strong>After you closed your eyes, a dream reveals itself from the darkness<br/><br/></strong>
											{$dream.story}
											
										{else}
											<strong>A dreamless sleep engulfs you.</strong>
										{/if}
									</div>
								{/if}
							
							
								
	
	{include file="footer_home.tpl"}
		