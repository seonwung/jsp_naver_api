package controller;

import model.KinDTO;
import model.KinDAO; // KinDAO import (반드시 필요)
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.sql.SQLException;

// /kin/save 요청이 들어오면 서블릿 실행
@WebServlet("/kin/save") 
public class KinSaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        
        // 세션에서 저장할 리스트를 가져옴 (서치에서 가져온 데이터)
        @SuppressWarnings("unchecked")
        List<KinDTO> list = (List<KinDTO>) session.getAttribute("searchListForSave");
        
        String saveMessage = "";
        
        if (list == null || list.isEmpty()) {
            saveMessage = "저장할 검색 결과가 없습니다.";
        } else {
            // DAO로 db에 저장
            KinDAO dao = new KinDAO(); 
            try {
                int insertedCount = dao.insertKinList(list); // DB 저장 실행
                saveMessage = "검색 결과 " + insertedCount + "건이 DB에 성공적으로 저장되었습니다.";
                
                // 저장이 완료 후 세션에서 리스트를 삭제하여 중복 저장을 방지
                session.removeAttribute("searchListForSave");
            } catch (SQLException e) {
                // DB 오류 발생 시 롤백 및 메세지
                e.printStackTrace();
                saveMessage = "DB 저장 중 오류가 발생했습니다. (SQL Exception) 로그를 확인하세요.";
            } catch (Exception e) {
                // 기타 예외 처리
                e.printStackTrace();
                saveMessage = "데이터 저장 중 알 수 없는 오류가 발생했습니다.";
            }
        }
        
        //저장 결과를 세션에 담아 검색 페이지로 리다이렉트
        session.setAttribute("saveStatus", saveMessage);
        
        // /kin/search로 리다이렉트 (f5/새로고침시 /kin/save재요청 발생 방지)
        String redirectUrl = request.getContextPath() + "/kin/search";
        response.sendRedirect(redirectUrl);
    }
}