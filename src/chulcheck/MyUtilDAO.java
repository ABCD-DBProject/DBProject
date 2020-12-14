package chulcheck;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.util.Locale;

public class MyUtilDAO {
	private int ATTNO;
	private String EMPID;
	private int EMPNO;
	private String EMPNAME;
	public String DATETIME;
	public String AD;
	public String AT;
	
	public int getATTNO() {
		return ATTNO;
	}
	public void setATTNO(int aTTNO) {
		ATTNO = aTTNO;
	}
	
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
	
	public String getDATETIME() {
		return DATETIME;
	}
	
	public void setDATETIME(String dATETIME) {
		DATETIME = dATETIME;
	}
	public String getAD() {
		return AD;
	}
	public void setAD(String aD) {
		AD = aD;
	}
	
	public String getAT() {
		return AT;
	}
	public void setAT(String aT) {
		AT = aT;
	}
	
	private Connection con; 
	private ResultSet rs;
	
	public MyUtilDAO() { 
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
	public int Attend(String EMPID) {
		String SQL = "SELECT EMPNO FROM employee where EMPID = ?";
		try {
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setString(1, EMPID);
			
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	} public int check(int EMPNO, String AD) {
		String SQL = "SELECT EMPNO from attendence where EMPNO = ? AND date_format(ATTEND_TIME, '%Y-%m-%d') = ?";
		try {
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setInt(1,  EMPNO);
			pst.setString(2, AD);
			
			rs = pst.executeQuery();
			if (rs.next()) {
				return 1;
			}
			else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}

	public String getDATE() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public MyUtilDAO getATT(String AD) {
		String SQL = "SELECT ATTNO, EMPNAME, date_format(ATTEND_TIME, '%Y-%m-%d') as AD, date_format(ATTEND_TIME, '%H-%i-%s') as AT from attendence where date_format(ATTEND_TIME, '%Y-%m-%d') = ?";
		try {
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setString(1, AD);
			rs = pst.executeQuery();
			if (rs.next()) {
				MyUtilDAO myutilDAO = new MyUtilDAO();
				myutilDAO.setATTNO(rs.getInt(1));
				myutilDAO.setEMPNAME(rs.getString(2));
				myutilDAO.setAD(rs.getString(3));
				myutilDAO.setAT(rs.getString(4));
				
				return myutilDAO;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public MyUtilDAO getEMP(String EMPID) {
		String SQL = "SELECT EMPNO,EMPNAME FROM employee where EMPID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, EMPID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MyUtilDAO myutilDAO = new MyUtilDAO();
				myutilDAO.setEMPNO(rs.getInt(1));
				myutilDAO.setEMPNAME(rs.getString(2));
				return myutilDAO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public int save(MyUtilDAO myutilDAO) { 
		String SQL = "INSERT INTO attendence(EMPNO,EMPNAME,ATTEND_TIME) VALUES (?,?,?)";
		try { 
			PreparedStatement pst = con.prepareStatement(SQL); 
			
			System.out.println(myutilDAO.getEMPNO());
			System.out.println(myutilDAO.getEMPNAME());
			System.out.println(myutilDAO.getDATE());
			
			pst.setInt(1, myutilDAO.getEMPNO());
			pst.setString(2, myutilDAO.getEMPNAME());
			pst.setString(3, getDATE());
			
			return pst.executeUpdate();
		}
		catch (Exception e) { 
			e.printStackTrace(); 
			return -1; 
		} 
	}
	/*public String getNAME() {
		String SQL = "SELECT employee()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}*/
}