{include file="header_home.tpl"}
{include file="grid/grid_header.tpl"}
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script>
   var battleSimulator = angular.module('battleSimulator',[]);
   
   battleSimulator.controller('simulatorController', ['$scope', '$http', function($scope, $http) {
     $scope.skills = {$skills|json_encode};
     
     $scope.form = { attacker:{ }, defender:{ } };
     $scope.levels = Array.apply(null, Array(60)).map(function (_, i) { return i + 1;});
     $scope.form.attacker.servers = [];
     $scope.form.defender.servers = [];
     $scope.form.attacker.skills = { };
     $scope.form.defender.skills = { };
     
     angular.forEach($scope.skills, function(skill, key) {
     	$scope.form.attacker.skills[skill.skill_id] = 1;
     	$scope.form.defender.skills[skill.skill_id] = 1;
     });
     $scope.addServer = function(to)
     {
     	var server = { };
   	server.skills = { };
   	angular.forEach($scope.skills, function(skill, key) {
     	server.skills[skill.skill_id] = 1;
     });
     
     	if (to == 'attacker')
   	{
   		
   		
   		$scope.form.attacker.servers.push(server);
   	}
   	else
   	{
   		$scope.form.defender.servers.push(server);
   	}
     }
     
      $scope.removeServer = function(from, server)
     {
     	
     	if (from == 'attacker')
   	{
   		var index = $scope.form.attacker.servers.indexOf(server);
   		$scope.form.attacker.servers.splice(index, 1);
   	}
   	else
   	{
   		var index = $scope.form.defender.servers.indexOf(server);
   		$scope.form.defender.servers.splice(index, 1);
   	}
     }
     
     $scope.simulate = function()
     {
     	console.log($scope.form);
   	var data = { simulate: true, simulationData: $scope.form};
   	$http.post(url, data).
   	  success(function(data, status, headers, config) {
   	  console.log(data);
   	    if(data.simulated)
   		{
   			document.location = url + 'simulation/' + data.simulated;
   		}
   		// this callback will be called asynchronously
   		// when the response is available
   	  }).
   	  error(function(data, status, headers, config) {
   		// called asynchronously if an error occurs
   		// or server returns response with an error status.
   	  });
     
     }
   }]);
   
   {literal}
</script>
<div ng-app="battleSimulator">
   <div ng-controller="simulatorController">
      <form method="post">
         <div class="panel panel-glass">
            <div class="panel-heading">Simulation</div>
            <div class="panel-body">
               <div class="panel panel-glass">
                  <div class="panel-heading">ATTACKER</div>
                  <div class="panel-body">
                     <div class="panel panel-glass">
                        <div class="panel-heading">SKILL LEVELS</div>
                        <div class="panel-body">
                           <div class="row">
                              <div ng-repeat="skill in skills">
                                 <div class="col-md-3">
                                    <button disabled class="mb10">{{skill.name}}</button>
                                 </div>
                                 <div class="col-md-3">
                                    <select ng-model="form.attacker.skills[skill.skill_id]" ng-options="level for level in levels" class="mb10">
                                    </select>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-glass">
                        <div class="panel-heading">SERVERS</div>
                        <div class="panel-body">
                           <div class="panel-group" id="attackerServers" role="tablist" aria-multiselectable="true">
                              <div ng-repeat="server in form.attacker.servers">
                                 <div class="row mb10">
                                    <div class="col-md-10">
                                       <a class="button" data-toggle="collapse" data-parent="#attackerServers" href="#attackerServer_{{$index}}" >Server {{$index + 1}}</a>
                                    </div>
                                    <div class="col-md-2">
                                       <button ng-click="removeServer('attacker', server);"><span class="glyphicon glyphicon-remove-sign"></span></button>
                                    </div>
                                 </div>
                                 <div id="attackerServer_{{$index}}" class="panel-collapse collapse " role="tabpanel" >
                                    <div style="padding:20px;">
                                       <h3>Skill levels</h3>
                                       <div class="row">
                                          <div ng-repeat="skill in skills">
                                             <div class="col-md-3">
                                                <button disabled class="mb10">{{skill.name}}</button>
                                             </div>
                                             <div class="col-md-3">
                                                <select ng-model="server.skills[skill.skill_id]" ng-options="level for level in levels" class="mb10">
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <button ng-click="addServer('attacker');"><span class="glyphicon glyphicon-hdd"></span></button>
                     </div>
                  </div>
               </div>
			   <br/><br/>
               <div class="panel panel-glass">
                  <div class="panel-heading">DEFENDER</div>
                  <div class="panel-body">
                     <div class="panel panel-glass">
                        <div class="panel-heading">SKILL LEVELS</div>
                        <div class="panel-body">
                           <div class="row">
                              <div ng-repeat="skill in skills">
                                 <div class="col-md-3">
                                    <button disabled class="mb10">{{skill.name}}</button>
                                 </div>
                                 <div class="col-md-3">
                                    <select ng-model="form.defender.skills[skill.skill_id]" ng-options="level for level in levels" class="mb10">
                                    </select>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-glass">
                        <div class="panel-heading">SERVERS</div>
                        <div class="panel-body">
                           <div class="panel-group" id="defenderServers" role="tablist" aria-multiselectable="true">
                              <div ng-repeat="server in form.defender.servers">
                                 <div class="row mb10">
                                    <div class="col-md-10">
                                       <a class="button" data-toggle="collapse" data-parent="#defenderServers" href="#defenderServer_{{$index}}" >Server {{$index + 1}}</a>
                                    </div>
                                    <div class="col-md-2">
                                       <button ng-click="removeServer('defender', server);"><span class="glyphicon glyphicon-remove-sign"></span></button>
                                    </div>
                                 </div>
                                 <div id="defenderServer_{{$index}}" class="panel-collapse collapse " role="tabpanel" >
                                    <div style="padding:20px;">
                                       <h3>Skill levels</h3>
                                       <div class="row">
                                          <div ng-repeat="skill in skills">
                                             <div class="col-md-3">
                                                <button disabled class="mb10">{{skill.name}}</button>
                                             </div>
                                             <div class="col-md-3">
                                                <select ng-model="server.skills[skill.skill_id]" ng-options="level for level in levels" class="mb10">
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <button ng-click="addServer('defender');"><span class="glyphicon glyphicon-hdd"></span></button>
                     </div>
                  </div>
               </div>
            </div>
       
         <button ng-click="simulate();">Initiate simulation</button>
   </div>
   </form>
</div></div>

{/literal}