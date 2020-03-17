<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, java.util.ArrayList, petsitter.model.vo.*, common.model.vo.*"%>
<%
   PsInfoDetail pid = (PsInfoDetail)request.getAttribute("pid");
   PsBoard psBoard = (PsBoard)request.getAttribute("psBoard");
   ArrayList<IMG> iList = (ArrayList<IMG>)request.getAttribute("iList");
   
   String psImage = (String)request.getAttribute("psImage");
   
   String address = pid.getAddress();
   String addArr[] = address.split(",");
   address = addArr[1].concat(addArr[2]);
   
   String sizeArr[] = psBoard.getCareSize().split(",");
   String size = "";
   for(int i = 0;i<sizeArr.length;i++){
      switch(sizeArr[i]){
      case "s":
         sizeArr[i] = "소형견";
         break;
      case "m":
         sizeArr[i] = "중형견";
         break;
      case "l":
         sizeArr[i] = "대형견";
         break;
      }
   }
   
   for(int i = 0;i<sizeArr.length;i++){
      if(i == sizeArr.length-1){
         size+=sizeArr[i];
      }else{
         size+=(sizeArr[i]+", ");
      }
   }
   
   String ageArr[] = psBoard.getCareAge().split(",");
   String age = "";
   
   for(int i = 0;i<ageArr.length;i++){
      if(i == ageArr.length-1){
         age+=ageArr[i];
      }else{
         age+=(ageArr[i]+", ");
      }
   }
   
   String serArr[] = psBoard.getService().split(",");
   boolean serviceArr[]= {false,false,false,false,false,false};
   for(int i = 0; i<serArr.length;i++){
      serviceArr[i] = true;
   }
   String psSchedule = (String)request.getAttribute("psSchedule");
   String psch[] = null;
   if(!psSchedule.equals("")){
      psch = psSchedule.split(","); //월만 들어있는애를 
      for(int i = 0;i<psch.length;i++){ //년도를 합치기 위해서
         Calendar cToday = Calendar.getInstance();
         String year =  String.valueOf(cToday.get(Calendar.YEAR));
         psch[i] = year+psch[i];
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 이게나도 뭔지 모름 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> <!-- ajax쓰기 위해서 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script><!-- jquery 쓰기 위해서 -->
<!-- 이미지 슬라이드를 쓰기 위해 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script src="path/to/swiper.min.js"></script>
<!--  -->
<script>
   $(function(){
      var contentDivSize = $("#rev-content").height();
      var contentSize = $("#rev-content-p").height();
      var height = $("#detail-rev").height();
      console.log(height);
      if(contentSize>contentDivSize){
         $("#showMore").css("display","block");
      }
   });
</script>
<style>
.petsitter-container {
   width: 68%;
   height: 250vh;
   margin: auto;
   margin-top:3%;
}
.border{
   border-bottom:1px solid #BDBDBD;
}
.detail-info{
   height:100%;
   width:67%;
}
.reserv-form{
   height:100%;
   width:30%;
}
/*---------------------------------*/
.detail-img{
   width:100%;
   height:20%;
}
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
.fit{
   width:100%;
   height:100%;
}
/*---------------------------------*/
.ps-profile{
   height:8%;
   width:100%;
}
.ps-img-score{
   height:100%;
   width:20%;
   position:relative;
}
.ps-profile-detail{
   height:100%;
   width:80%;
   padding:5%;
   position:relative;
}
.ps-img{
   height:100%;
   width:100%;
   border-radius:50%;
   border:1px solid green;
   padding:3%
}
.ps-score{
   position:absolute;
   height:100px;
   width:100px;
   top:20px;
   right:20px;
}
.score{
   position:absolute;
   z-index:1;
   top:33px;
   right:20px;
   font-size:2.5rem;
}
.ps-profile-detail dt{
   font-size:2rem;
}
.ps-pet{
   height:10%;
   width:10%;
   border-radius:20%;
}
.service-icon{
   width:10px;
   height:10px;
}
/*---------------------------------*/
.ps-condition{
   height:20%;
   width:100%;
}
.ps-con-li{
   height:auto%;
   width:100%;
}
.con-li{
   height:auto;
   width:49%;
}
.dt-size{
   width:50%;
   text-align:left;
   padding:2%;
}
.dt-size img{
   height:18px;
   width:25px;
}
.dd-size{
   width:50%;
   text-align:right;
   padding:2%;
}
.dogPng{
   height:100%;
   width:30%;
}
.d-size{
   height:100%;
   width:45%;
}
.d-size dt{
   font-size:0.9rem
}
.check-out{
   height:100%;
   width:55%;
}
.clockPng{
   height:90%;
   width:25%;
}
/*---------------------------------*/
.ps-explain{
   height:12%;
   width:100%;
   overflow:hidden;
}
/*---------------------------------*/
.ps-review{
   height:auto;
   width:100%;
}
.rev-intro{
   width:100%;
   height:auto;
}
.rev-intro::after{
   content:'';
   clear:both;
   display:block;
}
.review-list{
   list-style-type: none;
   padding: 0;
   margin: 0;
}
.review-list::after{
   content: '';
   display: block;
   clean:both;
}
.review-detail{
   border-bottom:1px solid gray;
   height:auto;
   overflow:hidden;
}
.review-detail::after{
   content: '';
   display: block;
   clear:both;
}
.ps-img-dog{
   height:100px;
   width:100px;
   position:relative;
}
.ps-dog{
   position:absolute;
   height:50px;
   width:50px;
   bottom:-5px;
   right:-10px;
   border-radius:50%;
   z-index:1;
   border:2px solid #FFBF00;
}
.detail-rev{
   height:auto;
   width:70%;
   box-sizing:borderbox;
}
.detail-rev::after{
   content:"";
   clear:both;
}
.user-name{
   width:100%;
   height:20%;
}
.rev-content{
   width:100%;
   height:auto;
   overflow:hidden;
}
.rev-date{
   width:100%;
   height:10%;
}
/*---------------------------------*/
.reserv-form-data{
   width:100%;
   height:22%;
   padding:5%;
   border:1px solid #BDBDBD;
}
.reserv-itro{
   width:100%;
   height:7%;
   color:#848484;
}
.insert-date{
   width:100%;
   height:15%;
}
.price-info{
   width:100%;
   height:60%;
   position:relative;
}
.reserv-btn{
   width:100%;
   height:15%;
}
.reserv-btn1{
   width:100%;
   height:100%;
   background-color:#5caf5d;
   font-size:1.5rem;
   color:white;
   border:0;
   outline:0;
   border-radius:15px;
}
.price-info1{
   width:100%;
   height:20%;
   margin-left:10%;
}
.price-info2{
   width:100%;
   height:80%;
}
.howMuch{
   width:50%;
   text-align:left;
   margin-top:5%;
   border-top:1px solid gray;
}
.real-price{
   width:50%;
   text-align:right;
   margin-top:5%;
   border-top:1px solid gray;
}
.add-pet{
   width:60%;
   text-align:left;
   margin-top:5%;
   border-top:1px solid gray;
}
.add-pet-price{
   width:40%;
   text-align:right;
   margin-top:5%;
   border-top:1px solid gray;
}
/*---------------------------------*/
.ps-calendar{
   width:100%;
   height:25%;
}
.real-cal{
   width:100%;
   height:90%;
}
.color-exp{
   width:100%;
   height:10%;
   margin-top:10px;
   
}
.yes-reserv{
   height:20px;
   width:20px;
   background-color:#5caf5d;
   color:white;
}
.no-reserv{
   height:20px;
   width:20px;
   background-color:#c9c9c9;
}
.circle{
   height:20px;
   width:20px;
   border-radius:75px;
}
/*---------------------------------*/
.margin-top{
   margin-top:10%;
}
.float-left{
   float:left;
}
.float-right{
   float:right;
}
.inline{
   display:inline;
}
.margin-right{
   margin-right:25%;
}
.margin-left{
   margin-left:8%
}
.gray{
   background-color:#E6E6E6;
}
.margin-bottom{
   margin-bottom:10%;
}
.border-none{
   border:none;
   text-align:center;
}
.fit{
   height:100%;
   width:100%;
}
</style>
<!-- 달력 부분 css -->
<style>
      .elegant-calencar {
            width: 100%;
            height: 100%;
            border: 1px solid #c9c9c9;
            -webkit-box-shadow: 0 0 5px #c9c9c9;
            box-shadow: 0 0 5px #c9c9c9;
            text-align: center;
        
            position: relative;
        }
        
        #header {
            font-family: 'HelveticaNeue-UltraLight', 'Helvetica Neue UltraLight', 'Helvetica Neue', Arial, Helvetica, sans-serif;
            height: 25%;
            background-color: #5caf5d;
            margin-bottom: 1em;
            position:relative;
        }
        #header::after{
           content:'';
           display:block;
           clear:both;
        }
        .head-wrapper{
           position:absolute;
           margin-top:15%;
           margin-left:13%;
        }
        .pre-button, .next-button {
            margin-top: 5%;
            font-size: 3em;
            -webkit-transition: -webkit-transform 0.5s;
            transition: transform 0.5s;
            cursor: pointer;
            width: 1em;
            height: 1em;
            line-height: 1em;
            color: #D7DF01;
            border-radius: 50%;
        }
        .pre-button {
            float: left;
/*             margin-left: 0.5em; */
        }
        
        .next-button {
            float: left;
            text-align:right;
            /* margin-right: 0.5em; */
        }
        
        .head-info {
            float: left;
            width: 8em;
        }
        
        .head-day {

        }
        
        .head-month {
            margin-top:19%;
            margin-left:6.5%;
            font-size: 1.2rem;
            line-height: 1;
            color: #fff;
            float:left;
        }
        
        #calendar {
            width: 100%;
            margin: 0 auto;
        }
        
        #calendar tr {
            height: 2em;
            line-height: 2em;
        }
        
        #cthead #ctr {
            color: #e66b6b;
            font-weight: 700;
            text-transform: uppercase;
        }
        
        #ctbody #ctr {
            color: #252a25;
        }
        
        #ctbody #ctd{
            width: 14%;
            border-radius: 50%;
            cursor: pointer;
            -webkit-transition:all 0.2s ease-in;
            transition:all 0.2s ease-in;
        }
        
        #ctbody #ctd:hover, .selected {
            color: #fff;
            background-color: #2a3246;
            border: none;
        }
        
        #ctbody #ctd:active {
            -webkit-transform: scale(0.7);
            -ms-transform: scale(0.7);
            transform: scale(0.7);
        }
        
        #today {
            background-color: #FE642E;
            color: #fff;
            font-family: serif;
            border-radius: 50%;
        }
        
        #reserved {
            background-color: #6b77e6;
            color: #fff;
            font-family: serif;
            border-radius: 50%;
        }
        
        #vday {
            background-color: #5caf5d;
            color: #fff;
            font-family: serif;
            border-radius: 50%;
        }
        
        
        #disabled {
            cursor: default;
            background: #fff;
        }
        
        #disabled:hover {
            background: #fff;
            color: #c9c9c9;
        }
        
        #reset {
            display: block;
            position: absolute;
            right: 0.5em;
            top: 0.5em;
            z-index: 999;
            color: #fff;
            font-family: serif;
            cursor: pointer;
            padding: 0 0.5em;
            height: 1.5em;
            border: 0.1em solid #fff;
            border-radius: 4px;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        
        #reset:hover {
            color: #DF3A01;
            border-color: #DF3A01;
        }
        
        #reset:active{
            -webkit-transform: scale(0.8);
            -ms-transform: scale(0.8);
            transform: scale(0.8);     
        }
