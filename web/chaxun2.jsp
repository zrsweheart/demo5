        <%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/4/3
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="bean.station" %>
<%@ page import="dao.dao" %>
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
    String zd = (String) request.getParameter("zhandian");

%>
<%

    if (zd == null) {%>
<img src="https://wx4.sinaimg.cn/mw2000/008aq7W6ly1h0ukeojflcj30oo0gdtgv.jpg" alt="">
<%} else {
  int  line = dao.search_bukeline(zd);
  int  line1= dao.search_keline1(zd);
  int  line2= dao.search_keline2(zd);
  if(line!=0){
%>

<div style="border-radius:30px;width:600px;height:300px;float:right; position: absolute;
   ">
    <p>&nbsp;</p>
    <p class="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#531ad7;font-size:22px;"><%=zd%></span>站为<span style="color:#c93243;">不可</span>换乘站&nbsp;&nbsp;该站点历经以下线路：&nbsp;&nbsp;</p>
    <HR style="border:2 dashed #808080" width="100%" color=#808080 SIZE=2>
    <p>&nbsp;</p>
    <ul>

        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<%=line%>号线</li>

    </ul>
</div>
<%}
if(line==0){
%>
<div style="border-radius:30px;width:600px;height:300px;float:right; position: absolute;
   ">
    <p>&nbsp;</p>
    <p class="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#531ad7;font-size:22px;"><%=zd%></span>站为<span style="color:#c93243;">可</span>换乘站&nbsp;&nbsp;该站点历经以下线路：&nbsp;&nbsp;</p>
    <HR style="border:2 dashed #808080" width="100%" color=#808080 SIZE=2>
    <p>&nbsp;</p>
    <ul>

        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<%=line1%>号线</li>
        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<%=line2%>号线</li>

    </ul>
</div>

<%}
    if("西直门".equals(zd)) {
    %>
<div style="border-radius:30px;width:600px;height:300px;float:right; position: absolute;
   ">
    <p>&nbsp;</p>
    <p class="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#531ad7;font-size:22px;"><%=zd%></span>站为<span style="color:#c93243;">可</span>换乘站&nbsp;&nbsp;该站点历经以下线路：&nbsp;&nbsp;</p>
    <HR style="border:2 dashed #808080" width="100%" color=#808080 SIZE=2>
    <p>&nbsp;</p>
    <ul>

        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;2号线</li>
        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;4号线</li>
        <li class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;13号线</li>

    </ul>
</div>
<%}}%>

</body>
</html>



