<script type="text/javascript">
{literal}
var javascript_countdownn{/literal}{$id}{literal} = function () {
	var time_left = 10; //number of seconds for countdown
	var time_total = 10; //number of seconds for countdown
	var output_element_idd = '';
	var keep_counting = 1;
	var no_time_left_message = 'Refreshing in 3 seconds!';
	var ref=false;
 
	function countdownn{/literal}{$id}{literal}() {
		if(time_left < 2) {
			keep_counting = 0;
		}
 
		time_left = time_left - 1;
	}
 
	function add_leading_zero(n) {
		if(n.toString().length < 2) {
			return '0' + n;
		} else {
			return n;
		}
	}
 
	function format_output() {
		var hours, minutes, seconds;
		seconds = time_left % 60;
		minutes = Math.floor(time_left / 60) % 60;
		hours = Math.floor(time_left / 3600);
 
		seconds = add_leading_zero( seconds );
		minutes = add_leading_zero( minutes );
		hours = add_leading_zero( hours );
 
		return hours + ':' + minutes + ':' + seconds;
	}
 
	function show_time_leftt() {
		if(document.getElementById(output_element_idd+'_meter')){
			document.getElementById(output_element_idd+'_meter').setAttribute("style", "width:"+(100-(time_left/(time_total/100)))+"%")
		}
		
		document.getElementById(output_element_idd).innerHTML = format_output();//time_left;
	}
 
	function no_time_left() {
	
		//	document.getElementById(output_element_idd+'_meter').setAttribute("style", "width:0%");
		//$('.'+output_element_idd+'_meter').remove();
		//alert('#'+output_element_idd+'_meter');
		if(!ref){
			setTimeout("refresh();", 3000);
			document.getElementById(output_element_idd).innerHTML = no_time_left_message;
		}else{
			document.getElementById(output_element_idd).innerHTML = "Finished";
		}
	}
 
	return {
		count: function () {
			countdownn{/literal}{$id}{literal}();
			show_time_leftt();
		},
		timer: function () {
			javascript_countdownn{/literal}{$id}{literal}.count();
 
			if(keep_counting) {
				setTimeout("javascript_countdownn{/literal}{$id}{literal}.timer();", 1000);
			} else {
				no_time_left();
			}
		},
		//Kristian Messer requested recalculation of time that is left
		setTimeLeft: function (t) {
			time_left = t;
			if(keep_counting == 0) {
				javascript_countdownn{/literal}{$id}{literal}.timer();
			}
		},
		init: function (t,tt, element_idd,reff) {
			time_left = t;
			time_total = tt;
			ref=reff;
			
			output_element_idd = element_idd;
			javascript_countdownn{/literal}{$id}{literal}.timer();
		}
	};
}();
{/literal}
 </script>