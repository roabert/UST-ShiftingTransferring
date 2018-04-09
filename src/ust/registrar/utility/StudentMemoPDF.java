package ust.registrar.utility;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class StudentMemoPDF {

	public String firstyear, secondyear, firstterm_1year, firstterm_2year, secondterm_1year,
	secondterm_2year, thirdterm_1year, thirdterm_2year, fourthterm_1year, fourthterm_2year;
	public String shifterid, studentid, date, fullname, newcourse, semester, currentcourse, firstterm, secondterm, thirdterm, fourthterm, specialterm_1,
	specialterm_2, specialterm_3, specialterm_4;
	
	public static void main(String args[]) {
		Document docs = new Document();
		try {
			PdfWriter pdf = PdfWriter.getInstance(docs, new FileOutputStream("Hello.pdf"));
			docs.open();
			docs.add(new Paragraph("Hi world"));
			docs.close();
			pdf.close();
			System.out.print("assad");
		}catch(DocumentException e) {
			e.printStackTrace();
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void downloadMemo() {
		Document docs = new Document(); 
		try {
			PdfWriter pdf = PdfWriter.getInstance(docs, new FileOutputStream(studentid+"-memo.pdf"));
			docs.open();
			docs.add(new Paragraph("University of Santo Tomas"));
			docs.close();
		}catch(DocumentException e) {
			
		}catch(FileNotFoundException e) {
			
		}
		
		
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
}
