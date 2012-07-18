var clients = [];
// 공유워커 생성 시 호출
onconnect = function(me){
	clients.push(me.ports[0]);
	me.ports[0].postMessage("connected...");
	
	// TODO message 이벤트 처리(UI 스레드에서 보낸 메세지를 clients 목록에 전달한다.)
	me.ports[0].onmessage = function (me2) {
		for(var i = 0 ; i < clients.length ; i++ ){
			clients[i].postMessage("전달 :" +me2.data);
		}
	};
	
};