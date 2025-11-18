package model;

public class KinDTO {

    private int kId;            // DB PK
    private String title;       // 질문 제목
    private String url;         // 질문 URL
    private String qContent;    // 질문 내용(description)
 

    // 1. 기본 생성자
    public KinDTO() {}

   
    public KinDTO(int kId, String title, String url, String qContent) {
        this.kId = kId;
        this.title = title;
        this.url = url;
        this.qContent = qContent;
    }


    public KinDTO(String title, String url, String qContent) {
        this.title = title;
        this.url = url;
        this.qContent = qContent;
     
    }

    // Getter / Setter
    public int getKId() {
        return kId;
    }

    public void setKId(int kId) {
        this.kId = kId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getQContent() {
        return qContent;
    }

    public void setQContent(String qContent) {
        this.qContent = qContent;
    }


    @Override
    public String toString() {
        return "KinDTO{" +
                "kId=" + kId +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", qContent='" + qContent + '\'' +
                '}';
    }
}