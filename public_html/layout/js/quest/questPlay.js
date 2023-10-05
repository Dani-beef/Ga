/*
  questPlay plugin for TSR
  
  Created by Nenu Adrian Mircea (http://nenuadrian.com) 
  All rights reserved
  2014 - *
*/

 

             
function add_input(text){
      $("#consoleInput").val($("#consoleInput").val() + text).focus();
  }
               
jQuery.fn.questPlay = function(userOptions)
{
	//alert(2);
  // Default options
  var options = {
    username: "unknown",
    actionStart: false,
    actionStartTime: 0,
    actionStartTitle: "",
    debug   : false,
    currentObjective : 0,
    hackdown : "#theHackdown",
	in_party : false,
  };
  
  $.extend(options, userOptions);
  
  
  var user = options.username;
  
  function playMissionVoice(file)
  {
    var url = main_url + 'mp3/eve/';
    $('#mission-voice-mp3')[0].src = url + file + '.mp3';
    $('#mission-voice-ogg')[0].src = url + 'ogg/' + file + '.ogg';
    $('#mission-voice')[0].load();
    $('#mission-voice')[0].play();
    
  }
  function fadeOut(element, f) {
      var op = 1;  // initial opacity
      var timer = setInterval(function () {
          if (op < 0.1){
              clearInterval(timer);
              element.style.display = 'none';
              f();
          }
          element.style.opacity = op;
          element.style.filter = 'alpha(opacity=' + op * 100 + ')';
          op -= op * 0.1;
      }, 50);
  }

  function fadeIn(element, f) {
      var op = 0;  // initial opacity
      element.style.display = 'block';
      var timer = setInterval(function () {
          if (op > 0.9){
              clearInterval(timer);
              f();
          }
          element.style.opacity = op;
          element.style.filter = 'alpha(opacity=' + op * 100 + ')';
          op += 0.1;
      }, 50);
  }
  
	function strip(html)
{
   var tmp = document.createElement("DIV");
   tmp.innerHTML = html;
   return tmp.textContent || tmp.innerText || "";
}
	
  function add_console(text, notStrip){
	  // text = $("div.someClass").text(text).html();
	if (typeof notStrip === "undefined")
    	$("#theConsole").append(strip(text)+"<br/>");	
	 else
    	$("#theConsole").append(text+"<br/>");	
    $("#theConsole").scrollTop($("#theConsole").get(0).scrollHeight);
  }
  var system="";
  var lastc=new Date().getTime();
  
  function console_input(console_input, noOutput){
	if (typeof updateTimer !== "undefined")
		{
	  clearInterval(updateTimer);
	    updateTimer = setInterval(updateTimerTick, 4000);
		}
    if(!noOutput)
    	add_console("<strong>#"+user+"</strong>: "+console_input);
      var finish=false;
	  
     $.post(url,{ console : console_input, json : 1, currentObjective:options.currentObjective },
         function(data){
	
          check_output(data);
          console.log(data);
         },"json") .fail(function(data) {
    	
  		});;
    }
    function check_output(data){
      
      if(data.result){				
        add_console(system+""+data.result, true);
      }else if (data.error){
        add_console(system+""+data.result, true);
      }
      
      if (data.unknownCommand)
      {
        Messenger().post({
                    message: "Unknown command or broken syntax. Make sure the service you are currently logged on accepts the attempted command.",
                    type:"error"
                  });
      }
	 
		
      if(taskCompleted && !data.taskCompleted && data.countdown)
      {
		 // alert(3);
        actionStart(data.countdown, data.countdownTitle);
        Messenger().post({
            message: data.countdownTitle,
            type: 'success',
          });

      }
      if(data.refresh)
          refresh();
          
      if(data.currentObjective)
      {
        options.currentObjective = data.currentObjective;
       
      }
		
      if(data.remainingSeconds)
	  {
		 
		  $(options.hackdown).data("hackdown").updateTime(data.remainingSeconds, data.totalSeconds);
	  }
        
      if (data.newObjective)
      {
        fadeOut($('#objectiveStory')[0], function(){  
              $('#objectiveStory')[0].innerHTML = data.newObjective;
             fadeIn($('#objectiveStory')[0], function(){
              scrollToElement('#objectiveStoryContainer');
             }); 
             
            });
       
        Messenger().post({
            message: "A mission objective has been completed",
            type: 'success',
          });
       
      }
      if(data.new_ip)
      {
        Messenger().post({
            message: "New IP added to know hosts: " + data.new_ip.ip,
            type: 'success',
          });
          add_new_ip(data.new_ip);
      }
      
      if(data.traceIncrease)
      {
        Messenger().post({
            message: "Trace increased by " + data.traceIncrease + "%",
            type: 'error',
          });
      }
      
       if(data.traceReduce)
      {
        Messenger().post({
            message: "Trace reduced by " + data.traceReduce + "%",
            type: 'success',
          });
      }
      if (data.trace)
        update_trace(data.trace);
        
      if (data.voice)
        playMissionVoice(data.voice);
		
		if (data.taskCompleted)
            {
              taskCompleted = true;
              
            }
    }
  
   
    function add_new_ip(new_ip){
      
    if($('#noDiscovered')[0] && $('#noDiscovered')[0].style.display != 'none')
      fadeOut($('#noDiscovered')[0], function(){  
             addIPtoDiscovered(new_ip);
            });
    else 
      addIPtoDiscovered(new_ip);
      
      
    }
    function addIPtoDiscovered(new_ip)
    {
      var id = $('.point').length + 1;
      content='<a class="point" style="opacity:0" id="ip-' + id + '" onclick="add_input(\''+new_ip.ip+'\');">'+new_ip.ip+' | '+new_ip.hostname+'</a>';
     
      $("#hosts").append(content);
      fadeIn($("#ip-" + id)[0], function(){  
        //$("#ip-" + id).fadeIn('slow');
      });
    }
 
    function update_trace(trace){
      $("#trace")[0].innerHTML = trace;
      $("#trace-progress")[0].style.width = trace + '%';
      
    }
    
    var taskCompleted = true;
    function actionDone(){
        // keep checking if task completed until it is
        // refresh after a couple of tries?
		
        if (taskCompleted)
        {
          $("#task").fadeOut("slow");
			//alert(2);
         // $("#consoleInput, #button").prop('disabled', false);
          add_input("");
          console_input("", true);
        }
        else
        {
			console_input("", true);
			/*
          $.post(url, { json : true, currentObjective:options.currentObjective },function(data){ 
            console.log(data);
            if (data.taskCompleted)
            {
              taskCompleted = true;
              check_output(data);	
            }
           },"json");*/
           
           setTimeout(actionDone, 1000);
          
        }
        
        
         
    }

    function actionStart(time, title){
      $("#taskTitle").text(title);
     
      taskCompleted = false;
      
      $('#theHackdownTask').hackdown({
          "countdownFrom"        : time,
          "totalCountdown"       : time,
          "textCountdown"        : true,
          "textElement"          : "#hackdownTask",
          "progressBarCountdown" : true,
          "progressBarElement"   : "#hackdownProgressBarTask",
          "textFinish"           : "Done",
          "reloadOnFinish"       : false,
          "callOnFinish"         : function(){ window.setTimeout(actionDone, 1000); },

         });
          $("#task").fadeIn("slow");

     // $("#consoleInput, #button").prop('disabled', true);
    }			
    function focusInput(input)
    {
      input.focus();
      var tmpStr = input.val();
      input.val('');
      input.val(tmpStr);
    }
	var updateTimer;
	
	function updateTimerTick(){ 
		console_input("", true);
		console.log("test");
	}
	if (options.in_party === true)
	{
		console.log("test");
		updateTimer = setInterval(updateTimerTick, 5000);
	}
    var browseThroughCommandsIndex = -1;
    if (!localStorage.consoleHistory)
      localStorage.consoleHistory = JSON.stringify([]);
    $('#console_form').submit(function(e) {
     
         var now=new Date().getTime();
         var cons = $("#consoleInput").val();  
         browseThroughCommandsIndex = -1;
         
          commands = JSON.parse(localStorage.consoleHistory);
          commands.unshift(cons);
         
         
         if(commands.length >= 21)
          commands.pop();
          
          localStorage.consoleHistory = JSON.stringify(commands);
         if(now-lastc>=500)
         {
          lastc=now;
              $("#consoleInput").val("").focus();
             if(cons=="clear") $("#theConsole").html("");
             else if(cons){
              console_input(cons);
            }
         }
     
     
       e.preventDefault();
       return false;
    });
    
    $('#notepad').submit(function(e) {
        var content = $('#notepad-area').val();
        if (content.length > 1002)
          alert('Maximum 1000 chars in notepad!');
        else
        $.post(url,{ notepad : content, json : 1 },
         function(data){
            if(data.notepadUpdated)
            {
              Messenger().post({
                message: "Notepad content updated",
                type: 'success',
              });
              if (data.voice)
                playMissionVoice(data.voice);
            }
         // console.log(data);
         },"json");
     
     
       e.preventDefault();
       return false;
    });
      
      
     $("#consoleInput").keydown(function(event) {
   
      if(event.keyCode==38)
      {
        commands = JSON.parse(localStorage.consoleHistory);
        if (browseThroughCommandsIndex + 1 < commands.length)
          browseThroughCommandsIndex+=1;
         
        $("#consoleInput").val(commands[browseThroughCommandsIndex]);
        
        focusInput($("#consoleInput"));event.preventDefault();
      }
      if(event.keyCode==40)
      {
        if (browseThroughCommandsIndex > 0)
        {
          commands = JSON.parse(localStorage.consoleHistory);
          browseThroughCommandsIndex -= 1;
          $("#consoleInput").val(commands[browseThroughCommandsIndex]);
        }else $("#consoleInput").val("");
        
        focusInput($("#consoleInput"));event.preventDefault();
      }
      if (event.keyCode==9)
        event.preventDefault();
        
     });
     
     if (options.actionStart)
     	actionStart(options.actionStartTime, options.actionStartTitle);
 
};