</style>
<!-- 달력 부분 script -->
<script>
document
.addEventListener(
		'DOMContentLoaded',
		function() {
			var today = new Date(), year = today.getFullYear(), month = today
					.getMonth(), monthTag = [ "1월", "2월", "3월",
					"4월", "5월", "6월", "7월", "8월", "9월", "10월",
					"11월", "12월" ], day = today.getDate(), days = document
					.getElementsByTagName('td'), selectedDay, setDate, daysLen = days.length;
			// options should like '2014-01-01'
			function Calendar(selector, options) {
				this.options = options;
				this.draw();
			}
			
			
			

			

			Calendar.prototype.draw = function() {
				this.getCookie('selected_day');
				this.getOptions();
				this.drawDays();
				var that = this, reset = document
						.getElementById('reset'), pre = document
						.getElementsByClassName('pre-button'), next = document
						.getElementsByClassName('next-button');

				pre[0].addEventListener('click', function() {
					that.preMonth();
				});
				next[0].addEventListener('click', function() {
					that.nextMonth();
				});
				reset.addEventListener('click', function() {
					that.reset();
				});
				while (daysLen--) {
					days[daysLen].addEventListener('click',
							function() {
								that.clickDay(this);
							});
				}
			};

			Calendar.prototype.drawHeader = function(e) {
				var headDay = document.getElementsByClassName('head-day'),
						headMonth = document.getElementsByClassName('head-month');
				headMonth[0].innerHTML = year + " - " + monthTag[month];
				e ? headDay[0].innerHTML = e: headDay[0].innerHTML = day;

			};

			Calendar.prototype.drawDays = function() {
				var startDay = new Date(year, month, 1).getDay(), nDays = new Date(
						year, month + 1, 0).getDate(), n = startDay;
				for (var k = 0; k < 42; k++) {
					days[k].innerHTML = '';
					days[k].id = '';
					days[k].className = '';
				}

				for (var i = 1; i <= nDays; i++) {
					days[n].innerHTML = i;
					n++;
				}
				//예약일을받는당
				rday = new Date(2019, 11, 1);
				vday = new Date(2019, 11, 7);
				nday = new Date(2019, 11, 8);
				
				console.log(rday);

				//dddddd
				if(<%=psch!=null%>){
					"<% for(int i=0; i<psch.length;i++){%>"
					eval("day"+ <%=i%> + "= new Date(<%=Integer.parseInt(psch[i].substring(0,4))
					%>,<%= (Integer.parseInt(psch[i].substring(4,6)))-1%>,<%=psch[i].substring(6,8)%>)")
					"<%}%>"
					var sch="";
					for (var k=0; k<<%=psch.length%> ;k++){
					    if(k==(<%=psch.length%>- 1)) {
							var sch = sch
									.concat("(j === day"
											+ k
											+ ".getDate()+startDay -1) && (month === day"
											+ k
											+ ".getMonth()) && (year === day"
											+ k + ".getFullYear())");
						} else {
							var sch = sch
									.concat("(j === day"
											+ k
											+ ".getDate()+startDay -1) && (month === day"
											+ k
											+ ".getMonth()) && (year === day"
											+ k + ".getFullYear()) || ");
						}
					}
					console.log(sch);

					for (var j = 0; j < 42; j++) {
						if (days[j].innerHTML === "") {
							days[j].id = "disabled";
						} else if (j === day + startDay - 1) {
							if ((this.options
									&& (month === setDate.getMonth()) && (year === setDate
									.getFullYear()))
									|| (!this.options
											&& (month === today
													.getMonth()) && (year === today
											.getFullYear()))) {
								this.drawHeader(day);
								days[j].id = "today";
							}
						}

						if (eval(sch)) {
							days[j].id = "vday";
						}

						if (selectedDay) {
							if ((j === selectedDay.getDate() + startDay
									- 1)
									&& (month === selectedDay
											.getMonth())
									&& (year === selectedDay
											.getFullYear())) {
								days[j].className = "selected";
								this.drawHeader(selectedDay.getDate());
							}
						}

					}						
				}else{
					
					if (days[j].innerHTML === "") {
						days[j].id = "disabled";
					} else if (j === day + startDay - 1) {
						if ((this.options
								&& (month === setDate.getMonth()) && (year === setDate
								.getFullYear()))
								|| (!this.options
										&& (month === today
												.getMonth()) && (year === today
										.getFullYear()))) {
							this.drawHeader(day);
							days[j].id = "today";
						}
					}
					
					
					
					
					if (selectedDay) {
						if ((j === selectedDay.getDate() + startDay
								- 1)
								&& (month === selectedDay
										.getMonth())
								&& (year === selectedDay
										.getFullYear())) {
							days[j].className = "selected";
							this.drawHeader(selectedDay.getDate());
						}
					}
					
					
					
					
					
					
					
					
				}
				
                
			};

			Calendar.prototype.preMonth = function() {
				if (month < 1) {
					month = 11;
					year = year - 1;
				} else {
					month = month - 1;
				}
				this.drawHeader(1);
				this.drawDays();
			};

			Calendar.prototype.nextMonth = function() {
				if (month >= 11) {
					month = 0;
					year = year + 1;
				} else {
					month = month + 1;
				}
				this.drawHeader(1);
				this.drawDays();
			};

			Calendar.prototype.getOptions = function() {
				if (this.options) {
					var sets = this.options.split('-');
					setDate = new Date(sets[0], sets[1] - 1,
							sets[2]);
					day = setDate.getDate();
					year = setDate.getFullYear();
					month = setDate.getMonth();
				}
			};

			Calendar.prototype.reset = function() {
				month = today.getMonth();
				year = today.getFullYear();
				day = today.getDate();
				this.options = undefined;
				this.drawDays();
			};

			Calendar.prototype.setCookie = function(name,
					expiredays) {
				if (expiredays) {
					var date = new Date();
					date.setTime(date.getTime()
							+ (expiredays * 24 * 60 * 60 * 1000));
					var expires = "; expires=" + date.toGMTString();
				} else {
					var expires = "";
				}
				document.cookie = name + "=" + selectedDay
						+ expires + "; path=/";
			};

			Calendar.prototype.getCookie = function(name) {
				if (document.cookie.length) {
					var arrCookie = document.cookie.split(';'), nameEQ = name
							+ "=";
					for (var i = 0, cLen = arrCookie.length; i < cLen; i++) {
						var c = arrCookie[i];
						while (c.charAt(0) == ' ') {
							c = c.substring(1, c.length);

						}
						if (c.indexOf(nameEQ) === 0) {
							selectedDay = new Date(c.substring(
									nameEQ.length, c.length));
						}
					}
				}
			};
			var calendar = new Calendar();
		}, false);
