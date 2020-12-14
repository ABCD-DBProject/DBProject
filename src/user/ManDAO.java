package user;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;

public class ManDAO {
	private int MANNO;
	private String MANNAME;
	private String MANID; 
	private String MANPW;
	private int DNO;
	private String DNAME;
	private String TITLE;
	private String TEL;
	private int BIRTHDATE;
	private String EMAIL;
	private int SALARY;
	private int SDATE;
	private String ADDRESS;
	
	public int getMANNO() {
		return MANNO;
	}

	public void setMANNO(int mANNO) {
		MANNO = mANNO;
	}

	public String getMANNAME() {
		return MANNAME;
	}

	public void setEMPNAME(String mANNAME) {
		MANNAME = mANNAME;
	}

	public String getMANID() {
		return MANID;
	}

	public void setEMPID(String mANID) {
		MANID = mANID;
	}

	public String getMANPW() {
		return MANPW;
	}

	public void setEMPPW(String mANPW) {
		MANPW = mANPW;
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

	public int getBIRTHDATE() {
		return BIRTHDATE;
	}

	public void setBIRTHDATE(int bIRTHDATE) {
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

	public int getSDATE() {
		return SDATE;
	}

	public void setDATETIME(int sDATE) {
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
	
	public ManDAO() { 
		try { 
			String dbURL = "jdbc:mysql://127.0.0.1:3306/dbproject?characterEncoding=UTF-8&serverTimezone=UTC"; 
			String dbID = "root"; 
			String dbPassword = "1234"; 
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection(dbURL, dbID, dbPassword); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
	}
	
	public int login(String MANID, String MANPW) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT MANPW FROM manager WHERE MANID = ?"); 
			pst.setString(1, MANID); 
			rs = pst.executeQuery(); 
			if (rs.next()) { 
				return rs.getString(1).equals(MANPW) ? 1 : 0; 
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
}
