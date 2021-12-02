<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	
<style>
	table{
		border: solid 1px black;
		border-collapse : collapse;
	}
	td{
		width: 100px;
		height: 50px;
		border: solid 1px black;
		border-collapse : collapse;
	}
	th {
		border: none;
		height: 50px;
	}
</style>

<script>

	var todoDate = "";
	var today = new Date(); //오늘 날짜
    var date = new Date();//today의 Date를 세어주는 역할
    function prevCalendar() {//이전 달
    	todoDate = "";
     today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
     buildCalendar(); //달력 cell 만들어 출력 
    }
    function nextCalendar() {//다음 달
    	 todoDate = "";
         today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
         buildCalendar();//달력 cell 만들어 출력
    }
    function buildCalendar(){//현재 달 달력 만들기
    	todoDate="";
        var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
        //이번 달의 첫째 날
        
        var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
        //이번 달의 마지막 날
       
        var tbCalendar = document.getElementById("calendar");
        //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
        
        var tbCalendarYM = document.getElementById("tbCalendarYM");
        //테이블에 정확한 날짜 찍는 변수
        
         tbCalendarYM.innerHTML = today.getFullYear() + " " + (today.getMonth() + 1) + " "; 
         todoDate += today.getFullYear() + "/";
         todoDate += today.getMonth() + 1 + "/";
         /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
        while (tbCalendar.rows.length > 2) {
        //열을 지워줌
              tbCalendar.deleteRow(tbCalendar.rows.length-1);
         }
         var row = null;
         row = tbCalendar.insertRow();
         //테이블에 새로운 열 삽입
         var cnt = 0;// count, 셀의 갯수를 세어주는 역할
        // 1일이 시작되는 칸을 맞추어 줌
         for (i=0; i<doMonth.getDay(); i++) {
         /*이번달의 day만큼 돌림*/
              cell = row.insertCell();
              cnt = cnt + 1;
         }
        /*달력 출력*/
        var todoDate2 = "";
		for (i = 1; i <= lastDate.getDate(); i++) {
			todoDate2 = todoDate; // yyyy/mm/ 까지만
			if(i < 10)
				todoDate2 += "0" + i;
			else
   				todoDate2 += i; //yyyy/mm/ + i -> yyyy/mm/dd
   			
         	//1일부터 마지막 일까지 돌림
            cell = row.insertCell();
   			//foreach문 안에서는 break, continue 사용불가능
   			
           <c:forEach items="${isTodo}" var="isTodo">
				if(todoDate2 == "${isTodo}"){
					
					cell.innerHTML = i + "⭐";
					cnt++;
					
					if (cnt % 7 == 0){/*토요일 */
						cell.innerHTML = "<font color=#3F72AF>" + i + "⭐";
			            row = calendar.insertRow();
			          }
					if (cnt % 7 == 1){/*일요일 */
						cell.innerHTML = "<font color=#FD5E53>" + i + "⭐";
			          }
					
					 /*오늘 날짜*/
			          if (today.getFullYear() == date.getFullYear()
			             && today.getMonth() == date.getMonth()
			             && i == date.getDate()) {
			            cell.bgColor = "#D2D2FF";
			           }
					 continue;
					}
				else{
	            	cell.innerHTML = i;            	
				}
				
            </c:forEach>
            
            cell.innerHTML = i;
            cnt++;
   			
            if (cnt % 7 == 1) {/*일요일 계산*/			
		            cell.innerHTML = "<font color=#FD5E53>" + i;
	        }   
	          
	          if (cnt % 7 == 0){/*토요일 */
					cell.innerHTML = "<font color=#3F72AF>" + i;	          
	               row = calendar.insertRow();
	          }
	          
	          /*오늘 날짜*/
	          if (today.getFullYear() == date.getFullYear()
	             && today.getMonth() == date.getMonth()
	             && i == date.getDate()) {
	            cell.bgColor = "#D2D2FF";
	           }
         }
    }
</script>

</head>
<body>
	<div class="contents">

		<div class="contents">
			<div class="contents-split">
				<table id="calendar">
					<tr>
						<!-- label은 마우스로 클릭을 편하게 해줌 -->
						<th><label onclick="prevCalendar()"><i
								class="fas fa-chevron-left"></i></label></th>
						<th align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</th>
						<th><label onclick="nextCalendar()"><i
								class="fas fa-chevron-right"></i></label></th>
					</tr>
					<tr>
						<td align="center"><font color="#FD5E53">일</font></td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color="#3F72AF">토</font></td>
					</tr>
				</table>
				<script>
		    buildCalendar();
			</script>
			</div>
		</div>
	</div>
</body>

</html>