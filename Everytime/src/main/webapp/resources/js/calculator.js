document.addEventListener("DOMContentLoaded", function() {
        var calculatorDataElement = document.getElementById('calculatorData');
        var calculatorDataString = calculatorDataElement.textContent.trim();
        var calculatorList = JSON.parse(calculatorDataString);

        var tableBody = document.querySelector("tbody");

        calculatorList.forEach(function(calculator) {
            var row = document.createElement("tr");
            row.innerHTML = `
                <td><input type="hidden" id="calNo" name="calNo" value="` + calculator.calNo + `">
                <input type="text" id="name" name="name" value="` + calculator.courseName + `" onblur="sendData(this)"></td>
                <td>
                <input type="number" name="credit" min="0" max="20" value="` + calculator.credit + `" maxlength="2" onblur="sendData(this)">
	            </td>
	            <td>
	                <select name="grade" onchange="sendData(this)">
	                    <option value="A+" ` + (calculator.grade === 'A+' ? 'selected' : '') + `>A+</option>
	                    <option value="A0" ` + (calculator.grade === 'A0' ? 'selected' : '') + `>A0</option>
	                    <option value="B+" ` + (calculator.grade === 'B+' ? 'selected' : '') + `>B+</option>
	                    <option value="B0" ` + (calculator.grade === 'B0' ? 'selected' : '') + `>B0</option>
	                    <option value="C+" ` + (calculator.grade === 'C+' ? 'selected' : '') + `>C+</option>
	                    <option value="C0" ` + (calculator.grade === 'C0' ? 'selected' : '') + `>C0</option>
	                    <option value="D+" ` + (calculator.grade === 'D+' ? 'selected' : '') + `>D+</option>
	                    <option value="D0" ` + (calculator.grade === 'D0' ? 'selected' : '') + `>D0</option>
	                    <option value="F" ` + (calculator.grade === 'F' ? 'selected' : '') + `>F</option>
	                    <option value="P" ` + (calculator.grade === 'P' ? 'selected' : '') + `>P</option>
	                    <option value="NP" ` + (calculator.grade === 'NP' ? 'selected' : '') + `>NP</option>
	                </select>
	            </td>
            `;
            tableBody.appendChild(row);
        });
        updateInfo();
    });

    function addRow() {
        var tableBody = document.querySelector("tbody");
        var row = document.createElement("tr");
        row.innerHTML = `
            <td><input type="hidden" id="calNo" name="calNo"><input type="text" id="name" name="name" onblur="sendData(this)"></td>
            <td><input type="number" id="credit" name="credit" min="0" max="20" value="0" maxlength="2" onblur="sendData(this)"></td>
            <td><select id="grade" name="grade" onchange="sendData(this)">
                <option value="A+">A+</option>
                <option value="A0">A0</option>
                <option value="B+">B+</option>
                <option value="B0">B0</option>
                <option value="C+">C+</option>
                <option value="C0">C0</option>
                <option value="D+">D+</option>
                <option value="D0">D0</option>
                <option value="F">F</option>
                <option value="P">P</option>
                <option value="NP">NP</option>
            </select></td>
        `;
        tableBody.appendChild(row);
        updateInfo();
    }

    function clearTable() {
        if(confirm("시간표를 초기화 하시나요?")) {
        	var tableBody = document.querySelector("tbody");
            tableBody.innerHTML = "";
        	
            $.ajax({
                type: "POST",
                url: "calculator/delete",
                contentType: "application/json"
            });
            
            updateInfo();
        }
    }

    function sendData(element) {
        var row = element.closest("tr");
        var calNo = row.querySelector("input[name='calNo']").value;
        var courseName = row.querySelector("input[name='name']").value;
        var credit = row.querySelector("input[name='credit']").value;
        var grade = row.querySelector("select[name='grade']").value;

        var data = {
            'calNo': calNo,
            'courseName': courseName,
            'credit': credit,
            'grade': grade
        };

        $.ajax({
            type: "POST",
            url: "calculator/update", 
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(num) {
            	row.querySelector("input[name='calNo']").value = num;
            },
            error: function(xhr, status, error) {
                console.error("데이터 저장 중 오류가 발생했습니다: " + error);
            }
        });
        
        updateInfo();
    }
    
    function getGradePoint(grade) {
        switch (grade) {
            case "A+": return 4.5;
            case "A0": return 4.0;
            case "B+": return 3.5;
            case "B0": return 3.0;
            case "C+": return 2.5;
            case "C0": return 2.0;
            case "D+": return 1.5;
            case "D0": return 1.0;
            case "F": return 0.0;
            case "P": return 0.1;
            case "NP": return 0.0;
            default: return 0.0;
        }
    }
    
    function getGradeColor(grade) {
    	switch (grade) {
	        case "A+": return "rgb(" + 242 + "," + 133 + "," + 114 + ")";
	        case "A0": return "rgb(" + 236 + "," + 197 + "," + 92 + ")";
	        case "B+": return "rgb(" + 130 + "," + 209 + "," + 194 + ")";
	        case "B0": return "rgb(" + 122 + "," + 158 + "," + 224 + ")";
	        case "C+": return "rgb(" + 242 + "," + 133 + "," + 114 + ")";
	        case "C0": return "rgb(" + 236 + "," + 197 + "," + 92 + ")";
	        case "D+": return "rgb(" + 130 + "," + 209 + "," + 194 + ")";
	        case "D0": return "rgb(" + 122 + "," + 158 + "," + 224 + ")";
	        case "F": return "rgb(" + 242 + "," + 133 + "," + 114 + ")";
	        case "P": return "rgb(" + 236 + "," + 197 + "," + 92 + ")";
	        case "NP": return "rgb(" + 130 + "," + 209 + "," + 194 + ")";
	        default: return "rgb(" + 242 + "," + 133 + "," + 114 + ")";
	    }
	}

    function updateInfo() {
        var rows = document.querySelectorAll("tbody tr");
        var totalCredits = 0;
        var totalPoints = 0;
        var gradeList = [];
        var cnt = 0;

        rows.forEach(function(row) {
            var credit = parseFloat(row.querySelector("input[name='credit']").value);
            var grade = row.querySelector("select[name='grade']").value;
            var gradePoint = getGradePoint(grade);
            gradeList.push(grade);

            if (grade !== "NP" && grade !== "F") {
                totalCredits += credit;
                if (grade !== "P") {
                    totalPoints += gradePoint;
                    cnt++;
                }
            }
        });

        var gpa;
        
        if (totalCredits === 0) {
            gpa = 0;
        } else {
            gpa = totalPoints / cnt;
        }

        document.getElementById("total-credits").textContent = totalCredits;
        document.getElementById("gpa-value").textContent = gpa.toFixed(2);
        
        updateChart(gradeList);
    }

    function updateChart(gradeList) {
        var ratioplot = document.querySelector(".ratioplot");
        ratioplot.innerHTML = '';

        var gradeChk = Array.from(new Set(gradeList)).sort((a, b) => getGradePoint(b) - getGradePoint(a));

        gradeChk.forEach(grade => {
            var cnt = gradeList.filter(gradeInfo => gradeInfo === grade).length;
            var percentage = (cnt / gradeList.length) * 100;
            
            var li = document.createElement("li");
            li.textContent = grade + " : " + percentage.toFixed(0) + "%";
            li.style.width = percentage + "%";
            li.style.backgroundColor = getGradeColor(grade);
            ratioplot.appendChild(li);
        });
    }