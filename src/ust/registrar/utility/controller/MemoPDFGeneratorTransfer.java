package ust.registrar.utility.controller;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import ust.registrar.utility.TransfereeMemoPDF;

/**
 * Servlet implementation class MemoPDFGeneratorStudent
 */
@WebServlet("/MemoPDFGeneratorTransfer")
public class MemoPDFGeneratorTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoPDFGeneratorTransfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String gettransferid = request.getParameter("transferid");
		//TransfereeMemoPDF transfer = new TransfereeMemoPDF();
		//transfer.downloadMemo();
		Document docs = new Document(); 
		try {
			 ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			PdfWriter pdf = PdfWriter.getInstance(docs, buffer);
			docs.open();
			docs.add(new Paragraph("University of Santo Tomas"));
			pdf.close();
			docs.close();
			
			 DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
			    byte[] bytes = buffer.toByteArray();
			    response.setContentLength(bytes.length);
			    for(int i = 0; i < bytes.length; i++)
			        dataOutput.writeByte(bytes[i]);

			    dataOutput.flush();
			    dataOutput.close();
			    return;
		}catch(DocumentException e) {
			
		}catch(FileNotFoundException e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
