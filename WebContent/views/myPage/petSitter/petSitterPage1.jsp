<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, petsitter.model.vo.*, java.util.Calendar"%>
<%
	PsInfo ps = (PsInfo)request.getAttribute("PsInfo");
	PsSchedule sch =(PsSchedule)request.getAttribute("SchInfo");
    
	String schList[]=null;

	if(sch!=null){
		schList= sch.getApDate().split(",");
		Calendar cToday = Calendar.getInstance();
		String year =  String.valueOf(cToday.get(Calendar.YEAR));
		
		for(int i=0; i<schList.length;i++){
			Integer.parseInt(schList[i] = year+schList[i]);
		}
	}
	int dogsu = 0;
	
	ArrayList<Reservation> rlist = (ArrayList<Reservation>)request.getAttribute("rlist");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$(".startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "dd",
									minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
								});
				
			});
</script>
<style>
.container2 {
	margin-top: 2%;
	width: 100%;
}

* {
	font-size: 11pt;
}

.tableArea {
	width: 70%;
	padding: 1%;
	margin-top: 1%;
}

.elegant-calencar {
	width: 30em;
	height: 27em;
	border: 1px solid #c9c9c9;
	-webkit-box-shadow: 0 0 5px #c9c9c9;
	box-shadow: 0 0 5px #c9c9c9;
	text-align: center;
	position: relative;
	float: left;
	margin-bottom: 3%;
	margin-left: 5%;
}

#header {
	font-family: 'HelveticaNeue-UltraLight', 'Helvetica Neue UltraLight',
		'Helvetica Neue', Arial, Helvetica, sans-serif;
	height: 10em;
	background-color: #2a3246;
	margin-bottom: 1em;
}

.pre-button, .next-button {
	margin-top: 2em;
	font-size: 3em;
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
	cursor: pointer;
	width: 1em;
	height: 1em;
	line-height: 1em;
	color: #e66b6b;
	border-radius: 50%;
}

.pre-button:hover, .next-button:hover {
	-webkit-transform: rotate(360deg);
	-ms-transform: rotate(360deg);
	transform: rotate(360deg);
}

.pre-button:active, .next-button:active {
	-webkit-transform: scale(0.7);
	-ms-transform: scale(0.7);
	transform: scale(0.7);
}

.pre-button {
	float: left;
	margin-left: 0.5em;
}

.next-button {
	float: right;
	margin-right: 0.5em;
}

.head-info {
	float: left;
	width: 16em;
}

.head-day {
	
}

.head-month {
	margin-top: 2em;
	margin-left: 1em;
	font-size: 2em;
	line-height: 1;
	color: #fff;
}

#calendar {
	width: 90%;
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

#ctbody #ctd {
	width: 14%;
	border-radius: 50%;
	cursor: pointer;
	-webkit-transition: all 0.2s ease-in;
	transition: all 0.2s ease-in;
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
	background-color: #e66b6b;
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
	background-color: #6be6b7;
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
	color: #e66b6b;
	border-color: #e66b6b;
}

#reset:active {
	-webkit-transform: scale(0.8);
	-ms-transform: scale(0.8);
	transform: scale(0.8);
}

.inner {
	margin-top: 2%;
	margin-bottom: 8%;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	border: 1px solid rgba(0, 0, 0, .05);
	border-radius: .375rem;
	background-color: #fff;
	background-clip: border-box;
}

.card>hr {
	margin-right: 0;
	margin-left: 0;
}

.card-body {
	padding: 1.5rem;
	flex: 1 1 auto;
}

.card-header {
	margin-bottom: 0;
	padding: 1.25rem 1.5rem;
	border-bottom: 1px solid rgba(0, 0, 0, .05);
	background-color: #fff;
}

.card-header:first-child {
	border-radius: calc(.375rem - 1px) calc(.375rem - 1px) 0 0;
}

.border-0 {
	border: 0 !important;
}

.rounded-circle {
	border-radius: 50% !important;
	width: 10rem;
	height: 10rem;
}

.d-flex {
	display: flex !important;
}

.justify-content-center {
	justify-content: center !important;
}

.justify-content-between {
	justify-content: space-between !important;
}

.align-items-center {
	align-items: center !important;
}

@media ( min-width : 1200px) {
	.justify-content-xl-between {
		justify-content: space-between !important;
	}
}

