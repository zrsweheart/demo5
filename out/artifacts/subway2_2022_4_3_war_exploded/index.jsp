<%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/4/3
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jdk.nashorn.internal.ir.FunctionNode" %><%@ page import="bean.station" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.org.apache.xpath.internal.objects.XNumber" %>

<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>地铁</title>
  <style type="text/css">
    /*设置超链接样式*/
    table {
      border-collapse: collapse;
      border-spacing: 0;
    }

    a {
      color: #ffffff;
      text-decoration:none;
      font-family:"幼圆";/*设置字体*/
      font-size:18px;/*设置字体大小*/
      font-weight:5px;/*调整字体粗细*/

    }

    a:hover {
      color:#f56f2c;

      font-size: 18px;
    }

    a:visited {
      color: #5086a5;
      font-size: 12px;
    }
    /*整个tab层居中，宽度为600px*/
    #tabDiv {
      width: 600px;
      margin: 1em auto;
      padding-bottom: 10px;
      border-right: #ffffff 1px solid;
      border-top: #ffffff 1px solid;
      border-left: #ffffff 1px solid;
      border-bottom: #ffffff 1px solid;
      background-color:#fffef9 ;

    }
    /*tab头的样式*/
    #tabsHead {

      height: 226px;
      background-color:#9bc1d2 ;


    }
    /*已选tab头（超链接）的样式*/
    .curtab {
      padding-top: 0px;
      padding-right: 10px;
      padding-bottom: 0px;
      padding-left: 10px;
      border-right: #b2c9d3 1px solid;
      font-weight: bold;
      float: left;
      cursor: pointer;

    }
    /*未选tab头（超链接）的样式*/
    .tabs {
      border-right: #c1d8e0 1px solid;
      padding-top: 0px;
      padding-right: 10px;
      padding-bottom: 0px;
      padding-left: 10px;
      font-weight: normal;
      float: left;
      cursor: pointer;
    }

    li {

      font-family:"幼圆";/*设置字体*/
      font-size: 18px;
      font-weight: 666;
      color:#494949;

    }
    .title {
      float: right;

      font-size: 24px;
      font-weight: 500;
      font-family:"幼圆";/*设置字体*/
      color:#ffffff;
    }

    .ziti {

      font-size: 18px;
      font-weight: 666;
      font-family:"幼圆";/*设置字体*/
      color:#494949;
    }
    .ziti2 {

      font-size: 23px;
      font-weight: 666;
      font-family:"幼圆";/*设置字体*/
      color:#494949;
    }
    .ziti3 {

      font-size: 18px;
      font-weight: 666;
      font-family:"幼圆";/*设置字体*/
      color:#000000;
    }
    button { /* 按钮美化 */
      width: 200px; /* 宽度 */
      height: 40px; /* 高度 */
      border-width: 0px; /* 边框宽度 */
      border-radius: 5px; /* 边框半径 */
      background: #9bc1d2; /* 背景颜色 */
      cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
      outline: none; /* 不显示轮廓线 */
      font-family: "幼圆"; /* 设置字体 */
      color: white; /* 字体颜色 */
      font-size: 17px; /* 字体大小 */
    }
    button:hover { /* 鼠标移入按钮范围时改变颜色 */
      background: #5599FF;
    }

    .select{
      background:#fafdfe;
      height:31px;
      width:200px;
      line-height:28px;
      border:1px solid #9bc0dd;
      -moz-border-radius:2px;
      -webkit-border-radius:2px;
      border-radius:2px;
    }
    .div_foot {
      position: absolute;
      height: 50px;
      text-align: center;
      line-height: 50px;
      width: 100%;
    }
  </style>

  <script type="text/jscript">
        //显示tab（tabHeadId：tab头中当前的超链接；tabContentId要显示的层ID）
        function showTab(tabHeadId,tabContentId)
        {
            //tab层
            var tabDiv = document.getElementById("tabDiv");
            //将tab层中所有的内容层设为不可见
            //遍历tab层下的所有子节点
            var taContents = tabDiv.childNodes;
            for(i=0; i<taContents.length; i++)
            {
                //将所有内容层都设为不可见
                if(taContents[i].id!=null && taContents[i].id != 'tabsHead')
                {
                    taContents[i].style.display = 'none';
                }
            }
            //将要显示的层设为可见
            document.getElementById(tabContentId).style.display = 'block';
            //遍历tab头中所有的超链接
            var tabHeads = document.getElementById('tabsHead').getElementsByTagName('a');
            for(i=0; i<tabHeads.length; i++)
            {
                //将超链接的样式设为未选的tab头样式
                tabHeads[i].className='tabs';
            }
            //将当前超链接的样式设为已选tab头样式
            document.getElementById(tabHeadId).className='curtab';
            document.getElementById(tabHeadId).blur();
        }
