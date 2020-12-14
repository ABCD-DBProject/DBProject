package user;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;

public class UserDAO {
	private int EMPNO;
	private String EMPNAME;
	private String EMPID; 
	private String EMPPW;
	private int DNO;
	private String DNAME;
	private int MANNO;
	private String TITLE;
	private String TEL;
	private String BIRTHDATE;
	private String EMAIL;
	private int SALARY;
	private String SDATE;
	private String ADDRESS;
	
	public int getEMPNO() {
		return EMPNO;
	}

	public void setEMPNO(int eMPNO) {
		EMPNO = eMPNO;
	}

	public String getEMPNAME() {
		return EMPNAME;
	}

	public void setEMPNAME(String eMPNAME) {
		EMPNAME = eMPNAME;
	}

	public String getEMPID() {
		return EMPID;
	}

	public void setEMPID(String eMPID) {
		EMPID = eMPID;
	}

	public String getEMPPW() {
		return EMPPW;
	}

	public void setEMPPW(String eMPPW) {
		EMPPW = eMPPW;
	}

	public int getDNO() {
		return DNO;
	}

	public void setDNO(int dNO) {
		DNO = dNO;
	}

	public String getDNAME() {
		return DNAME;
	}

	public void setDNAME(String dNAME) {
		DNAME = dNAME;
	}

	public int getMANNO() {
		return MANNO;
	}

	public void setMANNO(int mANNO) {
		MANNO = mANNO;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getBIRTHDATE() {
		return BIRTHDATE;
	}

	public void setBIRTHDATE(String bIRTHDATE) {
		BIRTHDATE = bIRTHDATE;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public int getSALARY() {
		return SALARY;
	}

	public void setSALARY(int sALARY) {
		SALARY = sALARY;
	}

	public String getSDATE() {
		return SDATE;
	}

	public void setSDATE(String sDATE) {
		SDATE = sDATE;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	private Connection con; 
	private ResultSet rs; 
	
	public UserDAO() { 
		try { 
			String dbURL = "jdbc:mysql://127.0.0.1:3306/dbproject?characterEncoding=UTF-8&serverTimezone=UTC"; 
			String dbID = "root"; 
			String dbPassword = "1234"; 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			con = DriverManager.getConnection(dbURL, dbID, dbPassword); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
	}
	
	public int login(String EMPID, String EMPPW) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT EMPPW FROM employee WHERE EMPID = ?"); 
			pst.setString(1, EMPID); 
			rs = pst.executeQuery(); 
			if (rs.next()) { 
				return rs.getString(1).equals(EMPPW) ? 1 : 0; 
			} 
			else { 
				return -2; 
			} 
		} 
		catch (Exception e) { 
			e.printStackTrace();
			return -1; 
		} 
	}
	
	//사용자 목록 표시 부분
	public int getNext() {
		String SQL = "SELECT EMPNO FROM employee ORDER BY EMPNO DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류인 경우
	}
	
	//글 목록창 불러오는 함수      부서가 관리자의 부서와 같은 직원들만 출력
	public ArrayList<UserDAO> getList(int pageNumber){
		//특정한 숫자보다 작고 삭제가 되지 않아서 available이 1인 글만 가져오고 위에서 10개의 정보까지만 가져오고 직원 번호를 내림차순 하는 쿼리문
		String SQL = "SELECT * FROM employee WHERE EMPNO < ? ORDER BY EMPNO ASC LIMIT 10";
		//User클래스에서 나오는 인스턴스를 보관하는 리스트 만들기
		ArrayList<UserDAO> list = new ArrayList<UserDAO>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			//글 출력 개수
			pstmt.setInt(1,  getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDAO userDAO = new UserDAO();
				
				userDAO.setEMPNO(rs.getInt(1));
				userDAO.setEMPNAME(rs.getString(2));
				userDAO.setEMPID(rs.getString(3)); 
				userDAO.setDNAME(rs.getString(6));
				userDAO.setTITLE(rs.getString(8));
				userDAO.setTEL(rs.getString(9)); 
				userDAO.setBIRTHDATE(rs.getString(10));
				userDAO.setEMAIL(rs.getString(11)); 
				userDAO.setSDATE(rs.getString(13));
				userDAO.setADDRESS(rs.getString(14));
				list.add(userDAO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	//10개 밖에 없다면 다음 페이지가 없다는걸 알려준다. 페이지 처리를 위해서 존재하는 함수
	
	public boolean nextPage(int pageNumber) {
		//특정한 숫자보다 작고 삭제가 되지 않아서 ~~
		String SQL = "SELECT * FROM employee WHERE EMPNO < ?  ORDER BY EMPNO DESC LIMIT 10";
		/*and userDAO = 1*/
		//userDAO 클래스에서 나오는 인스턴스를 보관하는 리스트 하나
		
		ArrayList<UserDAO> list = new ArrayList<UserDAO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			//글 출력 개수
			pstmt.setInt(1, getNext() - (pageNumber -1)* 10);
			rs = pstmt.executeQuery();
			//결과가 하나라도 존재하면 다음페이지로 넘어갈 수 있다고 알려준다
			
			if(rs.next()) {
				return true;
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		//아니라면 false
		return false;
	}
	
	
	//회원가입
	public boolean ID_Check(String EMPID) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT * FROM employee WHERE EMPID = ?"); 
			pst.setString(1, EMPID); 
			rs = pst.executeQuery(); 
			if (rs.next()) { 
				return false; 
			}
			else { 
				return true; 
			} 
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return false; 
	}
	
	public int join(UserDAO userDAO) { 
		if(!ID_Check(userDAO.getEMPID())) 
			return 0; 
		try { 
			PreparedStatement pst = con.prepareStatement("INSERT INTO employee(EMPNAME, EMPID, EMPPW, DNAME, TEL, BIRTHDATE, EMAIL, SDATE) VALUES (?,?,?,?,?,?,?,?)"); 
			pst.setString(1, userDAO.getEMPNAME()); 
			pst.setString(2, userDAO.getEMPID()); 
			pst.setString(3, userDAO.getEMPPW()); 
			pst.setString(4, userDAO.getDNAME()); 
			pst.setString(5, userDAO.getTEL());
			pst.setString(6, userDAO.getBIRTHDATE());
			pst.setString(7, userDAO.getEMAIL());
			pst.setString(8, userDAO.getSDATE());
			return pst.executeUpdate(); 
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
			return -1;
		}
	}
	
	public UserDAO getUser(String EMPID) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT * FROM employee WHERE EMPID = ?"); 
			pst.setString(1, EMPID); 
			rs = pst.executeQuery(); 
			if (rs.next()) { 
				UserDAO userDAO = new UserDAO(); 
				userDAO.setEMPNAME(rs.getString(1)); 
				userDAO.setEMPID(rs.getString(2)); 
				userDAO.setEMPPW(rs.getString(3)); 
				userDAO.setDNAME(rs.getString(4)); 
				userDAO.setTEL(rs.getString(5)); 
				userDAO.setBIRTHDATE(rs.getString(6));
				userDAO.setEMAIL(rs.getString(7)); 
				userDAO.setSDATE(rs.getString(8)); 
				return userDAO; 
			} 
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	return null; 
	}
	
	//회원 리스트 삭제
	public int delete(String EMPID) {
		String SQL = "DELETE FROM employee WHERE EMPNO = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, EMPID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//db error
	}
	
}