.float-right {
	float: right !important;
}

.shadow, .card-profile-image img {
	box-shadow: 0 0 2rem 0 rgba(136, 152, 170, .15) !important;
}

.mr-2 {
	margin-right: .5rem !important;
}

.mt-4, .my-4 {
	margin-top: 1.5rem !important;
}

.mr-4 {
	margin-right: 1.5rem !important;
}

.my-4 {
	margin-bottom: 1.5rem !important;
}

.mb-5 {
	margin-bottom: 3rem !important;
}

.mt-7 {
	margin-top: 6rem !important;
}

.pt-0 {
	padding-top: 0 !important;
}

.pb-0 {
	padding-bottom: 0 !important;
}

.pt-8 {
	padding-top: 8rem !important;
}

.m-auto {
	margin: auto !important;
}

@media ( min-width : 768px) {
	.mt-md-5 {
		margin-top: 3rem !important;
	}
	.pt-md-4 {
		padding-top: 1.5rem !important;
	}
	.pb-md-4 {
		padding-bottom: 1.5rem !important;
	}
}

@media ( min-width : 1200px) {
	.mb-xl-0 {
		margin-bottom: 0 !important;
	}
}

.text-center {
	text-align: center !important;
}

.font-weight-light {
	font-weight: 300 !important;
}

@media print {
	*, *::before, *::after {
		box-shadow: none !important;
		text-shadow: none !important;
	}
	a:not (.btn ) {
		text-decoration: underline;
	}
	img {
		page-break-inside: avoid;
	}
	p, h2, h3 {
		orphans: 3;
		widows: 3;
	}
	h2, h3 {
		page-break-after: avoid;
	}
	@
	page {
		size: a3;
	}
}

@
keyframes floating-lg { 0% {
	transform: translateY(0px);
}

50%
{
transform
:translateY



(15
px
);


}
100%
{
transform
:translateY


(0
px
);


}
}
@
keyframes floating { 0% {
	transform: translateY(0px);
}

50%
{
transform


:



translateY



(10
px


);
}
100%
{
transform


:


translateY



(0
px
);


}
}
@
keyframes floating-sm { 0% {
	transform: translateY(0px);
}

50%
{
transform
:


translateY


(5
px
);


}
100%
{
transform
:translateY(0px)
;


}
}
[class*='shadow'] {
	transition: all .15s ease;
}

.font-weight-300 {
	font-weight: 300 !important;
}

.btn {
	font-size: .875rem;
	position: relative;
	transition: all .15s ease;
	letter-spacing: .025em;
	text-transform: none;
	will-change: transform;
}

.btn: hover {
	transform: translateY(-1px);
	box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px
		rgba(0, 0, 0, .08);
}

.btn: not
 (:last-child ) {
	margin-right: .5rem;
}

.btn i :not
 (:first-child ) {
	margin-left: .5rem;
}

.btn
 
i
 
:not


(
:last-child


)
{
margin-right
:
.5rem
;


}
.btn-sm {
	font-size: .75rem;
}

[class*='btn-outline-'] {
	border-width: 1px;
}

.card-profile-image {
	position: relative;
}

.card-profile-image img {
	position: absolute;
	left: 50%;
	max-width: 180px;
	transition: all .15s ease;
	transform: translate(-50%, -30%);
	border-radius: .375rem;
}

.card-profile-image img:hover {
	transform: translate(-50%, -33%);
}

.card-profile-stats {
	padding: 1rem 0;
}

.card-profile-stats>div {
	margin-right: 1rem;
	padding: .875rem;
	text-align: center;
}

.card-profile-stats>div:last-child {
	margin-right: 0;
}

.card-profile-stats>div .heading {
	font-size: 1.1rem;
	font-weight: bold;
	display: block;
}

.card-profile-stats>div .description {
	font-size: .875rem;
	color: #adb5bd;
}

.main-content {
	position: relative;
}

.footer {
	padding: 2.5rem 0;
	background: #f7fafc;
}

.footer .copyright {
	font-size: .875rem;
}

