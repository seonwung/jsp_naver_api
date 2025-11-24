package controller;

import model.KinDAO;
import model.KinDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

// 저장된 지식인 질문 목록 (페이지 100개씩)
@WebServlet("/kin/saved-list")
public class KinSavedListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int pageSize = 100; // 한 페이지에 100개
        int page = 1;       // 기본 페이지 1

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        KinDAO dao = new KinDAO();

        try {
            int totalCount = dao.countAll();
            int totalPage = (int) Math.ceil(totalCount / (double) pageSize);
            if (totalPage == 0) totalPage = 1;
            if (page > totalPage) page = totalPage;

            int offset = (page - 1) * pageSize;

            List<KinDTO> list = dao.selectPage(offset, pageSize);

            request.setAttribute("list", list);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalCount", totalCount);

            RequestDispatcher rd = request.getRequestDispatcher("/kin_saved_list.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("저장된 지식인 목록 조회 중 오류", e);
        }
    }
}
