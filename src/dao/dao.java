package dao;

import bean.station;
import util.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class dao {


    public List<station> readStation(String a) {
        List<station> list = new ArrayList<station>();
        Connection con=util.getConnection();
        ResultSet rs=null;
        String sql=null;
        switch(a){
            case "1": sql="select * from line1";break;
            case "2": sql="select * from line2";break;
            case "4": sql="select * from line4";break;
            case "5": sql="select * from line5";break;
            case "6": sql="select * from line6";break;
            case "7": sql="select * from line7";break;
            case "8": sql="select * from line8";break;
            case "9": sql="select * from line9";break;
            case "10": sql="select * from line10";break;
            case "13": sql="select * from line13";break;
            case "14": sql="select * from line14";break;
            case "15": sql="select * from line15";break;
        }
        try {//连接数据库的操作
            Statement statement=con.createStatement();
            rs=statement.executeQuery(sql);
            while (rs.next()) {
                station s = new station();
                s.setId(rs.getInt("id"));
                s.setStation(rs.getString("station"));


                list.add(s);
            }
            util.close(rs, statement, con);
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }


    public static int search_bukeline(String station){
      int line =0;
        try {
            Connection conn = util.getConnection();
            Statement state = null;
            String sql="select * from buke where station=?";
            PreparedStatement  pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,station);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){

                line= Integer.parseInt((rs.getString("line")));

            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch(SQLException e) {

            e.printStackTrace();
        }
        return line;

    }


    public static int search_keline1(String station){
        int line1 =0;

        try {
            Connection conn = util.getConnection();
            Statement state = null;
            String sql="select * from ke where station=?";
            PreparedStatement  pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,station);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                line1= Integer.parseInt((rs.getString("line1")));
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch(SQLException e) {

            e.printStackTrace();
        }
        return line1;


    }

    public static int search_keline2(String station){
        int line2 =0;

        try {
            Connection conn = util.getConnection();
            Statement state = null;
            String sql="select * from ke where station=?";
            PreparedStatement  pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,station);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                line2= Integer.parseInt((rs.getString("line2")));
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch(SQLException e) {

            e.printStackTrace();
        }
        return line2;


    }

    //判断站点是否可以换乘
    public static boolean judgestation(String station){
        boolean flag=true;
        int line =0;
        try {
            Connection conn = util.getConnection();
            Statement state = null;
            String sql="select * from buke where station=?";
            PreparedStatement  pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,station);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                line= Integer.parseInt((rs.getString("line")));
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch(SQLException e) {

            e.printStackTrace();
        }
       if(line==0){
           flag=true;
       }
       else{
          flag=false;
       }
       return flag;
    }
  //判断两站点的线路是否相同
  public static boolean judgeline(String start, String stop, boolean f1, boolean f2) {
      boolean flag = true;
      if (!f1 && !f2) {
          int line1 = search_bukeline(start);
          int line2 = search_bukeline(stop);
          if (line1 == line2) {
              flag=true;
          } else {
              flag=false;
          }
      }
      else if(!f1&&f2){
          int line = search_bukeline(start);
          int line1 = search_keline1(stop);
          int line2 = search_keline2(stop);
          if(line==line1||line==line2){
              flag=true;
          }
          else{
              flag=false;
          }
      }
      else if(f1&&!f2){
          int line = search_bukeline(stop);
          int line1 = search_keline1(start);
          int line2 = search_keline2(start);
          if(line==line1||line==line2){
              flag=true;
          }
          else{
              flag=false;
          }
      }
      else if(f1&&f2){
          int line1 = search_keline1(start);
          int line2 = search_keline2(start);
          int line3 = search_keline1(start);
          int line4 = search_keline2(start);
          if(line1==line3||line1==line4||line2==line3||line2==line4){
              flag=true;
          }
          else{
              flag=false;
          }
      }
      return flag;
  }

//查询站点所对应线路的id
public static int readId(int a,String station) {
    int id =0;
    Connection conn = util.getConnection();

    String sql = null;
    switch (a) {
        case 1:
            sql = "select * from line1 where station=?";
            break;
        case 2:
            sql = "select * from line2 where station=?";
            break;
        case 4:
            sql = "select * from line4 where station=?";
            break;
        case 5:
            sql = "select * from line5 where station=?";
            break;
        case 6:
            sql = "select * from line6 where station=?";
            break;
        case 7:
            sql = "select * from line7 where station=?";
            break;
        case 8:
            sql = "select * from line8 where station=?";
            break;
        case 9:
            sql = "select * from line9 where station=?";
            break;
        case 10:
            sql = "select * from line10 where station=?";
            break;
        case 13:
            sql = "select * from line13 where station=?";
            break;
        case 14:
            sql = "select * from line14 where station=?";
            break;
        case 15:
            sql = "select * from line15 where station=?";
            break;
    }
    try {//连接数据库的操作
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, station);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            id = Integer.parseInt((rs.getString("id")));
        }
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return id;
}

//查询同一条线路的站点
public static List<station> readStations(int a, int b, int c) {
    List<station> list = new ArrayList<station>();
    Connection con=util.getConnection();
    ResultSet rs=null;
    String sql=null;
    switch(a){
        case 1:
            sql = "select * from line1 limit "+b+","+c;
            break;
        case 2:
            sql = "select * from line2 limit "+b+","+c;
            break;
        case 4:
            sql = "select * from line4 limit "+b+","+c;
            break;
        case 5:
            sql = "select * from line5 limit "+b+","+c;
            break;
        case 6:
            sql = "select * from line6 limit "+b+","+c;
            break;
        case 7:
            sql = "select * from line7 limit "+b+","+c;
            break;
        case 8:
            sql = "select * from line8 limit "+b+","+c;
            break;
        case 9:
            sql = "select * from line9 limit "+b+","+c;
            break;
        case 10:
            sql = "select * from line10 limit "+b+","+c;
            break;
        case 13:
            sql = "select * from line13 limit "+b+","+c;
            break;
        case 14:
            sql = "select * from line14 limit "+b+","+c;
            break;
        case 15:
            sql = "select * from line15 limit "+b+","+c;
            break;
    }
    try {//连接数据库的操作
        Statement statement=con.createStatement();
        rs=statement.executeQuery(sql);
         while(rs.next()) {
            station s = new station();
            s.setId(rs.getInt("id"));
            s.setStation(rs.getString("station"));


            list.add(s);
        }
        util.close(rs, statement, con);
    }catch(Exception e){
        e.printStackTrace();
    }
    return list;
}

}