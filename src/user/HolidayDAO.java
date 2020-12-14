package user;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;

public class HolidayDAO {
	private int REQNO;
	private String DNAME;
	private int EMPNO;
	private int MANNO;
	private String HTYPE;
	private String START_TIME;
	private String END_TIME;
	private String STATUS;
	
	
	public String getDNAME() {
		return DNAME;
	}
	public void setDNAME(String dNAME) {
		DNAME = dNAME;
	}
	public int getREQNO() {
		return REQNO;
	}
	public void setREQNO(int rEQNO) {
		REQNO = rEQNO;
	}
	public int getEMPNO() {
		return EMPNO;
	}
	public void setEMPNO(int eMPNO) {
		EMPNO = eMPNO;
	}
	public int getMANNO() {
		return MANNO;
	}
	public void setMANNO(int mANNO) {
		MANNO = mANNO;
	}
	public String getHTYPE() {
		return HTYPE;
	}
	public void setHTYPE(String hTYPE) {
		HTYPE = hTYPE;
	}
	public String getSTART_TIME() {
		return START_TIME;
	}
	public void setSTART_TIME(String sTART_TIME) {
		START_TIME = sTART_TIME;
	}
	public String getEND_TIME() {
		return END_TIME;
	}
	public void setEND_TIME(String eND_TIME) {
		END_TIME = eND_TIME;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	private Connection con; 
	private ResultSet rs; 
	
	public HolidayDAO() { 
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
	
	public int request(HolidayDAO holidayDAO) { 
		String SQL = "INSERT INTO hrequest(EMPNO, DNAME, HTYPE, START_TIME, END_TIME) VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getEMPNO());
			pstmt.setString(2, getDNAME());
			pstmt.setString(3, getHTYPE());
			pstmt.setString(4, getSTART_TIME());
			pstmt.setString(5, getEND_TIME());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	
}
