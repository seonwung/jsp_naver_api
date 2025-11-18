package controller;

import model.KinDTO;
import api.NaverSearchAPI;
import com.google.gson.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*브라우저에서 /kin/search 라는 URL로 요청이 들어오면
이 서블릿이 실행된다.
http://localhost:8080/api_test/kin_search.jsp
HttpServlet 를 상속해서 doGet,doPost를 쓸수있음
둘중하나 오버라이드
 */
@WebServlet("/kin/search") 
public class KinSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); //request 는 클라이언트 -> 서버
        response.setCharacterEncoding("UTF-8");//response 는 서버 -> 클라이언트 

        String query = request.getParameter("query");// kin_search.jsp에서 검색버튼 누르면

        // 1) 검색어에 빈칸입력했을때 
        if (query == null || query.trim().isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("/kin_search.jsp");
            //매개변수의 주소로 포워드할 준비를 하는것
            rd.forward(request, response);// jsp에게 요청처리 넘기기
            return;
            //forward는 주소창 변화 없음 redirect는 바뀜
        }

        // 2) 검색어가 있는 경우 -> 네이버 API 호출 (최대 100건)
        String apiResultJson = NaverSearchAPI.searchKin(query, 100);

        // 3) JSON -> List<KinDTO>로 파싱 
        // parseKinJson 아래 직접만든 매소드
        List<KinDTO> list = parseKinJson(apiResultJson);
        
        //**추가 db 저장 로직**
        //KinSaveServlet에서 이 데이터를 꺼내어 DB에 저장
        HttpSession session = request.getSession();
        session.setAttribute("searchListForSave", list);

        // 4) JSP에서 쓸 수 있게 request에 담기
        request.setAttribute("query", query);
        request.setAttribute("list", list);

        // 5) 다시 같은 JSP로 포워드 (이번엔 결과 리스트까지 같이 보여줌)
        RequestDispatcher rd = request.getRequestDispatcher("/kin_search.jsp");
        rd.forward(request, response);
    }

    /**
     * 네이버 지식인 검색 JSON을 List<KinDTO>로 변환하는 메서드
     */
    private List<KinDTO> parseKinJson(String json) {
        List<KinDTO> result = new ArrayList<>();

        if (json == null || json.isEmpty()) {
            return result;
        }

        /*json문자열을 -> json객체로  json문자열은 json처럼 보이지만 여전히 타입은 String임
         왜 Element냐? 
         JsonElement = JSON 최상위 구조를 담는 가장 포괄적인 타입
         JsonObject(키벨류),JsonArray,JsonPrimitive 뭐가 될지 모름
          */
         
        JsonElement root = JsonParser.parseString(json);//뭐가 될지몰라서 JsonElement로 
        
        
        JsonObject obj = root.getAsJsonObject();// JsonObject로 확정 이제 key로 접근 가능

        JsonArray items = obj.getAsJsonArray("items"); 
        //"items"라는 key에 들어있는 배열 전체를 꺼낸 상태.
        if (items == null) return result;

        //Gson은 JsonArray에서 요소를 꺼낼 때 일단 JsonElement로 꺼낸다.
        for (JsonElement el : items) {
            JsonObject item = el.getAsJsonObject();// JsonObject로 확정

            // 네이버 검색 API '지식인' 항목 기준 필드명
            // safeGetAsString(item,"A") -> item에서 A의 값을 꺼내주는 함수
            String title     = safeGetAsString(item, "title");
            String url       = safeGetAsString(item, "link");       
            String qContent = safeGetAsString(item, "description"); 
    

            // <b>태그 같은 HTML 태그 제거
            title = stripTag(title);
            qContent   = stripTag( qContent );

            KinDTO dto = new KinDTO(title, url, qContent);
            result.add(dto);
        }

        return result;
    }

    // JSON에서 문자열 꺼낼 때 NPE 방지용 헬퍼
    private String safeGetAsString(JsonObject obj, String memberName) {
        JsonElement el = obj.get(memberName);
        if (el == null || el.isJsonNull()) return "";
        return el.getAsString(); //여기서의  getAsString()는 Gson에서 제공하는 메서드 Json->String
    }

    //  HTML 태그 제거용 
    private String stripTag(String s) {
        if (s == null) return "";
        return s.replaceAll("<.*?>", "");
    }
}