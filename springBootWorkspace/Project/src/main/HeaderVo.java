package main;

public class HeaderVo {
    private String resultMsg;
    private String resultCode;

    @Override
    public String toString() {
        return "HeaderVo{" +
                "resultMsg='" + resultMsg + '\'' +
                ", resultCode='" + resultCode + '\'' +
                '}';
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }
}