</script>





</head>
<body>


<div id="tabDiv" style="padding:30px;border-radius:20px;width:90%;height:600px;margin: auto; ">

  <div id="tabsHead" style="border-radius:15px;border:10px solid #9bc1d2;float:left;width:12%;height:600px;text-align:center;  ">
    <h1></h1>
    <div style="border-radius:90px;width:90px;height:90px; background: url(https://images.cnblogs.com/cnblogs_com/blogs/690901/galleries/1992752/o_220329142431_1648563849495.jpg);background-size:cover;margin: auto;text-align:center">

    </div>
    <p></p><br>

    <a id="tabs1" class="curtab" href="javascript:showTab('tabs1','tabContent1')">线路查询</a><br>
    <p></p>
    <a id="tabs2" class="tabs" href="javascript:showTab('tabs2','tabContent2')">站点查询</a> <br>
    <p></p>
    <a id="tabs3" class="tabs" href="javascript:showTab('tabs3','tabContent3')">起点-终点查询</a><br>
    <p></p>

  </div>

  <div id="tabContent1" style="border-radius:15px;border:5px solid #9bc1d2;width:1150px;height:600px;float:right; position:relative;display: block" >
    <p> &nbsp;</p>
    <p>&nbsp;</p>

    <div style="border-radius:30px;border:5px solid #9bc1d2;width:700px;height:380px;position: absolute;right:80px;">
      <iframe id="myIframe1" name="hideIframe1" style="" src="chaxun.jsp" frameborder="0" width="100%" height="100%"></iframe>
    </div>
    <p> &nbsp;</p>
    <p>&nbsp;</p>
    <h1 class="ziti2"> &nbsp;请选择你想要查询的地铁线路 </h1>
    <p> &nbsp;</p>
    <form action="chaxun.jsp" method="post" target="hideIframe1"  >
      <p> &nbsp;&nbsp;&nbsp;&nbsp; <select name="number" class="select" >
        <option value="1"selected>一号线</option>
        <option value="2">二号线</option>
        <option value="4">四号线</option>
        <option value="5">五号线</option>
        <option value="6">六号线</option>
        <option value="7">七号线</option>
        <option value="8">八号线</option>
        <option value="9">九号线</option>
        <option value="10">十号线</option>
        <option value="13">十三号线</option>
        <option value="14">十四号线</option>
        <option value="15">十五号线</option>
      </select><br></p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp; <button type="submit" id="id_submit" name="nm_submit" value="提交">查询</button></p>
    </form>


  </div>

  <div id="tabContent2" style="border-radius:15px;border:5px solid #9bc1d2;width:1150px;height:600px;float:right; position:relative;display:  none"  >
    <p> &nbsp;</p>


    <p>&nbsp;</p>

    <div style="border-radius:30px;border:5px solid #9bc1d2;width:700px;height:380px;position: absolute; right:80px;">
      <iframe id="myIframe2" name="hideIframe2" style="" src="chaxun2.jsp" frameborder="0" width="100%" height="100%"></iframe>
    </div>
    <p> &nbsp;</p>
    <p>&nbsp;</p>
    <h1 class="ziti2"> &nbsp;请输入你想要查询的站点 </h1>
    <p> &nbsp;</p>
    <form action="chaxun2.jsp " method="get" id="form2" target="hideIframe2"  >
      <p> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text"name="zhandian"class="select">
      </p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp; <button type="submit" value="查询">查询</button></p>
    </form>
  </div>



  <div id="tabContent3" style="border-radius:15px;border:5px solid #9bc1d2;width:1150px;height:600px;float:right; position:relative;display:  none"  >
    <p> &nbsp;</p>


    <p>&nbsp;</p>

    <div style="border-radius:30px;border:5px solid #9bc1d2;width:700px;height:380px;position: absolute; right:80px; background-color: white;">
      <iframe id="myIframe3" name="hideIframe3" style="" src="chaxun3.jsp" frameborder="0" width="100%" height="100%"></iframe>

    </div>
    <p> &nbsp;</p>
    <form action="chaxun3.jsp" method="get" id="form3" target="hideIframe3">
      <table border="0" style="width: 30%;   height: 300px;float:left">
        <tr>
          <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>

        <tr>
          <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;起始站：<input name="start" type="text" size="20"></td>
        </tr>

        <tr>
          <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;终点站：<input name="stop" type="text" size="20"></td>
        </tr>
        <tr>
          <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class ="ziti">&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" value="查询">查询</button></td>
        </tr>
      </table>
    </form>
  </div>

</div>



<div class="div_foot"style="position:fixed; bottom:0px; width:100%; text-align:center; font-family:"幼圆";  font-size: 17px;">
&copy;制作人：张榕，耿晴
</div>

</div>


</body>
</html>