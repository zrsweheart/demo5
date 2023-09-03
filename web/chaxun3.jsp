<%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/4/3
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="bean.station" %>
<%@ page import="dao.dao" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .ziti {
            list-style-type:square ;
            font-size: 18px;
            font-weight: 666;
            font-family:"幼圆";/*设置字体*/
            color:#494949;
        }</style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String start = (String) request.getParameter("start");
    String stop = (String) request.getParameter("stop");

%>
<%

    if (start == null) {%>
<img src="https://wx4.sinaimg.cn/mw2000/008aq7W6ly1h0ukeojflcj30oo0gdtgv.jpg" alt="">
<%} else {
        boolean f1=dao.judgestation(start);
        boolean f2=dao.judgestation(stop);
       boolean f=dao.judgeline(start,stop,f1,f2);
       if(f==true){
         int line =dao.search_bukeline(start);
         int id1=dao.readId(line,start);
         int id2=dao.readId(line,stop);
         List<station> list = dao.readStations(line,id1-1,id2-id1+1);
    %>

<div style="border-radius:30px;width:600px;height:300px;float:right; position: absolute;
   ">
    <p class="ziti">&nbsp;<%=line%>号线</p>

    <%for (station s : list) { %>
  <ul>
    <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;第<%=s.getId()%>站&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getStation()%></li>

</ul>
    <%} %>

</div>

<% }}%>
</body>
</html>