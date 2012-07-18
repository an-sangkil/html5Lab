<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
	String msg = request.getParameter("msg");
	if(msg != null && msg.trim().length() > 0){	
		List<String> msgList = (List<String>)application.getAttribute("msgList");
		if(msgList == null){
			msgList = new ArrayList<String>();
			application.setAttribute("msgList", msgList);
		}
		msgList.add(msg);
	}
%>