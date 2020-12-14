package staff;

import staff.Staff;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.util.ArrayList;

public class StaffDAO{
	
	private Connection con;
	private ResultSet rs;
	
	public StaffDAO() {
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
	
	public ArrayList<Staff> getList() {
		String SQL = "SELECT EMPNO, EMPNAME, EMPID, DNAME, TITLE, TEL, BIRTHDATE, EMAIL, SALARY, SDATE, ADDRESS FROM employee where EMPID order by EMPNO";
		ArrayList<Staff> list = new ArrayList<Staff>();
		try {
			PreparedStatement pst = con.prepareStatement(SQL);
			rs = pst.executeQuery();
			while (rs.next()) {
				Staff staff = new Staff();
				staff.setEMPNO(rs.getInt(1));
				staff.setEMPID(rs.getString(2));
				staff.setEMPNAME(rs.getString(3));
				staff.setDNAME(rs.getString(4));
				staff.setTITLE(rs.getString(5));
				staff.setTEL(rs.getString(6));
				staff.setBIRTHDATE(rs.getString(7));
				staff.setEMAIL(rs.getString(8));
				staff.setSALARY(rs.getString(9));
				staff.setSDATE(rs.getString(10));
				staff.setADDRESS(rs.getString(11));
				list.add(staff);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int delete(int dno) {
		String SQL = "DELETE FROM employee where EMPNO = ?";
		try {
			PreparedStatement pst = con.prepareStatement(SQL);
			Staff staff = new Staff();
			pst.setInt(1, staff.getEMPNO());
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}

	