function log(msg){
	var log = document.getElementById("log");
	if(!log){
		log = document.querySelector(".log");
	}
	if(log) log.innerHTML += msg + "<br>";
}

//현재 날짜를 문자열로 반환
function dateToString(){
	var date = new Date();
	var result = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	return result;
}