package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class Shifting_Upload
 */
@WebServlet("/Requirements_Upload")
public class Requirements_Upload extends HttpServlet {
	public final String Directory_image = "C:/Users/Christian/Desktop/MOCKUP";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Requirements_Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		if(ServletFileUpload.isMultipartContent(request)) {
			
			try{
				List<FileItem> requirements = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : requirements){
					if(!item.isFormField()) {
						String name = new File(item.getName()).getName();
						item.write(new File(Directory_image + File.separator + name));
						
					}
				}
				out.println("Success");
				
			}
			catch(Exception ex) {
				out.println(ex);
			}
			
		}
		
	}

}
