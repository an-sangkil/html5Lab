<%@ page contentType="text/event-stream; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
	String lastEventId = request.getHeader("Last-Event-ID");
	//System.out.println("last eventId : " + lastEventId);
	
	List<String> msgList = null;
	Object msgListObj = application.getAttribute("msgList");
	if(msgListObj != null){
		msgList = (List<String>)msgListObj;
	}else{
		msgList = new ArrayList<String>();
	}
	
	int eventId = msgList.size();
	out.println("id: " + eventId + "\n");
	
	if(lastEventId == null){
		lastEventId = msgList.size() + "";
		out.println("data: 대화방에 입장하였습니다.\n");
	}
	
	List<String> newMsgList = msgList.subList(Integer.parseInt(lastEventId), msgList.size());
	for(String msg : newMsgList){
		out.println("data: " + msg + "\n");
	}
	
	out.println("retry: " + 1000*3 + "\n");
%>