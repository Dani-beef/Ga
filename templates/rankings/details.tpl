{include file="header_home.tpl"}

<h1 class="text-center" style="color:rgb(199, 199, 199);font-size:30px;"> 
  <span class="glyphicon glyphicon-king" style="font-size:100px"></span>
</h1>


<div class="panel panel-white panel-white-card" style="text-transform:uppercase"> 
  <div class="panel-body">

    <h2 class="white-holder">Ranks</h2> 

    <div class="row "> 
      <div class="col-xs-6   ">
        Global Rank
      </div> 
      <div class="col-xs-6 ">
        #{$user.rank|number_format}         
      </div> 
    </div> 

    <div class="row "> 
      <div class="col-xs-6 ">
        Zone Rank
      </div> 
      <div class="col-xs-6 ">
        #{$user.zrank|number_format}         
      </div> 
    </div> 

    <h2 class="white-holder">Points from</h2>

    <div class="row "> 
      <div class="col-xs-6 ">
        Achievements
      </div> 
      <div class="col-xs-6 ">
        {$details.achievement_points|number_format}         
      </div> 
    </div> 

    <div class="row "> 
      <div class="col-xs-6 ">
        Missions
      </div> 
      <div class="col-xs-6 ">
        {$details.quest_points|number_format}         
      </div> 
    </div> 

    <div class="row "> 
      <div class="col-xs-6 ">
        Skills
      </div> 
      <div class="col-xs-6 ">
        {$details.skill_points|number_format}         
      </div> 
    </div> 

    <div class="row "> 
      <div class="col-xs-6 ">
        Organization
      </div> 
      <div class="col-xs-6 ">
        {$details.org_points|number_format}         
      </div> 
    </div> 

    <div class="row "> 
      <div class="col-xs-6 ">
        Total
      </div> 
      <div class="col-xs-6 ">
        {$details.total_points|number_format}         
      </div> 
    </div> 

  </div> 
</div>