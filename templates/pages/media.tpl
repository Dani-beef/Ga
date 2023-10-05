{include file="header_home.tpl" }
<h1>Artwork</h1>
<hr/>
<h5>Special thanks to Razor (R.B.) 4 these designs</h3>
<br/><br/>
<style>
	.artwork img{
	max-width:100%;
	
	opacity:.8;
	}
	.artwork img:hover{
	opacity:1;
	}
</style>
<div class="artwork">
<div class="row text-center">
	<div class="col-md-4 ">
		<div class="panel panel-glass">
			<div class="panel-heading">Danlor</div>
			<div class="panel-body">
			<img src="{$config.url}layout/img/characters/Danlor-A.png"/>
			</div>
		</div>
	</div>
	<div class="col-md-4 ">
		<div class="panel panel-glass">
			<div class="panel-heading">Etta</div>
			<div class="panel-body">
			<img src="{$config.url}layout/img/characters/etta_medium.png"/>
			</div>
		</div>
		</div>
	<div class="col-md-4 ">
		<div class="panel panel-glass">
			<div class="panel-heading">Irene</div>
			<div class="panel-body">
			<img src="{$config.url}layout/img/characters/Irene-A.I.png"/>
			</div>
		</div>
		</div>
	<div class="col-md-8 ">
		<div class="panel panel-glass">
			<div class="panel-heading">Mary</div>
			<div class="panel-body">
		<img src="{$config.url}layout/img/characters/Mary-A.I.png"/>
			</div>
		</div>
		</div>
	<div class="col-md-4 ">
		<div class="panel panel-glass">
			<div class="panel-heading">Rainless</div>
			<div class="panel-body">
		      <img src="{$config.url}layout/img/characters/rainless.png"/>
			</div>
		</div>
		</div>
	<div class="col-md-4 ">
		<div class="panel panel-glass">
			<div class="panel-heading">eVe</div>
			<div class="panel-body">
		      <img src="{$config.url}layout/img/characters/eve.png"/>
			</div>
		</div>
			
		
		</div>
	<div class="col-md-4 ">
		



				<div class="panel panel-glass">
			<div class="panel-heading">Logo art</div>
			<div class="panel-body">
		     <img src="{$config.url}layout/img/logo-art.png"/>
			</div>
		</div>
		</div>
	<div class="col-md-4 ">
				<div class="panel panel-glass">
			<div class="panel-heading">Logo art</div>
			<div class="panel-body">
		     <img src="{$config.url}layout/img/logo-art2.png"/>
			</div>
		</div>
			
		</div>
	
	
	<div class="col-md-4 ">
				<div class="panel panel-glass">
			<div class="panel-heading">Data Points</div>
			<div class="panel-body">
		     <img src="{$config.url}layout/img/dataPoint.png"/>
			</div>
		</div>
			
		</div>
	
	
	{foreach from=$abilities key=abilityKey item=ability}
	<div class="col-md-4 ">
				<div class="panel panel-glass">
			<div class="panel-heading"> {$ability.name}</div>
			<div class="panel-body">
		    <img src="{$config.url}layout/img/modules/abilities/{$ability.image}" />
			</div>
		</div>
			
		</div>
	
	

    
	{/foreach}
</div>