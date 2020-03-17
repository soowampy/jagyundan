<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, java.util.ArrayList, petsitter.model.vo.*, common.model.vo.*,board.model.vo.*"%>
<%
   PsInfoDetail pid = (PsInfoDetail)request.getAttribute("pid");
   PsBoard psBoard = (PsBoard)request.getAttribute("psBoard");
   ArrayList<IMG> iList = (ArrayList<IMG>)request.getAttribute("iList");
   ArrayList<Comment> clist = (ArrayList<Comment>)request.getAttribute("clist");
   Comment checkComment = (Comment)request.getAttribute("checkComment");
   
   for(Comment c: clist){
      System.out.println(c);
   }
   
   int userNo = pid.getUserNo();
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
   String datePicker[] = null;
   if(!psSchedule.equals("none")){
      psch = psSchedule.split(","); //월만 들어있는애를 
      int num = psch.length;
      datePicker = new String[num];
      for(int i = 0;i<psch.length;i++){ //년도를 합치기 위해서
         Calendar cToday = Calendar.getInstance();
         String year =  String.valueOf(cToday.get(Calendar.YEAR));
         psch[i] = year+psch[i];
      }
      //데이트피커에서 불가능 날짜를 보여주려고
      for(int i = 0; i<datePicker.length;i++){
         String date = psch[i].substring(0,4)+"-"+psch[i].substring(4,6)+"-"+psch[i].substring(6,8);
         System.out.println(date);
         datePicker[i] = date;
      }
   }
   
   int today = (Integer)request.getAttribute("today");
   int totalPrice = 0;
   
   int psBoardNo = psBoard.getPsBoardNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   margin-top:10px;
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
.replyImg{
   height:100%;
   width:100%;
   border-radius:50%;
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
        document.addEventListener('DOMContentLoaded', function(){
            var today = new Date(),
                year = today.getFullYear(),
                month = today.getMonth(),
                monthTag =["1","2","3","4","5","6","7","8","9","10","11","12"],
                day = today.getDate(),
                days = document.getElementsByTagName('td'),
                selectedDay,
                setDate,
                daysLen = days.length;
        // options should like '2014-01-01'
            function Calendar(selector, options) {
                this.options = options;
                this.draw();
            }
        
            Calendar.prototype.draw  = function() {
                this.getCookie('selected_day');
                this.getOptions();
                this.drawDays();
                var that = this,
                    reset = document.getElementById('reset'),
                    pre = document.getElementsByClassName('pre-button'),
                    next = document.getElementsByClassName('next-button');
                    
                    pre[0].addEventListener('click', function(){that.preMonth(); });
                    next[0].addEventListener('click', function(){that.nextMonth(); });
                    reset.addEventListener('click', function(){that.reset(); });
/*                 while(daysLen--) {
                    days[daysLen].addEventListener('click', function(){that.clickDay(this); });
                } */
            };
            
            Calendar.prototype.drawHeader = function(e) {
                var headDay = document.getElementsByClassName('head-day'),
                    headMonth = document.getElementsByClassName('head-month');
        
/*                     e?headDay[0].innerHTML = e : headDay[0].innerHTML = day; */
                    headMonth[0].innerHTML = year +" - " + monthTag[month];        
             };
            
            Calendar.prototype.drawDays = function() {
                var startDay = new Date(year, month, 1).getDay(),
                    nDays = new Date(year, month + 1, 0).getDate(),
                    n = startDay;
                for(var k = 0; k <42; k++) {
                    days[k].innerHTML = '';
                    days[k].id = '';
                    days[k].className = '';
                }
        
                for(var i  = 1; i <= nDays ; i++) {
                    days[n].innerHTML = i; 
                    n++;
                }
                
                for(var j = 0; j < 42; j++) {
                    if(days[j].innerHTML === ""){
                        days[j].id = "disabled";
                    }else if(j === day + startDay - 1){
                        if((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth())&&(year===today.getFullYear()))){
                            this.drawHeader(day);
                            days[j].id = "today";
                        }
                    }
                    if(<%= psSchedule %> != "000000"){
                       <%for(int i = 0;i<psch.length;i++){%>
                          if(<%= today%>><%=Integer.parseInt(psch[i])%>){ //예약 불가 날짜중 과거인 날짜는 받아오지 않는다
                          }else{
                              vday = new Date(<%= Integer.parseInt(psch[i].substring(0,4)) %>,<%= Integer.parseInt(psch[i].substring(4,6)) %>-1,
                                    <%= Integer.parseInt(psch[i].substring(6,8)) %>)
                               if(vday){
                                   if(
                                   (j === vday.getDate() + startDay - 1)&&(month === vday.getMonth())&&(year === vday.getFullYear())
                                   ){
                                   days[j].id = "vday";  
                                   }
                               }                            
                          }
                        <%}%>
                    }

                    if(selectedDay){
                        if((j === selectedDay.getDate() + startDay - 1)&&(month === selectedDay.getMonth())&&(year === selectedDay.getFullYear())){
                        days[j].className = "selected";
                        this.drawHeader(selectedDay.getDate());
                        }
                    }
                    
                }
            };
          
            Calendar.prototype.preMonth = function() {
                if(month < 1){ 
                    month = 11;
                    year = year - 1; 
                }else{
                    month = month - 1;
                }
                this.drawHeader(1);
                this.drawDays();
            };
        
            Calendar.prototype.nextMonth = function() {
                if(month >= 11){
                    month = 0;
                    year =  year + 1; 
                }else{
                    month = month + 1;
                }
                this.drawHeader(1);
                this.drawDays();
            };
            
            Calendar.prototype.getOptions = function() {
                if(this.options){
                    var sets = this.options.split('-');
                        setDate = new Date(sets[0], sets[1]-1, sets[2]);
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
            
            Calendar.prototype.setCookie = function(name, expiredays){
                if(expiredays) {
                    var date = new Date();
                    date.setTime(date.getTime() + (expiredays*24*60*60*1000));
                    var expires = "; expires=" +date.toGMTString();
                }else{
                    var expires = "";
                }
                document.cookie = name + "=" + selectedDay + expires + "; path=/";
            };
            
            Calendar.prototype.getCookie = function(name) {
                if(document.cookie.length){
                    var arrCookie  = document.cookie.split(';'),
                        nameEQ = name + "=";
                    for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
                        var c = arrCookie[i];
                        while (c.charAt(0)==' ') {
                            c = c.substring(1,c.length);
                            
                        }
                        if (c.indexOf(nameEQ) === 0) {
                            selectedDay =  new Date(c.substring(nameEQ.length, c.length));
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
   var start;
   var end;
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
         onSelect:function(dateText){
            var date = $(this).val();
            var year = date.substring(0,4);
            var month = date.substring(4,6);
            var day = date.substring(6,8);
            start = new Date(parseInt(year),parseInt(month),parseInt(day));
         },
         onClose: function( selectedDate ) {    
              //시작일(startDate) datepicker가 닫힐때
              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#endDate").datepicker( "option", "minDate", selectedDate );
         },
         beforeShowDay:disableTheseDays
    });
    
    function disableTheseDays(date){ //예약 불가능한 날짜를 선택하지 못하게 하는것
       var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
       var disableDate = new Array();
       <% for(int i = 0; i<datePicker.length;i++){ %>
            disableDate.push("<%= datePicker[i]%>");
       <%}%>
       
       for (i = 0; i < disableDate.length; i++) {
          if($.inArray(y + '-' +(m+1) + '-' + d,disableDate) != -1) {
             return [false];
          }
       }
       return [true];
    }
    $( "#endDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         onSelect:function(dateText){
            var date = $(this).val();
            var year = date.substring(0,4);
            var month = date.substring(4,6);
            var day = date.substring(6,8);
            end = new Date(parseInt(year),parseInt(month),parseInt(day));
            //시작과 끝 날짜 일수 계산
            var betweenDay = (end.getTime() - start.getTime())/1000/60/60/24;  
            if(betweenDay == 0){
               $("#sendService").val("데이케어");
               $("#tellDay").text("데이케어");
               $("#price1").text(<%= psBoard.getHourPrice()%>+"원");
               $("#firstPrice").val(<%= psBoard.getHourPrice()%>);
               $("#price3").text(<%= psBoard.getHourPrice()%>+"원");
               $("#finalPrice").val(<%= psBoard.getHourPrice()%>);
            }else{
               $("#sendService").val(betweenDay);
               $("#tellDay").text(betweenDay+"박");
               $("#price1").text((<%= psBoard.getOneDayPrice()%>*betweenDay)+"원");
               $("#firstPrice").val(<%= psBoard.getOneDayPrice()%>*betweenDay);
               $("#price3").text((<%= psBoard.getOneDayPrice()%>*betweenDay)+"원");
               $("#finalPrice").val(<%= psBoard.getOneDayPrice()%>*betweenDay);
            }
          },
         dateFormat: "yymmdd",
         // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
             // 종료일(endDate) datepicker가 닫힐때
             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
         },
         beforeShowDay:disableTheseDays

    });    
})

