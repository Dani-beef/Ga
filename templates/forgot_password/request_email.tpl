{include file="header_home.tpl" no_sidebar=true no_menu=true}

    

      <div class="row text-center" style="margin-top:100px">
        <div class="col-md-6 text-left inline nofloat">
          {include file="error_success.tpl"}
          
           <div class="alphaGlow mb10">
     
            <form method="post">
              <button disabled class="disabled">forgot username <span class="glyphicon glyphicon-lock"></span> password combo</button>
              <input type="hidden" name="process" value="true"/>
              <input style="border-top:0" type="email"  placeholder="Email" value="{$smarty.post.email}" name="email" required />
           
			  <button type="submit" style="border-top:0;"><span class="glyphicon glyphicon-send"></span></button>
            </form>
          </div>
          <br/>
          
          <div class="well black text-center nomargin">

            Please contact our team if you encounter any problems.
          </div>
          <a href="{$config.url}" class="button text-center"><span class="glyphicon glyphicon-home"></span></a>
        </div>
      
      </div>
    	

						
	

		
  						
		
  						