package main;

import java.util.List;

public class BodyVo {
    private String totalCount;
    private List<ItemVo> items;
    private String pageNo;
    private String numOfRows;

    @Override
    public String toString() {
        return "BodyVo{" +
                "totalCount='" + totalCount + '\'' +
                ", items=" + items +
                ", pageNo='" + pageNo + '\'' +
                ", numOfRows='" + numOfRows + '\'' +
                '}';
    }

    public String getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(String totalCount) {
        this.totalCount = totalCount;
    }

    public List<ItemVo> getItems() {
        return items;
    }

    public void setItems(List<ItemVo> items) {
        this.items = items;
    }

    public String getPageNo() {
        return pageNo;
    }

    public void setPageNo(String pageNo) {
        this.pageNo = pageNo;
    }

    public String getNumOfRows() {
        return numOfRows;
    }

    public void setNumOfRows(String numOfRows) {
        this.numOfRows = numOfRows;
    }
}
