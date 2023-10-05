{include file="header_home.tpl" }


{include file="dialogs/osx_dialog_box.tpl" id="editname" title="Edit name" content='
<div style="padding:20px">
	 <div class="alert alert-warning">Name change costs {$nameChangeHpCost} hacking points</div>
	<form method="post" action="#">
		<input type="hidden" name="form" value="cname"/>
		<div class="row mb10">
		<div class="col-xs-4">
		<input type="text" name="tag" maxlength="4" value="{$org.tag}"/>
		</div>
		<div class="col-xs-8">
	  <input type="text" name="name" maxlength="{$config.org_name_size}" value="{$org.name}"/>
	  </div>
	  </div>
	  
		<input type="submit" value="Update"/>
	</form>
</div>
 '}
 <h1>H1 h1</h1>
 <h2>H2 h2</h2>
 <h3>H3 h3</h3>
 <h4>H4 h4</h4>
 <h5>H5 h5</h5>
 <h6>H6 h6</h6>
 
<div class="panel panel-future">
	<div class="panel-body">
	test panel-future
	</div>
</div>

 <div class="futureNav  ">
       <ul>
		<li><a href="{$config.url}organization/view/core/manage/forum"><span class="glyphicon glyphicon-comment"></span></a></li>

		<li><a href="{$config.url}organization/view/core/manage/intros">Intros</a></li>

		


	</ul>
</div>

<div class="futureNav middle ">
       <ul>


		<li><a >Org. name</a></li>

		<li><a href="{$config.url}organization/view/disband/">Disband</a></li>

	</ul>
</div>


<div class="futureNav little ">
       <ul>


		<li><a >Org. name</a></li>

		<li><a href="{$config.url}organization/view/disband/">Disband</a></li>

	</ul>
</div>

<div class="row">

<div class="col-md-3">
<div class="panel panel-future">
	<div class="panel-heading">
	sdf
	</div>
	<div class="panel-body">
	test panel
	</div>
	<div class="panel-footer">
	footer
	</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-glass">
	<div class="panel-heading">
	sdf
	</div>
	<div class="panel-body">
	test panel
	</div>
	<div class="panel-footer">
	footer
	</div>
</div>
</div>


<div class="col-md-3">
<div class="panel panel-future">
	<div class="panel-heading">
	sdf
	</div>
	<div class="panel-body">
	test panel
	</div>
	<div class="panel-footer">
	footer
	</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-white">
	<div class="panel-heading">
	sdf
	</div>
	<div class="panel-body">
	test panel
	</div>
	<div class="panel-footer">
	footer
	</div>
</div>
</div>

</div>
<div class="row">
	<div class="col-md-6">
<div class="well">
well
</div>
	</div>
	<div class="col-md-6">
<div class="well black">
well
</div>
	</div>
</div>

{$pages}


<style>
html {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0)!important;
}
	
</style>
<div class="row">
	<div class="col-md-3">
		<button href="#myModaleditname" data-toggle="modal">test</button>
	</div>
	<div class="col-md-3">
		<button disabled>test</button>
	</div>

	<div class="col-md-3">
		<input type="text" placeholder="default"/>
	</div>
	<div class="col-md-3">
		<select class=""><option>sdf</option></select>
	</div>
