package bean;

import java.util.ArrayList;
import java.util.List;

public class station {
    private int id;
    private String station;
    private String line;
    //该站点是否支持换乘
    private Boolean isTransferStation;
    //可换成线路
    private List<String> lines = new ArrayList<>();

    public  int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public  String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }


    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public Boolean getTransferStation() {
        return isTransferStation;
    }

    public void setTransferStation(Boolean transferStation) {
        isTransferStation = transferStation;
    }

    public List<String> getLines() {
        return lines;
    }

    public void setLines(List<String> lines) {
        this.lines = lines;
    }
}
