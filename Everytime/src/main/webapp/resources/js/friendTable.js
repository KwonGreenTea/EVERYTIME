$(document).ready(function() {
	    $('#deleteButton').click(function(event) {
	        event.preventDefault(); 
	        $('#deleteForm').submit(); 
	    });
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    var scheduleDataElement = document.getElementById('scheduleData');
	    var scheduleDataString = scheduleDataElement.textContent.trim();
	    var scheduleList = JSON.parse(scheduleDataString);
		
	    scheduleList.forEach(function(schedule) {
	        addSchedule(schedule);
	    });
		
	    function getRandomColor() {
	    	var r = Math.floor(Math.random() * 30) + 225; 
	        var g = Math.floor(Math.random() * 30) + 225; 
	        var b = Math.floor(Math.random() * 30) + 225; 
	        return "rgb(" + r + "," + g + "," + b + ")";
        }
	  
	    function addSchedule(schedule) {
	        // 시간을 기반으로 상단 위치 및 높이 계산
	        var startTop = -358 + schedule.startHour * 60 + (schedule.startMinute / 60) * 60;
	        var endTop = -358 + schedule.endHour * 60 + (schedule.endMinute / 60) * 60;
	        var height = endTop - startTop - 1;

	        // 삽입할 요일 열 결정
	        var dayColumn;
	        switch (schedule.weeks) {
	            case "월":
	                dayColumn = 1;
	                break;
	            case "화":
	                dayColumn = 2;
	                break;
	            case "수":
	                dayColumn = 3;
	                break;
	            case "목":
	                dayColumn = 4;
	                break;
	            case "금":
	                dayColumn = 5;
	                break;
	            default:
	                console.log("요일 데이터 에러");
	                return;
	        }

	        // 시간표 그리드에 일정 항목 삽입
	        var tableBody = document.querySelector(".tablebody table tbody tr");
	        var gridCell = tableBody.children[dayColumn];
	        
	        // 일정 항목 요소 생성
	        var scheduleElement = document.createElement("div");
	        scheduleElement.className = "schedule-item";
	        scheduleElement.innerHTML = `
	        <div class="schedule-item" data-member-id="` + schedule.memberId 
	        + `"data-start-hour="` + schedule.startHour + `"data-start-minute="` + schedule.startMinute
	        + `"data-end-hour="` + schedule.endHour + `"data-end-minute="` + schedule.endMinute 
	        + `"data-weeks="` + schedule.weeks +`">
	           	<h3>` + schedule.courseName + `</h3>
	           	&nbsp;&nbsp;<strong>` + schedule.professor + `</strong>
	           	<label>` + schedule.courseRoom + `</label>
	        </div>
	        `;
	        
	        var randomColor = getRandomColor();
            scheduleElement.style.backgroundColor = getRandomColor();
            scheduleElement.style.border = "1px solid #d6d6d6";

	        scheduleElement.style.position = "absolute";
            scheduleElement.style.top = startTop + "px";
            scheduleElement.style.height = height + "px";
            scheduleElement.style.width = "274px";
            scheduleElement.style.padding = "10px";
            scheduleElement.style.boxSizing = "border-box";
            scheduleElement.style.borderRadius = "5px";
            scheduleElement.style.overflow = "hidden";

	        // 그리드에 일정 항목 추가
	        gridCell.querySelector(".grids").appendChild(scheduleElement);
	    }
	});
