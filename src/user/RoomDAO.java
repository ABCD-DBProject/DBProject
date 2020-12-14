package user;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.util.ArrayList;

public class RoomDAO {

   private String EMPID;
   private int ROOMNO; 
   private String RDATE;
   private String RTIME;

   public String getEMPID() {
      return EMPID;
   }

   public void setEMPID(String eMPID) {
      EMPID = eMPID;
   }

   public int getROOMNO() {
      return ROOMNO;
   }

   public void setROOMNO(int rOOMNO) {
      ROOMNO = rOOMNO;
   }

   public String getRDATE() {
      return RDATE;
   }

   public void setRDATE(String rDATE) {
      RDATE = rDATE;
   }
   
   public String getRTIME() {
      return RTIME;
   }

   public void setRTIME(String rTIME) {
      RDATE = rTIME;
   }
   
   private Connection con; 
   private ResultSet rs; 
   
   public RoomDAO() { 
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
   
   //어떻게 하지,,
  /* public boolean room_Check(String RDATE, String RTIME, int ROOMNO) { 
      try { 
         PreparedStatement pst = con.prepareStatement("SELECT * FROM reservation WHERE ROOMNO = ? AND RDATE = ? AND RTIME = ?"); 
         pst.setInt(1, ROOMNO);
         pst.setNString(2, RDATE);
         pst.setNString(3, RTIME);
         
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
   
   //어떻게 하지,,
   public boolean empid_Check(String RDATE, String RTIME, String EMPID) { 
      try { 
         PreparedStatement pst = con.prepareStatement("SELECT * FROM reservation WHERE RDATE = ? AND RTIME = ? AND EMPID = ?"); 
         pst.setString(1, EMPID);
         pst.setNString(2, RDATE);
         pst.setNString(3, RTIME);
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
   */
   public int reserve(RoomDAO roomDAO) {
     /* if(!room_Check(roomDAO.getRDATE(), roomDAO.getRTIME(), roomDAO.getROOMNO())) {//같은날 같은시간에 동일한 방이 두번 예약될 수 없다.
         return 0; 
      }
      else if(!empid_Check(roomDAO.getRDATE(), roomDAO.getRTIME(), roomDAO.getEMPID())) {//같은날 같은 시간에 한사람이 2개의 예약은 할 수 없다.
         return -2;
      }    */  
      try {

         PreparedStatement pst = con.prepareStatement("INSERT INTO reservation(EMPID, ROOMNO, RDATE, RTIME) VALUES (?, ?, ?, ?)");
         
         pst.setString(1, roomDAO.getEMPID()); 
         pst.setInt(2, roomDAO.getROOMNO()); 
         pst.setString(3, roomDAO.getRDATE()); 
         pst.setString(4, roomDAO.getRTIME()); 
         
         return pst.executeUpdate();
      } 
      catch (Exception e) { 
         e.printStackTrace(); 
         return -1;
      }
   
   }
   
   public RoomDAO getReservation(int RESNO) {
      try {
         PreparedStatement pst = con.prepareStatement("Select * FROM reservation WHERE RENO = ?");
         pst.setInt(1,RESNO);
         rs=pst.executeQuery();
         if(rs.next()) {
            RoomDAO roomDAO = new RoomDAO();
            roomDAO.setEMPID(rs.getNString(1));
            roomDAO.setROOMNO(rs.getInt(2));
            roomDAO.setRDATE(rs.getNString(3));
            roomDAO.setRTIME(rs.getNString(4));
            
            return roomDAO;
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null;
   }
   
   

}