@media ( min-width : 768px) { @
	keyframes show-navbar-dropdown { 0% {
		transition: visibility .25s, opacity .25s, transform .25s;
		transform: translate(0, 10px) perspective(200px) rotateX(-2deg);
		opacity: 0;
	}
	100%
	{
	transform
	:
	 
	translate
	

	(0,0);
	opacity
	:
	1;
	

}

}
@
keyframes hide-navbar-dropdown {from { opacity:1;
	
}

to {
	transform: translate(0, 10px);
	opacity: 0;
}

}
}
@
keyframes show-navbar-collapse { 0% {
	transform: scale(.95);
	transform-origin: 100% 0;
	opacity: 0;
}

100%
{
transform
:
 
scale
(1);


opacity
:
1;


}
}
@
keyframes hide-navbar-collapse {from { transform:scale(1);
	transform-origin: 100% 0;
	opacity: 1;
}

to {
	transform: scale(.95);
	opacity: 0;
}

}
.description {
	font-size: .875rem;
}

.heading {
	font-size: .95rem;
	font-weight: 600;
	letter-spacing: .025em;
	text-transform: uppercase;
}

@media ( max-width : 768px) {
	.btn {
		margin-bottom: 10px;
	}
}

#tablea {
	display: inline;
}

.in {
	width: 100%;
	height: 100%;
	margin-bottom: 3%;
	display: inline-block;
}

.columns {
	width: 27em;
	border: 1px solid #c9c9c9;
	-webkit-box-shadow: 0 0 5px #c9c9c9;
	box-shadow: 0 0 5px #c9c9c9;
	text-align: center;
	position: relative;
	float: left;
	margin-bottom: 3%;
	margin-left: 5%;
}

.price {
	list-style-type: none;
	border: 1px solid #eee;
	margin: 0;
	padding: 0;
	-webkit-transition: 0.3s;
	transition: 0.3s;
}

.price .header {
	background-color: #111;
	color: white;
	font-size: 25px;
}

.price li {
	border-bottom: 1px solid #eee;
	padding: 20px;
	text-align: center;
}

.price .grey {
	background-color: #eee;
	font-size: 20px;
}
/* 모달 */
        .seminor-login-modal-body .close{
 position: relative;
 top: -45px;
 left: 10px;
color: #1cd8ad;
}
.seminor-login-modal-body .close{
    opacity:0.75;
}

.seminor-login-modal-body .close:focus, .seminor-login-modal-body .close:hover {
    color: #39e8b0;
 opacity: 1;
 text-decoration: none;
 outline:0;
}

.seminor-login-modal .modal-dialog .modal-content{
    border-radius:0px;
}

/* form animation */
.seminor-login-form .form-group {
  position: relative;
  margin-bottom: 1.5em !important;
}
.seminor-login-form .form-control{
 border: 0px solid #ced4da !important;
 border-bottom:1px solid #adadad !important;
 border-radius:0 !important;
}
.seminor-login-form .form-control:focus, .seminor-login-form .form-control:active{
 outline:none !important;
 outline-width: 0;
 border-color: #adadad !important;
 box-shadow: 0 0 0 0.2rem transparent;
}
*:focus {
 outline: none;
}
.seminor-login-form{
 padding: 2em 0 0;
}

.form-control-placeholder {
position: absolute;
top: 0;
padding: 7px 0 0 13px;
transition: all 200ms;
opacity: 0.5;
border-top: 0px;
border-left: 0;
border-right: 0;
}

.form-control:focus + .form-control-placeholder,
.form-control:valid + .form-control-placeholder {
font-size: 75%;
-webkit-transform: translate3d(0, -100%, 0);
       transform: translate3d(0, -100%, 0);
opacity: 1;
}

