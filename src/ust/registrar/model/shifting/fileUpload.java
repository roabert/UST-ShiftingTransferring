package ust.registrar.model.shifting;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.http.Part;

import DatabaseHandler.SingletonDB;

import java.sql.*;

public class fileUpload {

	Connection conn = SingletonDB.getConnection();
	
	
	public fileUpload(){
		
	}
	
	public int insertFile(Part filePart) throws IOException{
        
        InputStream inputStream = null;
        int row = 0;

        Random rand = new Random();
        int  n = rand.nextInt(9999) + 1;
        String idTemp=(String.valueOf(n));
        
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();

        try 
        {
            
            
            
            String sql = "INSERT INTO files (id, title, file) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, idTemp);
            statement.setString(2, "filename");
            // Obar patulong dito, kumbaga dapat kukunin yung student number ni student dyan 
            // tas ilalagay dun sa simula nung pangalawang setString kumbaga ganito
            // studentNumber+"file" yung mukha para labas nya 2014068779filename
            statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
            
            row = statement.executeUpdate();
            conn.close();

        }catch(Exception e){e.printStackTrace();}
        return row;
	}
	
}
