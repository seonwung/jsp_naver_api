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

        // 1) 처음 들어온 경우 (검색어 X) → 그냥 검색 페이지로만 보냄
        if (query == null || query.trim().isEmpty()) {
            RequestDispatcher rd = request.getRequestDispatcher("/kin_search.jsp");
            rd.forward(request, response);
            return;
        }

        // 2) 검색어가 있는 경우 → 네이버 API 호출
        String apiResultJson = NaverSearchAPI.searchKin(query, 100);

        // 3) JSON → List<KinDTO>로 파싱
        List<KinDTO> list = parseKinJson(apiResultJson);

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

        JsonElement root = JsonParser.parseString(json);
        JsonObject obj = root.getAsJsonObject();

        JsonArray items = obj.getAsJsonArray("items");
        if (items == null) return result;

        for (JsonElement el : items) {
            JsonObject item = el.getAsJsonObject();

            // 네이버 검색 API '지식인' 항목 기준 필드명
            String title     = getAsString(item, "title");
            String url       = getAsString(item, "link");       
            String qContent = getAsString(item, "description"); 
    

            // 필요하면 <b>태그 같은 HTML 태그 제거
            title = stripTag(title);
            qContent   = stripTag( qContent );

            KinDTO dto = new KinDTO(title, url, qContent);
            result.add(dto);
        }

        return result;
    }

    // JSON에서 문자열 꺼낼 때 NPE 방지용 헬퍼
    private String getAsString(JsonObject obj, String memberName) {
        JsonElement el = obj.get(memberName);
        if (el == null || el.isJsonNull()) return "";
        return el.getAsString();
    }

    // 아주 단순한 HTML 태그 제거용 (정교하지 않아도 과제에는 충분)
    private String stripTag(String s) {
        if (s == null) return "";
        return s.replaceAll("<.*?>", "");
    }
}