.container-checkbox input {
 position: absolute;
 opacity: 0;
 cursor: pointer;
}
.checkmark-box {
 position: absolute;
 top: -5px;
 left: 0;
 height: 25px;
 width: 25px;
 background-color: #adadad;
}
.container-checkbox {
 display: block;
 position: relative;
 padding-left: 40px;
 margin-bottom: 20px;
 cursor: pointer;
 font-size: 14px;
 font-weight: bold;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
 line-height: 1.1;
}
.container-checkbox input:checked ~ .checkmark-box:after {
 color: #fff;
}
.container-checkbox input:checked ~ .checkmark-box:after {
 display: block;
}
.container-checkbox .checkmark-box:after {
 left: 10px;
 top: 4px;
 width: 7px;
 height: 15px;
 border: solid white;
 border-width: 0 3px 3px 0;
 -webkit-transform: rotate(45deg);
 -ms-transform: rotate(45deg);
 transform: rotate(45deg);
}
.checkmark:after, .checkmark-box:after {
 content: "";
 position: absolute;
 display: none;
}
.container-checkbox input:checked ~ .checkmark-box {
 background-color: #f58220;
 border: 0px solid transparent;
}
.btn-check-log .btn-check-login {
 font-size: 16px;
 padding: 10px 0;
}
button.btn-check-login:hover {
    color: #fff;
    background-color: #f58220;
    border: 2px solid #f58220;
}
.btn-check-login {
 color: #f58220;
 background-color: transparent;
 border: 2px solid #f58220;
 transition: all ease-in-out .3s;
}
.btn-check-login {
 display: inline-block;
 padding: 12px 0;
 margin-bottom: 0;
 line-height: 1.42857143;
 text-align: center;
 white-space: nowrap;
 vertical-align: middle;
 -ms-touch-action: manipulation;
 touch-action: manipulation;
 cursor: pointer;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
 background-image: none;
 border-radius: 0;
 width: 100%;
}
.forgot-pass-fau a {
    text-decoration: none !important;
    font-size: 14px;
}
.text-primary-fau {
    color: #1959a2;
}

.select-form-control-placeholder{
  font-size: 100%;
    padding: 7px 0 0 13px;
    margin: 0;
}

