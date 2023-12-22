<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Random random=new Random();
	int ea=Integer.parseInt(request.getParameter("ea"));
	ArrayList<HashSet<Integer>>list=new ArrayList<HashSet<Integer>>();
	
	for(int i =0; i<ea; i++){
		HashSet<Integer> set =new HashSet<Integer>();
		while(set.size()<6){
			set.add(random.nextInt(45)+1);
		}
		list.add(set);
	}


%>
<%
request.setAttribute("lotto", list);
request.getRequestDispatcher("lotto_result.jsp").forward(request, response);%>
