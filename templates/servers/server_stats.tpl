
<style>

  .server-stats-bar .progress{
  
                          background-color:rgba(255, 255, 255, 0.08); border:1px solid rgba(255, 255, 255, 0.07); height: 100%;
                        border-radius:3px;
                         -webkit-transition-property: color, border, background-color;
    -webkit-transition-duration: .3s,.3s,.3s;
    -webkit-transition-timing-function: ease-in,ease-in,ease-in;

    -moz-transition-property: color, border, background-color;
    -moz-transition-duration: .3s,.3s,.3s;
    -moz-transition-timing-function: ease-in,ease-in,ease-in;


    -o-transition-property: color, border, background-color;
    -o-transition-duration: .3s,.3s,.3s;
    -o-transition-timing-function: ease-in,ease-in,ease-in;
                      
  }

  .server-stats-bar .progress-holder{
    height:40px;line-height:36px; background-color:rgba(255, 255, 255, 0.05);
    border-radius:3px;
    position:relative;
    border:1px dashed rgba(255, 255, 255, 0.05); 

  }
  .server-stats-bar .progress-label
  {
    width:100%;text-align:center;
    position:absolute;
    top:0;left:0;
      cursor:default!important;
  }

  .server-stats-bar .progress-holder:hover .progress{
    background-color:rgba(255, 255, 255, 0.10);

  }
  .server-stats-bar .progress-holder.round-progress .progress{
    border-radius:20px;

  }

  .server-stats-bar .progress-holder.round-progress {
    border-radius:20px;
  }

  .server-stats-bar .progress-holder.bordered-progress{
    border:0;
      border-top: 2px solid rgba(85, 85, 90, 0.66);
  border-bottom: 2px solid rgba(85, 85, 90, 0.66);
  background-color: rgba(0, 0, 0, 0.05);border-radius:0;

  }
  .server-stats-bar .progress-holder.bordered-progress .progress
  {
    border-radius:0;
      background-color: rgba(85, 85, 90, 0.23);
      border:0;
  }

  .server-stats-bar .progress-holder.border-top-bottom {
      border: 0;
      border: 1px dashed rgba(13, 107, 182, 0.28);
  border-bottom: 2px solid rgba(45, 152, 236, 0.81);
  background-color: rgba(0, 0, 0, 0.05);
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  border-radius:6px;
  }
  .server-stats-bar .progress-holder.border-top-bottom .progress{
      border-radius: 0;
  background-color:rgba(13, 107, 182, 0.31);
  border: 0;
  border-radius:5px;
  border-bottom-right-radius:0;
  }

  .server-stats-bar .progress-holder.border-top-bottom:hover .progress
  {
     background-color: rgba(13, 107, 182, 0.41);
  }


  .server-stats-bar .progress-holder.border-left-right
  {
     border: 0;
           border: 1px dashed rgba(13, 107, 182, 0.28);

  border-left: 2px solid rgba(45, 152, 236, 0.81);
  border-right: 2px solid rgba(45, 152, 236, 0.81);
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 4px;

  }



  .server-stats-bar .progress-holder.border-left-right .progress{
      border-radius: 0;
  background-color: rgba(13, 107, 182, 0.31);
  border: 0;
  }

  .server-stats-bar .progress-holder.border-left-right:hover .progress
  {
     background-color:rgba(13, 107, 182, 0.41);
  }

</style>
    


<div class="panel panel-glass text-center" style="background:none;  border-top: 0;
border-bottom: 0;
border-radius: 5px;">
  <div class="panel-body server-stats-bar">

      <div class="row">
        <div class="col-md-12">
      <p>CPU {$server->server.cpu_usage_percent}% [{$server->server.cpu_usage|number_format}/{$server->server.total_cpu|number_format}]</p>

      <div class="progress-holder border-left-right mb10" style="height:18px;">
        <div class="progress" style="width:{$server->server.cpu_usage_percent}%;"></div>
        
      </div>
    </div>
    
  </div>
    <div class="row">
      <div class="col-md-6">
          <div class="progress-holder border-top-bottom mb10">
            <div class="progress" style="width:{$server->server.ram_usage_percent}%;"></div>
            <div class="progress-label">
                <small>{$server->server.ram_usage_percent}% RAM [{$server->server.ram_usage|number_format}/{$server->server.total_ram|number_format}]</small>
            </div>
        </div>
      </div>
      <div class="col-md-6">
          <div class="progress-holder border-top-bottom mb10">
            <div class="progress" style="width:{$server->server.hdd_usage_percent}%;"></div>
            <div class="progress-label">
                <small>{$server->server.hdd_usage_percent}% HDD [{$server->server.hdd_usage|number_format}/{$server->server.total_hdd|number_format}]</small>
            </div>
        </div>
      </div>
    </div>
  
            
      

  </div>
</div>