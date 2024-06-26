package main;

public class ItemVo {
    private String districtName;
    private String issueGbn;

    @Override
    public String toString() {
        return "ItemVo{" +
                "districtName='" + districtName + '\'' +
                ", issueGbn='" + issueGbn + '\'' +
                '}';
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getIssueGbn() {
        return issueGbn;
    }

    public void setIssueGbn(String issueGbn) {
        this.issueGbn = issueGbn;
    }
}
