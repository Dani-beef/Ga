{include file="header_home.tpl" no_sidebar=true no_menu=true}

<script src='{$config.url}layout/js/register.js'></script>
{if $smarty.post.zone}

<script>
$(document).ready(function(){
$("#zone_{$smarty.post.zone}").click();
});
</script>


{/if}
      <div class="row text-center mb10">
        <div class="col-md-10  inline text-center welcomeHacker" style="float:none">
          "Without the fear of our enemies, our bravery is meaningless"
        </div>
      </div>


      <div class="row text-center" >

        <div class="col-md-7 registration-form Danlor-A-trans">



          {include file="error_success.tpl"}

            <div class="alphaGlow">
            <form method="post">
              <input type="hidden" name="process" value="true"/>
			  <div class="well black text-center nomargin">
			  	 Would you rather live a life of what if's or a life of oh well's?
				</div>
              <div class="row-fluid">
                <div class="col-md-6 col-xs-6 nopadding">
                  <input  type="text" maxlength="15" autocomplete="off" placeholder="Username" value="{if $smarty.post.username}{$smarty.post.username}{else}{$data.username}{/if}" name="username"  required/>
                </div>

                <div class="col-md-6 col-xs-6 nopadding">

                  <input  type="email" maxlength="255" autocomplete="off"  placeholder="E-mail (confirmation required)" value="{if $smarty.post.email}{$smarty.post.email}{else}{$data.email}{/if}" name="email" required />

                </div>

              </div>

              <input style="border-top:0;border-bottom:0;"  type="password" maxlength="20" autocomplete="off"  placeholder="Password" value="{$smarty.post.password}" name="password" required />
              <div class="row">
                <div class="col-md-12">
                  <div class="row-fluid">
                    {for $z=1 to 6}
                      <div class="col-md-2 col-xs-2 col-sm-2 nopadding">
                        <input type="checkbox" name="zone" value="{$z}" class="nodisplay" id="zone_{$z}_checkbox" />
                        <a class="button text-center zoneSelect" id="zone_{$z}" data-zone="{$z}" style="opacity:1">Zone {$z|romanic_number}</a>
                      </div>
                    {/for}
                  </div>
                </div>
              </div>

              <div class="well black text-center nomargin " >
                <div id="zone_info">
                  Zones have long replaced countries in the new world order. The world is delimited in 6 major zones, each with its own unique qualities.
                </div>
              </div>

               <div class="row">
                <div class="col-md-12">
                  <div class="row-fluid">
                    <div class="col-md-8 col-xs-7 nopadding cut-text">
                      <input type="checkbox" name="terms" class="nodisplay" id="terms" {if $smarty.post.terms}checked{/if}/>
                      <a href="{$config.url}pages/page/terms-of-service/" target="_blank" class="button text-center">ACCEPT OUR TOS & PRIVACY POLICY</a>
                    </div>
                    <div class="col-md-4 col-xs-5 nopadding">
                      <a class="button text-center" id="terms_button" onclick="doCheckboxToggle2('terms');" {if !$smarty.post.terms}style="opacity:.6"{/if}><span class="glyphicon glyphicon-ok" ></span></a>
                    </div>
                  </div>
                </div>
              </div>
        		<button type="submit" style="border-top:0;">OBTAIN CITIZENSHIP</button>

            </form>
            </div>

          <br/><br/><br/><br/>
          <div class="well black text-center nomargin">
           Back home?

          </div>
          <a href="{$config.url}" class="button text-center"><span class="glyphicon glyphicon-home"></span></a>
        </div>

      </div>
