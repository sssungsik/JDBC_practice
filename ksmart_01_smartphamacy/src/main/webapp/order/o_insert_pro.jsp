<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
request.setCharacterEncoding("utf-8");
String m_seller_id = request.getParameter("m_seller_id");

String m_code = request.getParameter("send_code");
String m_name = request.getParameter("m_name");
String m_price = request.getParameter("m_price");
String m_stock = request.getParameter("m_stock");
String amount = request.getParameter("send_amount");
int availableStock = Integer.parseInt(m_stock) - Integer.parseInt(amount);

//콘솔창에 출력한다
System.out.println( m_seller_id+ "<-- ");

System.out.println(m_code + "<--m_code");
System.out.println(m_price + "<--m_price");
System.out.println(m_stock + "<--m_stock");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;

//DB연결정보
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
			"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";


	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
if (availableStock >= 0) {	  
	    try {
	        // 데이터베이스 연결
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	        // 트랜잭션 시작
	        conn.setAutoCommit(false);
	        
	        // 주문 코드 생성을 위한 쿼리
	        String getMaxOrderCodeQuery = "SELECT MAX(CAST(SUBSTRING(o_code, 2) AS DECIMAL)) AS max FROM tb01_order";
	        pstmt = conn.prepareStatement(getMaxOrderCodeQuery);
	        rs = pstmt.executeQuery();
	        
	        int max = 0;
	        if (rs.next()) {
	            max = rs.getInt("max");
	            max++;
	        }
	        String o_code = "o" + max;
			pstmt.close();
	        // 주문을 삽입하기 위한 쿼리
	        String insertOrderQuery = "INSERT INTO tb01_order (o_seller_id, o_m_code, o_m_name, o_amount, now()) VALUES (?, ?, ?, ?)";
	        
	        // 남은 재고를 업데이트하기 위한 쿼리
	        String updateStockQuery = "UPDATE tb01_medicine SET m_stock = ? WHERE m_code = ?";

	        // 주문 삽입
	        pstmt_insert = conn.prepareStatement(insertOrderQuery);
	        pstmt_insert.setString(1, m_seller_id);
	        pstmt_insert.setString(2, m_code);
	        pstmt_insert.setString(3, m_name);
	        pstmt_insert.setString(4, amount);
	        pstmt_insert.executeUpdate();
	        pstmt_insert.close();

	        // 재고 업데이트
	        pstmt = conn.prepareStatement(updateStockQuery);
	        pstmt.setInt(1, availableStock);
	        pstmt.setString(2, m_code);
	        pstmt.executeUpdate();
	     

	        // 모든 작업이 성공적으로 완료되었으므로 커밋
	        conn.commit();

	        // 트랜잭션 종료 후 자원 해제
	        conn.setAutoCommit(true);
	        pstmt.close();
	        conn.close();

	     
	    } catch (SQLException ex) {
	        // 롤백
	        if (conn != null) {
	            try {
	                conn.rollback();
	            } catch (SQLException ex2) {
	                ex2.printStackTrace();
	            }
	        }
	        ex.printStackTrace();
	    } finally {
	        // 자원 해제
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	} else{
		 %>
			<script type="text/javascript">
				alert('재고가 부족합니다.');	
			</script> 
		  <%
		
	}
	
	 
	  
	  %>
	  
	