</script>

</head>
<body>
   <%@ include file="../common/menubar.jsp"%>
   <div class="petsitter-container">
      <div class="detail-info float-left" style="margin-right:5px">
         <!-- 이미지 슬라이드 부분 -->
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
         <!-- 이미지 슬라이드 -->
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
                  <%if(pid.getScore() >= 4) {%>
                     <img class="fit" src="<%= request.getContextPath() %>/resources/petsitter/gold-medal.png">
                  <%} else if(pid.getScore()>1 && pid.getScore()<4){%>
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
            <%= (psBoard.getContent()).replace("\r\n", "<br>") %>
            </p>
         </div>
         <a id="sizeButton" href="javascript:makeAuto()">펼치기</a>
         <hr style="color:gray;">
         <div class="ps-review margin-top">
            <div class="rev-intro">
               <span class="float-left" style="font-size:2rem;">후기</span>
               <%if(checkComment == null) {%>
                  <span class="float-right" style="margin-right:20px; margin-top:3%; cursor:pointer;" onclick="goToWrite()">작성하기</span>                
               <%} %>  
            </div> 
            <br clear="both">
            <ul id="reviewList" class="review-list">
               <%if(clist!=null) {%>
                  <%for(Comment c : clist) {%>
                  <li id="liHeight" class="review-detail">
                     <div class="ps-img-dog float-left">
                        <div class="ps-img"><img src="<%= request.getContextPath() %>/resources/userimg/<%= c.getChangeName() %>" style="height:100%;width:100%;border-radius:50%;"></div>
                     </div>
                     <div id="detail-rev" class="detail-rev float-left margin-left">
                        <div class="user-name">
                           <h5 class="float-left"><%=c.getUserName() %></h5>
                           <%if(loginUser!=null && (c.getUserName().equals(loginUser.getUserName()))) {%>
                              <input type="text" id="commentNo" name="commentNo" value="<%=c.getCommentNo() %>" style="display:none">
                              <button class="float-right" onclick="deleteReply()">삭제</button>
                              <button class="float-right" onclick="fixReply()">수정</button>
                           <%} %>
                        </div>
                        <div id="rev-content" style="margin-top:2%" class="rev-content">
                           <p id="rev-content-p" style="font-size:0.8rem"><%=c.getContent() %></p>
                        </div>
                        <div class="rev-date">
                           <p><%= c.getEnrollDate() %></p>
                        </div>
                     </div>
                  </li>                     
                  <%} %>
               <%}%>
            </ul>
         </div>
      </div>
      <div class="reserv-form float-left">
         <form class="reserv-form-data" action="<%=request.getContextPath() %>/BeforePay" method="post" onsubmit="return checkPet()">
            <div class="reserv-itro" style="font-size:0.8rem; text-align:center;"><strong>예약을 원하는 날짜와 시간을 선택해 주세요.</strong></div>
            <div class="insert-date">
               <div style="border:1px solid #848484; border-radius: 5%; margin-top:15px">
                  <input name="startDate" id="startDate" class="float-left border-none" type="text" placeholder="시작 날짜" readonly style="width:45%;">
                  <span class="float-left" style="width:10%; text-align:center">&gt;</span>
                  <input name="endDate" id="endDate" class="float-right border-none" type="text" placeholder="끝나는 날짜" readonly style="width:45%;">
                  <br clear="both">
               </div>
            </div>
            <div class="price-info">
<!--                <div class="price-info1">
                  <span style="font-size:2rem; color:#FE642E"><strong>40000원</strong></span>
                  <select>
                     <option>15kg 미만</option>
                     <option>15kg 이상</option>
                  </select>
               </div> -->
               <div class="price-info2">
                  <dl class="price-info-detail">
                     <dt class="howMuch float-left"><p id="tellDay">1박</p></dt>
                     <dd class="real-price float-left"><p id="price1"><%=psBoard.getOneDayPrice() %></p></dd>
                     <br clear="both">
                     <dt class="add-pet float-left">반려견 &nbsp;<input id="plus" name="dogSu" type="number" min="1" max="5" step="1" onchange="plusDog()"></dt>
                     <dd class="add-pet-price float-left"><p id="price2"></p></dd>
                     <br clear="both">
                     <dt class="howMuch float-left">총 합계</dt>
                     <dd class="real-price float-left"><p id="price3"><%= totalPrice %></p></dd>
                  </dl>
               </div>
            </div>
            <input type="text" id="psBoardNo" name="psBoardNo" style="display:none;">
            <input type="text" name="psImage" style="display:none;" value="<%= psImage %>">
            <input type="text" id="sendService" name="sendService" style="display:none;">
            <input type="text" id="firstPrice" name="firstPrice" style="display:none;">
            <input type="text" id="finalPrice" name="finalPrice" style="display:none;">
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
               <span class="yes-reserv circle"><strong>불가능</strong></span>
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
      
      function plusDog(){
         var su = $("#plus").val();
         var lastPrice = $("#firstPrice").val();
         $("#psBoardNo").val("<%= psBoardNo %>");
         if(su == 0){
            $("#price3").text(lastPrice+"원");
            $("#finalPrice").val(lastPrice);            
         }else{
            $("#price3").text(su*lastPrice+"원");
            $("#finalPrice").val(su*lastPrice);
         }
      }
      
      function checkPet(){
         var check = false;
         <%if(loginUser == null){%>
            alert("로그인한 회원만 펫시터 예약을 하실수 있습니다.");
            console.log($("#plus").val());
            console.log($("#psBoardNo").val());
            return false;
         <%} else{%>
            <%if(loginUser.getUserNo() == userNo){%>
               alert("본인 글에는 예약을 하실수 없습니다.");
               return false;
            <%}%>
            <%if(loginUser.getdogSu()<1){%>
               if(confirm("반려견 정보를 등록 하셔야지만 예약이 가능합니다. 등록 하시겠습니까?")){
                  location.href="<%= request.getContextPath()%>/views/myPage/petSitter/myPetInsert2.jsp"
                  return false;
               }else{
                  return false;
               }
            <%}else{%>
               if($("#startDate").val()==""){
                  alert("시작날짜를 입력하셔야합니다.");
                  $("#startDate").focus();
                  return false;
               }
               if($("#endDate").val()==""){
                  alert("끝나는 날짜를 입력하셔야합니다.");
                  $("#endDate").focus();
                  return false;
               }
               if($("#plus").val()==""){
                  alert("반려견 추가여부도 설정해주세요");
                  $("#plus").focus();
                  return false;
               }
               if($("#psBoardNo").val() == "" || $("#plus").val()==""){
                  alert("시벌 이게 null 이란다.")
                  return false;   
               }
            <%}%>
            
         <%}%>
      }
   </script>
     <script> <!-- 이미지 슬라이드를 쓰기 위해서 -->
       var swiper = new Swiper('.swiper-container', {
         navigation: {
           nextEl: '.swiper-button-next',
           prevEl: '.swiper-button-prev',
         },
       });
     </script>
          <script>
        function goToWrite(){
           <%if( loginUser == null ){%>
              alert("로그인을 하셔야 합니다.");
           <%} else{%>
              <%if(loginUser.getUserNo() == pid.getUserNo() ) {%>
                 alert("본인 글에는 후기를 작성할수 없습니다.")
              <%}else{%>
                 var userNo = <%= loginUser.getUserNo() %>;
                 var psBoardNo = <%= psBoardNo %>;
                 $.ajax({
                    url:"<%= request.getContextPath() %>/CheckReserv", //해당 게시글로 이사람이 구매내열에 있는지 확인
                    type:"post",
                    data:{
                       userNo:userNo,
                       psBoardNo:psBoardNo
                    },
                    success:function(data){
                       console.log("ajax 통신 성공");
                       if(data == "no-reserv"){
                          console.log("예약한적없음");
                          alert("<%= pid.getUserName()%> 펫시터에게 반려견을 맡기신적이 아직 없네요ㅜ");
                       }else{
                          //이러면 여기서 이제 새로운 창을 띄워서 댓글 입력을 받는다
                          //거기서 작성 완료버튼을 누르면 저장을 하고 다시 이페이지를 불러온다.
                          
                          var popupX = (window.screen.width / 2) - (600 / 2);
                        // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
                        
                        var popupY= (window.screen.height / 2) - (350 / 2);
                        
                        window.open('<%=request.getContextPath()%>/views/petsitter/review.jsp?psbNo=<%= psBoardNo %>', 'review', 'status=no, height=350, width=600, left='+ popupX + ', top='+ popupY);
                       }
                    },
                    error:function(){
                       console.log("ajax 통신 실패");
                    }
                 })              
              <%}%>
           <%}%>
        }
        //댓글 삭제하기 위해서
        function deleteReply(){
           var commentNo = $("#commentNo").val();
           $.ajax({
              url:"<%=request.getContextPath()%>/DeleteReply?psBoardNo=<%= psBoardNo %>",
            type:"post",
              data:{
                 commentNo:commentNo
              },
              success:function(data){
                 console.log("ajax 통신 성공");
                 if(data == "deleteFail"){
                    alert("댓글 삭제 실패!");
                 }else{ //댓글 삭제 성공시
                    alert("댓글 삭제 성공!");
                    location.reload();
                 }
              },
              error:function(){
                 console.log("ajax 통신 실패")
              }
              
           })
        }
        
        //댓글 수정하기 위해서
        function fixReply(){
           var commentNo = $("#commentNo").val();
           
         var popupX = (window.screen.width / 2) - (600 / 2);
         // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
         
         var popupY= (window.screen.height / 2) - (350 / 2);
         
         window.open('<%=request.getContextPath()%>/views/petsitter/review.jsp?psbNo=<%= psBoardNo %>&commentNo='+commentNo, 'review', 'status=no, height=350, width=600, left='+ popupX + ', top='+ popupY);
        }
     </script>
</body>
</html>