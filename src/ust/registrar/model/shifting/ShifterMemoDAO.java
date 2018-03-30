package ust.registrar.model.shifting;
import java.sql.*;
import DatabaseHandler.DatabaseSQLs;

public class ShifterMemoDAO implements DatabaseSQLs{

	public String shifterid, studentid, date, fullname, newcourse, semester, currentcourse, firstterm, secondterm, thirdterm, fourthterm, specialterm_1,
	specialterm_2, specialterm_3, specialterm_4;
	public String getShifterid() {
		return shifterid;
	}
	public void setShifterid(String shifterid) {
		this.shifterid = shifterid;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
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
	public String getSpecialterm_1() {
		return specialterm_1;
	}
	public void setSpecialterm_1(String specialterm_1) {
		this.specialterm_1 = specialterm_1;
	}
	public String getSpecialterm_2() {
		return specialterm_2;
	}
	public void setSpecialterm_2(String specialterm_2) {
		this.specialterm_2 = specialterm_2;
	}
	public String getSpecialterm_3() {
		return specialterm_3;
	}
	public void setSpecialterm_3(String specialterm_3) {
		this.specialterm_3 = specialterm_3;
	}
	public String getSpecialterm_4() {
		return specialterm_4;
	}
	public void setSpecialterm_4(String specialterm_4) {
		this.specialterm_4 = specialterm_4;
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
	
	
	public void generateMemo(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(generateMemoShifter);
			ps.setString(1, shifterid);
			ps.setString(2, studentid);
			ps.setString(3, date);
			ps.setString(4, fullname);
			ps.setString(5, newcourse);
			ps.setString(6, semester);
			ps.setString(7, firstyear);
			ps.setString(8, secondyear);
			ps.setString(9, currentcourse);
			ps.setString(10, firstterm);
			ps.setString(11, firstterm_1year);
			ps.setString(12, firstterm_2year);
			ps.setString(13, specialterm_1);
			ps.setString(14, secondterm);
			ps.setString(15, secondterm_1year);
			ps.setString(16, secondterm_2year);
			ps.setString(17, specialterm_2);
			ps.setString(18, thirdterm);
			ps.setString(19, thirdterm_1year);
			ps.setString(20, thirdterm_2year);
			ps.setString(21, specialterm_3);
			ps.setString(22, fourthterm);
			ps.setString(23, fourthterm_1year);
			ps.setString(24, fourthterm_2year);
			ps.setString(25, specialterm_4);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void submitMemoIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(RegistrarStatusShifter);
			ps.setString(1, studentid);
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
	
	
	
	
}
