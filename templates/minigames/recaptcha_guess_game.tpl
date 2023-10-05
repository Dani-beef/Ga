
 <script type="text/javascript">
 var RecaptchaOptions = {
    theme : 'white'
 };
 </script>
<style>
  #recaptcha_widget_div{
    display:inline-block;
  }
</style><br/>
<div class="text-center">	
  <form method="post" class="text-center">
	
      {$captcha}
      <br/><br/>
      <input type="submit" value="Send" />
  </form>
</div>
<br/>
<div class="blue-box">
{$gdata.step}/{$gdata.count} remaining
</div>