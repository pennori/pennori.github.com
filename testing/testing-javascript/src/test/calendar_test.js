// custom user specified calendar styles
$(document).ready(function() {
	var cal1 = $("#dateRange1").continuousCalendar({
		/**
		 * http://reaktor.github.io/jquery-continuous-calendar/
		 */
		weeksBefore 	: 26,
		weeksAfter 		: 26,
		firstDate 		: null,
		lastDate 		: null,
		startField 		: $('input.startDate', this),
		endField 		: $('input.endDate', this),
		isPopup 		: false,
		selectToday 	: false,
		locale 			: 'EN',
		disableWeekends : false,
		disabledDates 	: null,
		minimumRange 	: -1,
		selectWeek 		: false,
		fadeOutDuration : 0,
		callback 		: $.noop,
		theme 			: 'rounded', // rounded, transparent
		customScroll 	: false,
		isRange 		: true
	});
	
	removeTopBottomSpan();
	
	$("#dateRange1").on('calendarChange', function(){
		var start = $('input.startDate').val();
		var end = $('input.endDate').val();
		$('#console1').html(getDateString(start.split("/")) + " | " + getDateString(end.split("/")));
		
		var $form = $("<form/>", {
			id : "form1",
			name : "form1"
		});
		
		$form.append($("<input/>", {
			type : "hidden",
			id : "start",
			name : "start",
			value : getDateString(start.split("/"))
		}));
		
		$form.append($("<input/>", {
			type : "hidden",
			id : "end",
			name : "end",
			value : getDateString(end.split("/"))
		}));
		
		module("calendarChange Test", {
			setup : function(){
				ok(true, "setUp");
			},
			teardown : function(){
				ok(true, "tearDown");
			}
		});
		test("dateRange1 depth1", function(){
			equal(start, $('input.startDate').val(), "start == input.startDate");
			equal(end, $('input.endDate').val(), "end == input.endDate");
			notEqual(start, cal1.calendarRange().start, "start != cal1.calendarRange().start");
			notEqual(end, cal1.calendarRange().end, "end != cal1.calendarRange().end");
			equal(typeof cal1.calendarRange().start, "object", "cal1.calendarRange().start is obejct");
			equal(typeof cal1.calendarRange().end, "object", "cal1.calendarRange().end is obejct");
			ok(0 < start.split("/").length, "start is '/' separated value");
			ok(0 < end.split("/").length, "end is '/' separated value");
			
//			http://dev2-idm.skplanetoneid.com/im/api/TXTest/90000?params={"TRS_NO":"9080878124691765","OPN_MD":"dev","SST_CD":"90000"}
//			http://313.co.kr/community/menu/list
//			local_json
			var result = callAjax($form, 'local_json', null, 'get', 'json', 'application/json; charset=utf-8');
			var jsonResult;

			setTimeout(function() {
				test("dateRange1 depth2", function(){
					ok("200" == result.status, "status is \"200\"");
					ok(4 == result.readyState, "readyState is 4");

//					for ( var key in result) {
//						$("#console1").append(key + " : " + $(result).attr(key) + "<br/>");
//					}
					
					try {
						jsonResult = $.parseJSON(result.responseText);
					} catch (e) {
						$("#console2").append(e);
					}
					
					equal($(jsonResult).attr("depth1"), "menu", "text depth1 is \"menu\"");
					equal($(jsonResult).attr("depth2"), "list", "text depth2 is \"list\"");

					equal($(result.responseJSON).attr("depth1"), "menu", "json depth1 is \"menu\"");
					equal($(result.responseJSON).attr("depth2"), "list", "json depth2 is \"list\"");
					
					calenderAlert(getDateString(start.split("/")) + " ~ " + getDateString(end.split("/")) + "<br/>" + "depth1 : " + $(jsonResult).attr("depth1") + ", depth2 : " + $(jsonResult).attr("depth2"));
				});
				
			}, 500);
			
		});
		
	});
	
});

function removeTopBottomSpan(){
	$('span.startDateLabel').remove();
	$('span.endDateLabel').remove();
	$('span.separator').remove();
	$('span.rangeLengthLabel').remove();
}

function getDateString(array) {
	if (3 != array.length) {
		return "19000101";
	}
	
	var year = array[2];
	var month = 1 == array[0].length ? "0" + array[0] : array[0];
	var date = 1 == array[1].length ? "0" + array[1] : array[1];
	
	return year + month + date;
}

function calenderAlert(message) {
	/*
	 *	[required]
	 *	jNotify.jquery.css
	 *	jNotify.jquery.js
	 *  
	*/
	jNotify(message, {
		/**
		 * [options]
		 * autoHide / Boolean			Default : true - jNotify closed after TimeShown ms or by clicking on it
		 * clickOverlay / Boolean 		Default : false - If false, disables closing jNotify by clicking on the background overlay.
		 * MinWidth / Integer 			Default : 200 - In pixel, the min-width css property of the boxes.
		 * TimeShown / Integer 			Default : 1500 - In ms, time of the boxes appearances.
		 * ShowTimeEffect / Integer 	Default : 200 - In ms, duration of the Show effect
		 * HideTimeEffect / Integer 	Default : 200 - In ms, duration of the Hide effect
		 * LongTrip / Integer			Default : 15 - Length of the move effect ('top' and 'bottom' verticals positions only)
		 * HorizontalPosition / String	Default : right - Horizontal position. Can be set to 'left', 'center', 'right'
		 * VerticalPosition / String	Default : top - Vertical position. Can be set to 'top', 'center', 'bottom'.
		 * ShowOverlay / Boolean		Default : true - If true, a background overlay appears behind the jNotify boxes
		 * ColorOverlay / String		Default : #000 - Color of the overlay background (only Hex. color code)
		 * OpacityOverlay / Integer		Default : 0.3 - Opacity CSS property of the overlay background. From 0 to 1 max.
		 */
		autoHide : false, // added in v2.0
		HorizontalPosition : 'center',
		VerticalPosition : 'center'
	//	onCompleted : function(){ // added in v2.0
	//	alert('jNofity is completed !');
	// }
	});
}
