package ust.registrar.model.transferring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class TransferMemoDAO implements DatabaseSQLs{
	public String transferid, date, fullname, newcourse, semester, currentcourse, firstterm, secondterm, thirdterm, fourthterm, fifthterm,
	sixthterm, seventhterm, eightterm;
	public String event, description;
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTransferid() {
		return transferid;
	}
	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getNewcourse() {
		return newcourse;
	}
	public void setNewcourse(String newcourse) {
		this.newcourse = newcourse;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getCurrentcourse() {
		return currentcourse;
	}
	public void setCurrentcourse(String currentcourse) {
		this.currentcourse = currentcourse;
	}
	public String getFirstterm() {
		return firstterm;
	}
	public void setFirstterm(String firstterm) {
		this.firstterm = firstterm;
	}
	public String getSecondterm() {
		return secondterm;
	}
	public void setSecondterm(String secondterm) {
		this.secondterm = secondterm;
	}
	public String getThirdterm() {
		return thirdterm;
	}
	public void setThirdterm(String thirdterm) {
		this.thirdterm = thirdterm;
	}
	public String getFourthterm() {
		return fourthterm;
	}
	public void setFourthterm(String fourthterm) {
		this.fourthterm = fourthterm;
	}
	public String getFifthterm() {
		return fifthterm;
	}
	public void setFifthterm(String fifthterm) {
		this.fifthterm = fifthterm;
	}
	public String getSixthterm() {
		return sixthterm;
	}
	public void setSixthterm(String sixthterm) {
		this.sixthterm = sixthterm;
	}
	public String getSeventhterm() {
		return seventhterm;
	}
	public void setSeventhterm(String seventhterm) {
		this.seventhterm = seventhterm;
	}
	public String getEightterm() {
		return eightterm;
	}
	public void setEightterm(String eightterm) {
		this.eightterm = eightterm;
	}
	public String getFirstyear() {
		return firstyear;
	}
	public void setFirstyear(String firstyear) {
		this.firstyear = firstyear;
	}
	public String getSecondyear() {
		return secondyear;
	}
	public void setSecondyear(String secondyear) {
		this.secondyear = secondyear;
	}
	public String getFirstterm_1year() {
		return firstterm_1year;
	}
	public void setFirstterm_1year(String firstterm_1year) {
		this.firstterm_1year = firstterm_1year;
	}
	public String getFirstterm_2year() {
		return firstterm_2year;
	}
	public void setFirstterm_2year(String firstterm_2year) {
		this.firstterm_2year = firstterm_2year;
	}
	public String getSecondterm_1year() {
		return secondterm_1year;
	}
	public void setSecondterm_1year(String secondterm_1year) {
		this.secondterm_1year = secondterm_1year;
	}
	public String getSecondterm_2year() {
		return secondterm_2year;
	}
	public void setSecondterm_2year(String secondterm_2year) {
		this.secondterm_2year = secondterm_2year;
	}
	public String getThirdterm_1year() {
		return thirdterm_1year;
	}
	public void setThirdterm_1year(String thirdterm_1year) {
		this.thirdterm_1year = thirdterm_1year;
	}
	public String getThirdterm_2year() {
		return thirdterm_2year;
	}
	public void setThirdterm_2year(String thirdterm_2year) {
		this.thirdterm_2year = thirdterm_2year;
	}
	public String getFourthterm_1year() {
		return fourthterm_1year;
	}
	public void setFourthterm_1year(String fourthterm_1year) {
		this.fourthterm_1year = fourthterm_1year;
	}
	public String getFourthterm_2year() {
		return fourthterm_2year;
	}
	public void setFourthterm_2year(String fourthterm_2year) {
		this.fourthterm_2year = fourthterm_2year;
	}
	public String firstyear, secondyear, firstterm_1year, firstterm_2year, secondterm_1year,
	secondterm_2year, thirdterm_1year, thirdterm_2year, fourthterm_1year, fourthterm_2year;
	public String fifthterm_1year, fifthterm_2year, sixthterm_1year, sixthterm_2year, seventhterm_1year,
	seventhterm_2year, eightterm_1year, eightterm_2year;
	
	public String getFifthterm_1year() {
		return fifthterm_1year;
	}
	public void setFifthterm_1year(String fifthterm_1year) {
		this.fifthterm_1year = fifthterm_1year;
	}
	public String getFifthterm_2year() {
		return fifthterm_2year;
	}
	public void setFifthterm_2year(String fifthterm_2year) {
		this.fifthterm_2year = fifthterm_2year;
	}
	public String getSixthterm_1year() {
		return sixthterm_1year;
	}
	public void setSixthterm_1year(String sixthterm_1year) {
		this.sixthterm_1year = sixthterm_1year;
	}
	public String getSixthterm_2year() {
		return sixthterm_2year;
	}
	public void setSixthterm_2year(String sixthterm_2year) {
		this.sixthterm_2year = sixthterm_2year;
	}
	public String getSeventhterm_1year() {
		return seventhterm_1year;
	}
	public void setSeventhterm_1year(String seventhterm_1year) {
		this.seventhterm_1year = seventhterm_1year;
	}
	public String getSeventhterm_2year() {
		return seventhterm_2year;
	}
	public void setSeventhterm_2year(String seventhterm_2year) {
		this.seventhterm_2year = seventhterm_2year;
	}
	public String getEightterm_1year() {
		return eightterm_1year;
	}
	public void setEightterm_1year(String eightterm_1year) {
		this.eightterm_1year = eightterm_1year;
	}
	public String getEightterm_2year() {
		return eightterm_2year;
	}
	public void setEightterm_2year(String eightterm_2year) {
		this.eightterm_2year = eightterm_2year;
	}
	public void generateMemo(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(generateMemoTransfer);
			ps.setString(1, transferid);
			ps.setString(2, date);
			ps.setString(3, fullname);
			ps.setString(4, newcourse);
			ps.setString(5, semester);
			ps.setString(6, firstyear);
			ps.setString(7, secondyear);
			ps.setString(8, currentcourse);
			ps.setString(9, firstterm);
			ps.setString(10, firstterm_1year);
			ps.setString(11, firstterm_2year);
			ps.setString(12, secondterm);
			ps.setString(13, secondterm_1year);
			ps.setString(14, secondterm_2year);
			ps.setString(15, thirdterm);
			ps.setString(16, thirdterm_1year);
			ps.setString(17, thirdterm_2year);
			ps.setString(18, fourthterm);
			ps.setString(19, fourthterm_1year);
			ps.setString(20, fourthterm_2year);
			ps.setString(21, fifthterm);
			ps.setString(22, fifthterm_1year);
			ps.setString(23, fifthterm_2year);
			ps.setString(24, sixthterm);
			ps.setString(25, sixthterm_1year);
			ps.setString(26, sixthterm_2year);
			ps.setString(27, seventhterm);
			ps.setString(28, seventhterm_1year);
			ps.setString(29, seventhterm_2year);
			ps.setString(30, eightterm);
			ps.setString(31, eightterm_1year);
			ps.setString(32, eightterm_2year);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void submitMemoIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(RegistrarStatusTransfer);
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doStep3Indorsed(Connection conn) {
		generateMemo(conn);
		submitMemoIndorsed(conn);
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, transferid);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
