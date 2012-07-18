onmessage = function(me){
	if(me.data == "calc"){
		// TODO 복잡한 작업 계산
		var sum = 0;
		for(var i=0; i<3000000000; i++){
			sum += i;
		}
		
		// TODO 작업 결과 전송
		postMessage("합계: " + sum);
		
	}else{
		// TODO 받은 메세지 반송
		postMessage("반송메시지: " + me.data);
	}
};