package model;

import util.DBConnection;
import java.util.*;
import java.sql.*;

public class KinDAO {
public int insertKinList(List<KinDTO> list) throws SQLException {
        
        String sql = "INSERT INTO kin_question (title, url, q_content) VALUES (?, ?, ?)";
        int insertedCount = 0;
        
        if (list == null || list.isEmpty()) {
            return 0;
        }

        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection(); // DB 연결 유틸리티 사용
            conn.setAutoCommit(false); // 트랜잭션 시작
            //List<KinDTO>에 있는 모든 항목을 DB의 kin_question 테이블에 저장
            /* @param list 저장할 KinDTO 리스트
            * @return 성공적으로 삽입된 항목 수
            * @throws SQLException DB 작업 중 오류 발생 시*/
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                for (KinDTO dto : list) {
                    pstmt.setString(1, dto.getTitle()); 
                    pstmt.setString(2, dto.getUrl());    
                    pstmt.setString(3, dto.getQContent());
                    
                    pstmt.addBatch(); // 배치에 추가
                }
                
                int[] results = pstmt.executeBatch(); // 배치 실행
                
                // 성공한 항목 카운트
                for (int result : results) {
                    if (result >= 0) { // Statement.SUCCESS_NO_INFO 포함
                        insertedCount++;
                    }
                }
                
                conn.commit();
            }
            
        } catch (SQLException e) {
            // 오류 발생 시 롤백
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            throw new SQLException("데이터 저장 중 오류 발생 및 롤백됨.", e);
        } finally {
            // Connection 자원 반납
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
        
        return insertedCount;
    }

public int countAll() throws SQLException {
    String sql = "SELECT COUNT(*) FROM kin_question";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {

        if (rs.next()) {
            return rs.getInt(1);
        } else {
            return 0;
        }
    }
}

//  offset/limit 기준으로 한 페이지 데이터 가져오기
public List<KinDTO> selectPage(int offset, int limit) throws SQLException {
    List<KinDTO> list = new ArrayList<>();

  
    String sql = "SELECT k_id, title, url, q_content, created_at " +
            "FROM kin_question " +
            "ORDER BY k_id DESC " +     
            "LIMIT ? OFFSET ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setInt(1, limit);
        pstmt.setInt(2, offset);

        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String title = rs.getString("title");
                String url = rs.getString("url");
                String qContent = rs.getString("q_content");

                KinDTO dto = new KinDTO(title, url, qContent);
                list.add(dto);
            }
        }
    }

    return list;
}

}