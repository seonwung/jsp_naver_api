package model;
import java.io.Serializable;

//**Serializable 인터페이스 구현 추가 **
//미구현시 KinDTA클래스는 직렬화 불가. DTO클래스가 세션을통해 정상 저장,로드 되려면 Serializable인터페이스 구현 필요함
public class KinDTO implements Serializable {
	
	// 버전 UID 추가 (경고 제거 및 안정성 확보를 위해 권장)
	private static final long serialVersionUID = 1L;

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