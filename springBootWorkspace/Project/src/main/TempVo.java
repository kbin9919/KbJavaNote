package main;

public class TempVo {
    private ReponseVo response;

    @Override
    public String toString() {
        return "TempVo{" +
                "response='" + response + '\'' +
                '}';
    }

    public ReponseVo getResponse() {
        return response;
    }

    public void setResponse(ReponseVo response) {
        this.response = response;
    }
}
