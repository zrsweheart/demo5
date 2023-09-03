<%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/4/3
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="bean.station" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .ziti {

            font-size: 18px;
            font-weight: 666;
            font-family:"幼圆";/*设置字体*/
            color:#494949;
        }</style>
</head>
<body>
<jsp:useBean id="util" class="dao.dao"/>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String id=(String)request.getParameter("number");

%>
<%if (id == null){%>
<img src="https://wx4.sinaimg.cn/mw2000/008aq7W6ly1h0ukeojflcj30oo0gdtgv.jpg" alt="">
<%}else{
    List<station> list = util.readStation(id);
%>

            <form action=" " method="get" id="form" onsubmit="return check()" >
                <table border="0" style="width: 650px;   height: 350px;">

                    <tr>
                        <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;</td>


                    </tr>
                    <%for (station s : list) { %>
                    <tr>
                        <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;第<%=s.getId()%>站</td>

                        <td class ="ziti" name="sation1"><%=s.getStation()%></td>
                        <td class="ziti">------------></td>

                    </tr>
                    <%} %>

                </table>
            </form>
   <%}%>

</body>
</html>





