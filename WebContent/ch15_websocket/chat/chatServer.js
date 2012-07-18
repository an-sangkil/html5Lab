// socket.io 라이브러리를 로딩한 후 8089 포트를 오픈한다.
var io = require("socket.io").listen(8089);

// 클라이언트가 접속할 경우
io.sockets.on("connection", function(socket){
	// logon 이벤트가 발생할 경우
	socket.on("logon", function(name){
		// 대화명을 꺼낸다.
		socket.set("nickname", name, function(){
			// 접속된 모든 클라이언트에 메세지 전송
			io.sockets.emit("chat", {
				msg: name + "님이 입장했습니다.",
				msgr: "시스템 메세지"
			});
		});
	});
	// chat 이벤트가 발생할 경우
	socket.on("chat", function(msg){
		var sender = "";
		// 대화명을 저장한다.
		socket.get("nickname", function(error, name){
			sender = name;
		});
		// 메세지를 보낸 클라이언트를 제외한 모든 클라이언트에 메세지 전송
		socket.broadcast.emit("chat", {
			msg: msg,
			msgr: sender,
			notice: msg.indexOf("공지") == 0
		});
	});	
	
	socket.on("disconnect", function() {
		socet.get("nickname", function(error, name) {
			io.socket.emit("chat",{
				msg  : name + "님이 퇴장 했습니다.",
				msgr : "시스템메세지"
			});
		});
	});
	
});