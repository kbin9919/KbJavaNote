package main;

public class ReponseVo {
    private BodyVo body;
    private HeaderVo header;

    @Override
    public String toString() {
        return "ReponseVo{" +
                "body=" + body +
                ", header=" + header +
                '}';
    }

    public BodyVo getBody() {
        return body;
    }

    public void setBody(BodyVo body) {
        this.body = body;
    }

    public HeaderVo getHeader() {
        return header;
    }

    public void setHeader(HeaderVo header) {
        this.header = header;
    }
}
