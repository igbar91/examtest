package ssssExamTest3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class ExamDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	public void getConnection() {
		
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		}
		
	
		public void inputPeople(ExamBean ebean) {
			
			getConnection();
			
		
			try {


				String sql = "insert into member_tbl_02 values(mem_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				
			
				pstmt.setString(1, ebean.getCustname());
				pstmt.setString(2, ebean.getPhone());
				pstmt.setString(3, ebean.getAddress());
				pstmt.setString(4, ebean.getGrade());
				pstmt.setString(5, ebean.getCity());
		        
				
				pstmt.executeUpdate();
								
				conn.close();
								
				
			}catch(Exception e) {			
				e.printStackTrace();
			}
		}
		
		
		
	public Vector<ExamBean> getAllInfo(){
		
		Vector<ExamBean> vec = new Vector<ExamBean>();
		getConnection();
		
		try {
			String sql = "select * from member_tbl_02 order by custno asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ExamBean ebean = new ExamBean();
				ebean.setCustno(rs.getInt(1));//sequence number
				ebean.setCustname(rs.getString(2));
				ebean.setPhone(rs.getString(3));
				ebean.setAddress(rs.getString(4));
				ebean.setJoindate(rs.getDate(5).toString());
				ebean.setGrade(rs.getString(6));
				ebean.setCity(rs.getString(7));
				
				
				
				vec.add(ebean);
			}
			conn.close();
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vec;
	}
	
	//***********************************************************************************************
	//***********************************************************************************************
	//***********************************************************************************************
	//***********************************************************************************************
		  //static? 
	
	
	
	
	
	//해원매출조회
		public Vector<ExamBean> getSales(){
			
		Vector<ExamBean> vector = new Vector<ExamBean>();
		
		
			getConnection();
			
	
				
			try {

		
			String sql = "select mb.custno, mb.custname, "
						+ "mb.grade, sum(mn.price) as total from member_tbl mb "
						+ "join money_tbl mn on mb.custno = mn.custno "
						+ "group by(mb.custno, mb.custname, mb.grade) "
		   				+ "order by total desc";
						
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
					
				while(rs.next()) {
									ExamBean ebean = new ExamBean();
				 ebean.setCustno(rs.getInt(1));//sequence number
					ebean.setCustname(rs.getString(2));
					ebean.setGrade(rs.getString(3));
					ebean.setTotal(rs.getInt(4));
					
					vector.add(ebean);
				}
				
			
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return vector;
		}

		
		//회원정보 자세히 보기 
		public ExamBean getOneInfo(int custno) {
			
			ExamBean ebean = new ExamBean();
			getConnection();
			
			try { //count 증가 
			
				
			String sql="select * from member_tbl_02 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {


				ebean.setCustno(rs.getInt(1));//sequence number
				ebean.setCustname(rs.getString(2));
				ebean.setPhone(rs.getString(3));
				ebean.setAddress(rs.getString(4));
				ebean.setJoindate(rs.getDate(5).toString());
				ebean.setGrade(rs.getString(6));
				ebean.setCity(rs.getString(7));
			
			}
				conn.close();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return ebean;
		}


		
		//수정하기
		public void update(ExamBean ebean) {
			
			getConnection();
			
			try {
				String sql = "update member_tbl_02 set custname=?, phone=?, address=?, grade=?, city=?  where custno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ebean.getCustname());
				pstmt.setString(2, ebean.getPhone());
				pstmt.setString(3, ebean.getAddress());
				pstmt.setString(4, ebean.getGrade());
				pstmt.setString(5, ebean.getCity());
				pstmt.setInt(6, ebean.getCustno());
				
				pstmt.executeUpdate();
				
				conn.close();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	


		
	public ExamBean getCustno() {
			
			ExamBean ebean = new ExamBean();
			getConnection();
			
			try { //count 증가 
			
				
			String sql= "SELECT custno from member_tbl_02 where rownum <= 1 order by custno desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {

				ebean.setCustno(rs.getInt(1)+1);//sequence number
			}
				conn.close();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return ebean;
		}

		
	}//end
		