</script>
<!-- 데이트 피커 -->
<script>

$(function(){
   $.datepicker.setDefaults($.datepicker.regional['ko']); 
    $( "#startDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         minDate: 0,
         onClose: function( selectedDate ) {    
              //시작일(startDate) datepicker가 닫힐때
              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#endDate").datepicker( "option", "minDate", selectedDate );
         }    

    });
    $( "#endDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
             // 종료일(endDate) datepicker가 닫힐때
             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
         }    

    });    
})

</script>

</head>
<body>
   <%@ include file="../common/menubar.jsp"%>
   <div class="petsitter-container">
      <div class="detail-info float-left" style="margin-right:5px">
         <div class="detail-img">
           <div class="swiper-container">
             <div class="swiper-wrapper">
               <div class="swiper-slide"><img class="fit" src="<%= request.getContextPath() %>/resources/psboard/<%= iList.get(0).getChangeName() %>"/></div>
               <div class="swiper-slide"><img class="fit" src="<%= request.getContextPath() %>/resources/psboard/<%= iList.get(1).getChangeName() %>"/></div>
               <div class="swiper-slide"><img class="fit" src="<%= request.getContextPath() %>/resources/psboard/<%= iList.get(2).getChangeName() %>"/></div>
               <div class="swiper-slide"><img class="fit" src="<%= request.getContextPath() %>/resources/psboard/<%= iList.get(3).getChangeName() %>"/></div>
             </div>
             <!-- Add Arrows -->
             <div class="swiper-button-next" style="color:#FFFFFF"></div>
             <div class="swiper-button-prev" style="color:#FFFFFF"></div>
           </div>

         </div>
         <div class="ps-profile" style="margin-top:5%;">
            <div class="ps-img-score float-left">
               <div class="ps-img"><img class="fit" src="<%= request.getContextPath() %>/resources/userimg/<%= psImage %>" style="height:100%;width:100%;border-radius:50%;"></div>
            </div>
            <div class="ps-profile-detail float-left">
               <dt><%= pid.getUserName() %></dt>
               <dd>
                  <img src="<%= request.getContextPath() %>/resources/petsitter/house.png" class="ps-pet float-left" style="margin-right:10px;"/><br>
                  <p><%= address %></p>
               </dd>
               <div class="ps-score">
                  <%if(pid.getScore() > 7) {%>
                     <img class="fit" src="<%= request.getContextPath() %>/resources/petsitter/gold-medal.png">
                  <%} else if(pid.getScore()>4 && pid.getScore()<8){%>
                     <img class="fit" src="<%= request.getContextPath() %>/resources/petsitter/silver-medal.png">
                  <%} else{%>
                     <img class="fit" src="<%= request.getContextPath() %>/resources/petsitter/bronze-medal.png">
                  <%} %>
                  <p class="score"><%= pid.getScore() %>점</p>
               </div>
            </div>
         </div>
         <hr style="color:#848484;">
         <div class="ps-condition">
            <div class="durable margin-bottom">
               <div class="d-size float-left">
                  <img class="float-left dogPng" src="<%= request.getContextPath()%>/resources/petsitter/dog.png">
                  <dl>
                     <dt>돌봄 가능한 강아지 크기 & 나이</dt>
                     <dd>
                        가능 크기 : <%= size %>
                     </dd>
                     <dd>가능 나이 : <%= age %></dd>
                  </dl>
               </div>
               <div class="check-out float-left">
                  <dl>
                     <img class="float-left clockPng" src="<%= request.getContextPath()%>/resources/petsitter/watch.png">
                     <dt>체크인, 체크 아웃 시간</dt>
                     <dd>체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%= psBoard.getCheckIn() %></strong></dd>
                     <dd>체크아웃 &nbsp;&nbsp;&nbsp;<strong><%= psBoard.getCheckOut() %></strong></dd>
                  </dl>
               </div>
            </div>
            <br clear="both">
            <hr style="color:#848484;">
            <h5 style="font-weight:400; color:#21610B;">이용가능 서비스</h5>
            <div class="ps-con-li">
               <dl class="con-li float-left" style="margin-right:8.5px">
                  <dt class="dt-size float-left gray"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/walk.png" style="margin-right:10px;">산책</dt>
                  <dd class="dd-size float-left gray">
                     <%if(serviceArr[0]) {%>
                        가능
                     <%} else {%>
                        불가능
                     <%} %>
                  </dd>
                  <br clear="both">
                  <dt class="dt-size float-left"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/pill.png" style="margin-right:10px;">약물복용</dt>
                  <dd class="dd-size float-left">
                     <%if(serviceArr[1]) {%>
                        가능
                     <%} else {%>
                        불가능
                     <%} %>
                  </dd>
                  <br clear="both">
                  <dt class="dt-size float-left gray"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/yard.png" style="margin-right:10px;">마당</dt>
                  <dd class="dd-size float-left gray">
                     <%if(serviceArr[2]) {%>
                        있음
                     <%} else {%>
                        없음
                     <%} %>
                  </dd>
               </dl>
               <dl class="con-li float-left">
                  <dt class="dt-size float-left gray"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/play.png" style="margin-right:10px;">실내놀이</dt>
                  <dd class="dd-size float-left gray">
                     <%if(serviceArr[3]) {%>
                        가능
                     <%} else {%>
                        불가능
                     <%} %>
                  </dd>
                  <br clear="both">
                  <dt class="dt-size float-left"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/shower.png" style="margin-right:10px;">목욕</dt>
                  <dd class="dd-size float-left">
                     <%if(serviceArr[4]) {%>
                        가능
                     <%} else {%>
                        불가능
                     <%} %>
                  </dd>
                  <br clear="both">
                  <dt class="dt-size float-left gray"><img class="service-icon" src="<%=request.getContextPath()%>/resources/petsitter/pickup.png" style="margin-right:10px;">픽업</dt>
                  <dd class="dd-size float-left gray">
                     <%if(serviceArr[5]) {%>
                        가능
                     <%} else {%>
                        불가능
                     <%} %>
                  </dd>
               </dl>
            </div>
         </div>
         <hr style="color:#848484;">
         <div id="makeAuto" class="ps-explain margin-top">
            <h3 id="exp-title"><%= psBoard.getTitle() %></p>
            <p style="font-size:1rem">
            <%= psBoard.getContent() %>
            </p>
         </div>
         <a id="sizeButton" href="javascript:makeAuto()">펼치기</a>
         <hr style="color:gray;">
         <div class="ps-review margin-top">
            <div class="rev-intro">
               <span class="float-left" style="font-size:2rem;">후기</span>
               <span class="float-right" style="margin-right:20px; margin-top:3%; cursor:pointer;" onclick="goToWrite()">작성하기</span>   
            </div> 
            <br clear="both">
            <ul class="review-list">
               <li id="liHeight" class="review-detail">
                  <div class="ps-img-dog float-left">
                     <div class="ps-img"><img src="<%= request.getContextPath() %>/resources/petsitter/me.jpg" style="height:100%;width:100%;border-radius:50%;"></div>
                     <div class="ps-dog"><img src="<%= request.getContextPath() %>/resources/petsitter/jjing.jpg" style="height:100%;width:100%;border-radius:50%;"></div>
                  </div>
                  <div id="detail-rev" class="detail-rev float-left margin-left">
                     <div class="user-name">
                        <h5>이욱재</h5>
                     </div>
                     <div id="rev-content" style="margin-top:2%" class="rev-content">
                        <p id="rev-content-p" style="font-size:0.8rem">어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고
                        어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고
                        어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고
                        </p>
                     </div>
                     <div class="rev-date">
                        <p>2019-12-09</p>
                     </div>
                  </div>
               </li>
               <li>
                  여기에는 다음 리뷰 들어올 공간
               </li>
            </ul>
         </div>
      </div>
      <div class="reserv-form float-left">
         <form class="reserv-form-data" action="<%= request.getContextPath() %>/views/petsitter/before-pay.jsp">
            <div class="reserv-itro" style="font-size:0.8rem; text-align:center;"><strong>예약을 원하는 날짜와 시간을 선택해 주세요.</strong></div>
            <div class="insert-date">
               <div style="border:1px solid #848484; border-radius: 5%; margin-top:15px">
                  <input id="startDate" class="float-left border-none" type="text" value="" placeholder="시작 날짜" readonly style="width:45%;">
                  <span class="float-left" style="width:10%; text-align:center">&gt;</span>
                  <input id="endDate" class="float-right border-none" type="text" value="" placeholder="끝나는 날짜" readonly style="width:45%;">
                  <br clear="both">
               </div>
            </div>
            <div class="price-info">
               <div class="price-info1">
                  <span style="font-size:2rem; color:#FE642E"><strong>40000원</strong></span>
                  <select>
                     <option>15kg 미만</option>
                     <option>15kg 이상</option>
                  </select>
               </div>
               <div class="price-info2">
                  <dl class="price-info-detail">
                     <dt class="howMuch float-left">1박</dt>
                     <dd class="real-price float-left"> 40000원</dd>
                     <br clear="both">
                     <dt class="add-pet float-left">반려견 추가&nbsp;<input type="number" min="0" max="5" step="1" value="0"></dt>
                     <dd class="add-pet-price float-left"> 40000원</dd>
                     <br clear="both">
                     <dt class="howMuch float-left">총 합계</dt>
                     <dd class="real-price float-left"> 40000원</dd>
                  </dl>
               </div>
            </div>
            <div class="reserv-btn"><button class="reserv-btn1">예약 요청</button></div>
         </form>
         <div class="ps-calendar  margin-top">
            <div class="real-cal">
               <div class="elegant-calencar">
                      <p id="reset">reset</p>
                    <div id="header">
                       <div class="head-wrapper">
                          <div class="pre-button"><</div>
                           <div class="head-info">
                               <div class="head-month"></div>
                           </div>
                           <div class="next-button">></div>
                       </div>
                    </div>
                    <table id="calendar">
                        <thead>
                            <tr>
                                <th>Sun</th>
                                <th>Mon</th>
                                <th>Tue</th>
                                <th>Wed</th>
                                  <th>Thu</th>
                                <th>Fri</th>
                                <th>Sat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                              <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- 캘린더 부분 -->
            </div> <!-- real-cal -->
            <div class="color-exp">
               <span class="no-reserv circle"><strong>불가능</strong></span>
               <span class="yes-reserv circle"><strong>가능</strong></span>
            </div>
         </div><!-- ps-cal -->
      </div> <!-- reserv-form -->
   </div><!-- ps-container -->
   <script>
      function makeAuto(){
         var explain = document.getElementById("makeAuto");
         var buttonText = document.getElementById("sizeButton");
         var check = buttonText.innerHTML;
         if(check=="펼치기"){
            explain.style.height="auto";
            buttonText.innerHTML="접기";            
         }else{
            explain.style.height="12%";
            buttonText.innerHTML="펼치기";
         }
      }
   </script>
     <script>
       var swiper = new Swiper('.swiper-container', {
         navigation: {
           nextEl: '.swiper-button-next',
           prevEl: '.swiper-button-prev',
         },
       });
     </script>
</body>
</html>