</style>
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
							if(<%=schList!=null%>){
								"<% for(int i=0; i<schList.length;i++){%>"
								eval("day"+ <%=i%> + "= new Date(<%=Integer.parseInt(schList[i].substring(0,4))
								%>,<%= (Integer.parseInt(schList[i].substring(4,6)))-1%>,<%=schList[i].substring(6,8)%>)")
								"<%}%>"
								var sch="";
								for (var k=0; k<<%=schList.length%> ;k++){
								    if(k==(<%=schList.length%>- 1)) {
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
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<div class="inner">
		<div class="inner2"></div>
		<div class="container">


			<div class="main-content">
				<div class="container mt-7">
					<!-- Table -->
					<h2 class="mb-5"></h2>
					<div class="row">
						<div class="col-xl-8 m-auto order-xl-2 mb-5 mb-xl-0">
							<div class="card card-profile shadow">
								<div class="row justify-content-center">
									<div class="col-lg-3 order-lg-2">
										<div class="card-profile-image">
											<a href="#"> <img
												src="<%=request.getContextPath()%>/resources/userimg/<%=loginUser.getChangeName()%>"
												class="rounded-circle">
											</a>
										</div>
									</div>
								</div>
								<br> <br> <br> <br>
								<div class="card-body pt-0 pt-md-4">

									<div class="text-center">
										<br>
										<h3>
											<%=ps.getUserId()%><span class="font-weight-light">
												회원님</span>
										</h3>

										<div class="h5 mt-4">
											<i class="ni business_briefcase-24 mr-2"></i>자견단 공식 펫시터
										</div>

										<div class="h5 mt-4">
											<i class="ni business_briefcase-24 mr-2"></i> 점수 :
											<%=ps.getScore()%>
											/ 5
										</div>


										<hr class="my-4">
										<br>
										<p>펫시터 관련 문의사항은 마이페이지의 1:1 문의 게시판을 이용해주세요</p>
										<br> &nbsp;&nbsp;
										<button type="button" onclick="gotoFix()">펫시터 글 수정하기</button>
										&nbsp;&nbsp;
										<%
											if (sch.getApDate().equals("000000")) {
										%>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#zz">스케줄 입력하기</button>
										<%
											} else {
										%>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#zz">스케줄 수정하기</button>
										<%
											}
										%>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!------------------------- 등록 모달----------------------------------------------- -->
			<div class="modal fade seminor-login-modal" id="zz">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<!-- Modal body -->
						<h2>이달(12월)의 예약 불가능 날짜 설정</h2>
						<br>
						<br>
						<div id="inner">
							<input type="text" class="startDate" id="date1">일
							<button type="button" id="plusDate">추가</button>
							<div id="inner2">
								<form id="scheduleUpdate" name="scheduleUpdate"
									action="<%=request.getContextPath()%>/PetsitterSchedule"
									method="post">
									<div id="inner3">
										<input id="num" name="num" value="0" type="hidden"> <input
											id="psNo" name="psNo" value="<%=ps.getPsNo()%>"
											type="hidden"> <input id="userNo" name="userNo"
											value="<%=ps.getUserNo()%>" type="hidden">
										<div id="inner4">
										</div>
									</div>
									<button>설정</button>
								</form>
								<br>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------------------------------- -->

			<br>

			<h3>예약 정보</h3>
			<br>
			<div class="in">
				<div class="elegant-calencar">
					<div id="header" class="clearfix">
						<div class="pre-button"><</div>
						<div class="head-info">
							<div class="head-day"></div>
							<div class="head-month"></div>
						</div>
						<div class="next-button">></div>
					</div>
					<table id="calendar">
						<thead id="cthead">
							<tr id="ctr">
								<th id="cth">Sun</th>
								<th id="cth">Mon</th>
								<th id="cth">Tue</th>
								<th id="cth">Wed</th>
								<th id="cth">Thu</th>
								<th id="cth">Fri</th>
								<th id="cth">Sat</th>
							</tr>
						</thead>
						<tbody id="ctbody">
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
							<tr id="ctr">
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
								<td id="ctd"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="columns">
					<ul class="price">
						<li class="header" style="background-color: #5caf5d">이달의 예약
							불가능 날짜</li>
						<%if(!(sch.getApDate().equals("000000"))){ %>
	 						<%for(int i=0; i<schList.length; i++) {%>
							<li><%=schList[i].substring(4,6) %>월 <%=schList[i].substring(6,8) %>일</li>
							 <%} %> 
						 <%}else {%>
						 	<li>등록된 스케줄이 없습니다! 스케줄을 등록해주세요~</li>
						<%} %>
					</ul>
				</div>
				<br> <br> <br>
				<table class="table table-hover">
					<thead>
						<tr>
							<!-- 예약번호 클릭하면 상세페이지로이동 -->
							<th>예약 번호</th>
							<th>고객 이름</th>
							<th>시작 날짜</th>
							<!-- 예약날짜~종료날짜로 표기 -->
							<th>종료 날짜</th>
							<th>요청 사항</th>

							<th>상태</th>
						</tr>
					</thead>
					<tr>
				<%if(!(rlist.isEmpty())) {%>
					<%int num=1;
					for(Reservation r : rlist) {%>
						<td><%=r.getPsBoardNum() %></td>
						<td><%=r.getUserNo() %></td>
						<td><%=r.getStartDate() %></td>
						<td><%=r.getEndDate() %></td>
						<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz<%=num%>">읽기</button></td>											

						<td>완료</td>
                    <!-- 모달 -->
   <div class="modal fade seminor-login-modal" id="zz<%=num%>">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body seminor-login-modal-body">
                    <button type="button" class="close" data-dismiss="modal">
                        <span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                    </button>
                    <div class="form-area">
                        <br style="clear:both">
                        <h3 style="margin-bottom: 25px; text-align: center;">요청사항</h3>
                        <div class="form-group">
                            
                            <textarea class="form-control" type="textarea" id="message"  disabled 
                                rows="7"><%=r.getRequirment() %></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달끝ㅋㅋ -->									
						<%} %>
						<%}else{%>
							<td>예약 내역이 없습니다!</td>
						<%}%>
					</tr>

					


				</table>
				<br>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script>
		var a = 0;
		$("#plusDate")
				.click(
						function() {
							var date = $("#date1").val();
							if($("#date1").val()){
							$("#inner4").append(date + "일");
							$("#inner4")
									.append(
											"<input name='a"+a+"' value= '"+date+"' type='hidden'> ");
							a = a + 1;
							$("#num").val(a);
							}else{
								alert("빈칸을 클릭해 날짜를 입력해주세요!");
							}
						});
	</script>
	<script>
		function gotoFix(){
			
			$.ajax({
				url:"<%= request.getContextPath()%>/CheckPsBoard",
				success:function(data){
					if(data == "written"){
						location.href="<%= request.getContextPath()%>/PsBoardUpdateServlet?psNo=<%= ps.getPsNo()%>"						
					}else{
						alert("펫시터 글을 등록 하시지 않으셨습니다.");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
</body>
</html>