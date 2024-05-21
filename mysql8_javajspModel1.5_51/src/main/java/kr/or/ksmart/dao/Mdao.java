package kr.or.ksmart.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;
public class Mdao {
	PreparedStatement pstmt = null;
	Connection conn = null;
	Member m = null;
	ResultSet rs = null;
	List<Member> lm = null;
	
	// 검색 매서드
	public List<Member> mSearch(String sk, String sv)throws ClassNotFoundException, SQLException {
		System.out.println("검색 메서드");
		lm = new ArrayList<Member>();
		System.out.println(lm + "<-------lm");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member where ? = ?");
		
		pstmt.setString(1, sk);
		pstmt.setString(2, sv);
		
		if(sk == null && sv == null){
			System.out.println("1. sk,sv 변수에 담긴 값 null 조건");	
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null && sv.equals("")){
			System.out.println("2. sk는null아니고 sv는 공백 조건");
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null && sv != null){
			if(sk.equals("m_id")){
				System.out.println("3-1. m_id 조건");
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
				pstmt.setString(1, sv);
			}else if(sk.equals("m_level")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_level=?");
				pstmt.setString(1, sv);
			}else if(sk.equals("m_name")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_name=?");
				pstmt.setString(1, sv);
			}else if(sk.equals("m_email")){
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_email=?");
				pstmt.setString(1, sv);
			}
		}
		while(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			lm.add(m);
		}
		
		
		
		
		rs = pstmt.executeQuery();
		
		pstmt.close();
		rs.close();
		conn.close();
		
		
		
		return lm;
	}
	public List<Member> mAllSelect()throws ClassNotFoundException, SQLException{
		System.out.println(" 올셀렉트");
		lm = new ArrayList<Member>();
	
		System.out.println(lm + " <_______lm");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			lm.add(m);
		}
		
		
		
		pstmt.close();
		rs.close();
		conn.close();
		return lm;
	}
	public Member mSelectforUpdate(String mid) throws ClassNotFoundException, SQLException {
		System.out.println("4 mSelectforUp");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id = ?");
		pstmt.setString(1, mid);
		System.out.println(pstmt + "@@@pstmt@@@");
		rs = pstmt.executeQuery();
		
		if(rs.next()) {	
			System.out.println("if 조건문 실행");
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			System.out.println(m + "@@@m@@@");	
		}
		
		
		
		
		pstmt.close();
		rs.close();
		conn.close();
		return m;
	}
	//3. ȸ�� ���� �޼��� ����
	public void mDelete(String mid) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");

		pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id=?"); 
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//2. ȸ�� ���� ó�� �޼��� ����
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("2 mUpdate Mdao.java");
		//1�ܰ�~7�ܰ�
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?"); 
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_level());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_id());
		System.out.println(pstmt + "<-- pstmt");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//1-2 ȸ�� ��� �޼��� ����(�Է¹��� ���� 1��)
	public void mInsert(Member m) throws ClassNotFoundException, SQLException{
		System.out.println("1-2 mInsert Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)"); 
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt-2");
		int result = pstmt.executeUpdate(); //4�ܰ� : ���� ����
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
		/*
		 1,2�ܰ�) ����̹��ε� �� DB ����
		 3�ܰ�) ���� ���� �غ� 
		 4�ܰ�) ���� ���� 
		 5�ܰ�) ���� ������ ���(����) 
		 6,7�ܰ�) ��ü ����
		 */
	}
	//1-1 ȸ�� ��� �޼��� ����(�Է¹��� ���� 2��)
	public void mInsert(Member m, Connection conn) throws SQLException{
		System.out.println("1-1 mInsert Mdao.java");
		pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)"); 
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt-2");
		int result = pstmt.executeUpdate(); //4�ܰ� : ���� ����
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
		/*
		 3�ܰ�) ���� ���� �غ� 
		 4�ܰ�) ���� ���� 
		 5�ܰ�) ���� ������ ���(����) 
		 6,7�ܰ�) ��ü ����
		 */
	}
}
