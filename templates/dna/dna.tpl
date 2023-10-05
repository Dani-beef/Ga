{include file="header_home.tpl"}

{include file="profile/profile_header.tpl"}
<br/>
<div class="text-center">
	<a href="{$config.url}dna">
		<img src="http://www.gravatar.com/avatar/{$user.gavatar}?s=150" style="border-radius:50%;opacity:.8" title="DNA Management Interface Main Screen" />
	</a>
</div><br/>

	<div class="row mb10">
		<div class="col-xs-2">
			<a href="{$config.url}dna/sessions/show">
				<button>sessions</button>
			</a>
		</div>
		<div class="col-xs-2">
			<a href="{$config.url}referrals">
				<button>REFERRALS</button>
			</a>
		</div>
		<div class="col-xs-2">
			<a href="https://en.gravatar.com/" target="_blank" rel="nofollow">
				<button>AVATAR</button>
			</a>
		</div>

		<div class="col-xs-2">
			<a href="{$config.url}support">
				<button>support</button>
			</a>
		</div>


	</div><br/><br/>
        {include file="error_success.tpl"}

		{if $load eq 'sessions'}
			<div class="alert alert-info">
				These are your current sessions registered in our Alpha database. You can cancel any session you consider suspect. If you cancel your own session you will find yourself automatically logged out after a few seconds.
			</div>

			{foreach from = $sessions item = entry}

					<div class="row">
						<div class="col-xs-3">
								<button disabled class="mb10">
							{$entry.time}
							</button>
						</div>

						<div class="col-xs-3">
						<button disabled class="mb10">
							{$entry.ip}
							</button>
						</div>
						<div class="col-xs-4">
						<button disabled class="mb10">
							{if $entry.table}TABLET{elseif $entry.mobile}MOBILE{else}DESKTOP/LAPTOP/OTHER DEVICE{/if}
							</button>
						</div>
						<div class="col-xs-2">
							<form method="post">
								<button type="submit" name="cancel" value="{$entry.id}">CANCEL</button>
							</form>
						</div>
					</div>

			{/foreach}
		{else}
        <div class="row">

              <div class="col-md-6">

					<h1 class="text-center"><span class="glyphicon glyphicon-link"></span></h1>
					<br/>
                <div class="well black text-center">
                  Add social networks to login directly and enhance your experience.
				  <br/>We will respect your privacy and will not post in your name.
				  <br/>Link the first three to earn the <a href="{$config.url}achievements"><strong>Social Madness</strong> achievement</a>.
                </div>

				{foreach from = $socialAccounts item = socialAccount}
				<div class="row mb10">
						<div class="col-md-6 col-xs-6">
							<button disabled>{$socialAccount.provider|ucfirst}</button>
						</div>
						<div class="col-md-6 col-xs-6 cut-text">
							{if $socialAccount.linked}
								<a href="{$socialAccount.profile_link}" class="button text-center" target="_blank">{$socialAccount.name}</a>

							{else}
								 <a href="{$config.url}socialConnect/{$socialAccount.provider}/connect" class="button text-center"><span class="glyphicon glyphicon-link"></span></a>
							{/if}
						</div>
					</div>
				{/foreach}


                <br/>
                <h1 class="text-center" id="changeUsername"><span class="glyphicon glyphicon-font"></span></h1><br/>

                <div class="alert alert-info">
						Changing your username requires 50 Alpha Coins.
					</div>
					<form method="post">
					<div class="row mb10">
					  <div class=" col-xs-8">
						<input type="text" value="{$user.username}" name="username" maxlength="15" placeholder="Username"/>
					  </div>
					  <div class=" col-xs-4">

						  {if $user.alphaCoins >= 50}
							<button type="submit" title="Change username"><span class="glyphicon glyphicon-record"></span></button>
						  {else}
							<a href="{$config.url}alpha_coins" class="button text-center">MORE A-C</a>
						  {/if}

					  </div>
					</div>
					</form>


                <div class="row">
                  <div class=" col-xs-8">
                    <div class="well black">A.I. Voice ON/OFF</div>
                  </div>
                  <div class=" col-xs-4">
                    <form method="post">
					 {if $smarty.session.premium.ai gt time() || $user.cardinal}
                      {if $user.aiVoice}
                        <input type="submit" name="aiVoice" value="Enabled"/>
                      {else}
                        <input type="submit" name="aiVoice" value="Disabled"/>
                      {/if}
					  {else}
					  	<a href="{$config.url}alpha_coins" class="button text-center">ACTIVATE</a>
					  {/if}
                    </form>
                  </div>
                </div>

				 <br/>
                <h1 class="text-center" id="youtube"><span class="glyphicon glyphicon-star-empty"></span></h1><br/>
				<div class="alert alert-info">
					Specify an Youtube Video Code  and it will appear on your profile (https://www.youtube.com/watch?v=<strong>XXXXXXXX</strong> <- video code).
				</div>
            	<form method="post" action="#youtube">
					<div class="row mb10">
					  <div class=" col-xs-8">
						<input type="text" value="{$youtube}" name="youtube" maxlength="20" placeholder="Fav. Youtube Video Code"/>
					  </div>
					  <div class=" col-xs-4">

							<button type="submit" title="Change video"><span class="glyphicon glyphicon-record"></span></button>


					  </div>
					</div>
					</form>



              </div>
              <div class="col-md-6">
			  	<h1 class="text-center"><span class="glyphicon  glyphicon glyphicon-envelope"></span></h1>
				<br/>
				 <form method="post">
				 <div class="alert alert-info">
You can change your avatar <a href="https://en.gravatar.com/" target="_blank" rel="nofollow">here (https://en.gravatar.com)</a> by registering with the email we have on record.
</div>
					<div class="alert alert-info">
						If you update your email, we will resend a confirmation link to the new one.
					</div>
                  <div class="row mb10">
                    <div class="col-md-12">
                      <div class="row-fluid">
                        <div class="col-md-4 col-xs-5 nopadding">
                          <a class="button text-center">EMAIL</a>
                        </div>
                        <div class="col-md-8 col-xs-7 nopadding">
                          <input type="email" name="email"  style="border-left:0" placeholder="Email" value="{$email}"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mb10">
                    <div class="col-md-12">
                      <div class="row-fluid">
                        <div class="col-md-4 nopadding">

                        </div>
                        <div class="col-md-8 nopadding">

						  <button type="submit"><span class="glyphicon glyphicon-record"></span></button>
                        </div>
                      </div>
                    </div>
                  </div>




                </form>
				<br/>
					<h1 class="text-center"><span class="glyphicon glyphicon-lock"></span></h1>
				<br/>

                <form method="post">
				{if $no_pass}
					<div class="alert alert-warning">
						You have not setuped a password for direct authentication (username & password combo). You've probably registered using a Social Account. We recommend you set a password now!
					</div>
				{/if}
                {if !$no_pass}
                  <div class="row mb10">
                    <div class="col-md-12">
                      <div class="row-fluid">
                        <div class="col-md-4 col-xs-5 nopadding">
                          <a class="button text-center">OLD PASS</a>
                        </div>
                        <div class="col-md-8 col-xs-7 nopadding">
                          <input type="password" name="old" style="border-left:0"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  {/if}
                  <div class="row mb10">
                    <div class="col-md-12">
                      <div class="row-fluid">
                        <div class="col-md-4 col-xs-5 nopadding">
                          <a class="button text-center">NEW PASS</a>
                        </div>
                        <div class="col-md-8 col-xs-7 nopadding">
                          <input type="password" name="new"  style="border-left:0"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mb10">
                    <div class="col-md-12">
                      <div class="row-fluid">
                        <div class="col-md-4 nopadding">

                        </div>
                        <div class="col-md-8 nopadding">

						  <button type="submit" name="change" value="true"><span class="glyphicon glyphicon-record"></span></button>
                        </div>
                      </div>
                    </div>
                  </div>




                </form>




              </div>


        </div>



				{/if}
