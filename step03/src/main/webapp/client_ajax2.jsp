<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ArrayList<Integer> list = new ArrayList<Integer>();
	for(int i=1; i<=num; i++){
		if(num%i==0){
			list.add(i);
		}
	}
	JSONArray r=new JSONArray(list);
	out.write(r.toString());
%>