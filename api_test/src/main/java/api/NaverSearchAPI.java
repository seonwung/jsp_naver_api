package api;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;




public class NaverSearchAPI {


	 private static final String CLIENT_ID = "y4b4A3ygovAPowPzQuUD";
	    private static final String CLIENT_SECRET = "rUR5NEiayl";

	    
	    
	    
	    
	    //지식인 검색 메서드: 검색어 + 최대 100건
	    public static String searchKin(String query, int display) {
	        try {
	            String text = URLEncoder.encode(query, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/kin?query=" + text
	                          + "&display=" + display;  // query 검색어, display 갯수

	            Map<String, String> headers = new HashMap<>();
	            headers.put("X-Naver-Client-Id", CLIENT_ID);
	            headers.put("X-Naver-Client-Secret", CLIENT_SECRET);

	            return get(apiURL, headers);

	        } catch (Exception e) {
	            throw new RuntimeException("지식인 검색 실패", e);
	        }
	    }

	    private static String get(String apiUrl, Map<String, String> requestHeaders) {
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");//get방식으로 요청하겠다
	            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }/* for쓰는 이유 :확장성때문에 지금은 하나지만 나중에 다른api해더가 늘어도 코드 수정안하게 만든구조
                         
                                */
	            int responseCode = con.getResponseCode();//id,secret을 가져오는게 아니라 
	            //200(HTTP_OK),400,401,500 같은 응답을 가져옴
	            InputStream body = (responseCode == HttpURLConnection.HTTP_OK)
	                    ? con.getInputStream()//네이버가 작은 바이트 흐름형태로 데이터를 전송함(통로임)
	                    : con.getErrorStream();

	            return readBody(body);
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청/응답 중 오류", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private static HttpURLConnection connect(String apiUrl) {
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection) url.openConnection();
	        } catch (Exception e) {
	            throw new RuntimeException("연결 실패: " + apiUrl, e);
	        }//네이버랑 다르게 예외 하나로 처리함 gpt추천
	    }
            /*readLine() :개행문자를 기준으로 한줄씩 반환
            line 변수 : readLine()이 반환한거 임시저장공간
            StringBuilder 문자열을 계속 이어 붙일수잇는 저장창고
            */
	    private static String readBody(InputStream body) {
	        try (BufferedReader br = new BufferedReader(new InputStreamReader(body))) {
	            StringBuilder sb = new StringBuilder();
	            String line;

	            while ((line = br.readLine()) != null) {
	                sb.append(line);
	            }

	            return sb.toString(); // 스트링으로 바꿔서 리턴
	        } catch (IOException e) {
	            throw new RuntimeException("응답 읽기 실패", e);
	        }
    } /*갑자기 여기서 try-with-resources 쓰는이유 :	
	     InputStream / BufferedReader 는 사용 후 반드시 닫아야 하는 자원(resource)이기 때문
	     BufferedReader br = new BufferedReader(new InputStreamReader(body) 자동으로 닫아줌 
	    InputStream:바이트를 받는 파이프   
	    InputStreamReader: 바이트->문자로 
	   BufferedReader :문자를 한줄단위로 읽기쉽게 버퍼에 쌓아서 제공 */
	 
	    
	   
	      //api데이터 왔는지 확인용
	      public static void main(String[] args) {
	        String result = searchKin("자바", 1);
	        System.out.println(result);
	    }
	
}