</div>
<br/><br/>
<Div class="row">
	<div class="col-md-3">
		<button class="button-white">button-white</button>
	</div>

	<div class="col-md-3">
		<input type="text" class="glass-input" placeholder="glass-input"/>
	</div>
	<div class="col-md-3">
				<select class="glass-input"><option>sdf</option></select>
			</div>
		<div class="col-md-3">
			<style>
			select{
				cursor:pointer;
			}
			input[type=radio]
			{
				cursor:pointer;
				-webkit-appearance: none;
				 border: 2px solid rgb(129, 173, 207);
				 padding: 7px;background-color: transparent;
				 border-radius:50%;
				 -webkit-transition-property: background-color;
    -webkit-transition-duration: .3s;
    -webkit-transition-timing-function: ease-in;
	-moz-transition-property: background-color;
    -moz-transition-duration: .3s;
    -moz-transition-timing-function: ease-in;
	-o-transition-property: background-color;
    -o-transition-duration: .3s;
    -o-transition-timing-function: ease-in;
			}
			input[type=checkbox]
			{
				cursor:pointer;
				  background-color: transparent;
  border: 2px solid rgb(129, 173, 207);
  -webkit-appearance: none;
  padding: 7px;
  border-radius: 3px;
  outline:none!important;
  -webkit-transition-property: background-color;
    -webkit-transition-duration: .3s;
    -webkit-transition-timing-function: ease-in;
	-moz-transition-property: background-color;
    -moz-transition-duration: .3s;
    -moz-transition-timing-function: ease-in;
	-o-transition-property: background-color;
    -o-transition-duration: .3s;
    -o-transition-timing-function: ease-in;

			}
			input[type=checkbox]:checked,input[type=radio]:checked
			{
				background-color:rgb(129, 173, 207);
			}

			</style>
			<input type="checkbox">
			<input type="checkbox" checked>
			<input type="radio" value="option2" checked>
			<input type="radio" value="option2">
		</div>
</div>
<br/>
<br/>
<Div class="row">
	<div class="col-md-6">
		<textarea>

			sadf
			asdf
			asdf</textarea>
	</div>

	<div class="col-md-6">
		<textarea class="glass-input">
			saf
			saf
			sa
			df</textarea>
	</div>
</div>


<br/>
<div class="alert alert-danger">
d
</div>
<div class="alert alert-warning">
w
</div>
<div class="alert alert-success">
s
</div>
<div class="alert alert-info">
i
</div>

<div class="row">
	<div class="col-md-4">
		<div class="button-stack">
			<button>A</button>
			<button>B</button>
			<button>A</button>
			<a href="" class="button">B</a>
		</div>
	</div>
</div>

<br/><br>
<div class="row">
	<div class="col-md-6">
		<blockquote>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
	</div>
	<div class="col-md-6">
		<blockquote class="pull-right">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
</div>
</div>
<style>
	.glass-timeline
	{
		border-left:5px solid rgba(8, 123, 194, 0.4);
		margin-top:30px;
	}
	.glass-timeline .time-point
	{
		margin-left:30px;
		margin-top:30px;
	}
		.glass-timeline .time-point .time-ball
		{
			float:left;
			position:relative;
			width:20px; height:20px;background-color:rgb(0, 0, 0);border-radius:50%;
			border:2px solid rgba(8, 123, 194, 0.4);
			top:-5px;
			left:-42.5px;
		}
</style>
<div class="glass-timeline">
	<div class="time-point">
		<div class="time-ball"></div>
		<div class="well">
			test
		</div>
	</div>
	<div class="time-point">
		<div class="time-ball"></div>
		<div class="well">
			test
		</div>
	</div>

</div>

<div class="row">
	<div class="col-md-8"> <h1 class="text-center" style="text-transform:uppercase; color:rgb(199, 199, 199);font-size:30px;"> <span class="glyphicon glyphicon-gift" style="font-size:100px"></span><br><br>
          Job work</h1><br> <div class="panel panel-white panel-white-card" style="text-transform:uppercase"> <div class="panel-heading">Claimed 1 year and 1 month ago</div> <div class="panel-body"> <div class="row"> <div class="col-md-7 ">
                        Money
                    </div> <div class="col-md-5 ">
                        70$
                    </div> </div> <div class="row"> <div class="col-md-7 ">
                        Job Experience
                    </div> <div class="col-md-5 ">
                        16 points
                    </div> </div> <h2 class="white-holder">skills</h2> <div class="row "> <div class="col-xs-9 text-left">
                                 Intrusion detection
                            </div> <div class="col-xs-3  text-right">
                               1 points
                            </div> </div> <div class="row "> <div class="col-xs-9 text-left">
                                 Dynamic Programming
                            </div> <div class="col-xs-3  text-right">
                               1 points
                            </div> </div> </div> </div> </div>
                        </div>