package ust.registrar.utility;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;


public class EncryptionTool {


	 private static byte[] key = {'u','s','t','r','g','i','s','t',
             'r','a','r','2','0','1','8','5'};

	 public static String encrypt(String strToEncrypt) 
	 {
		 	String encryptedString = null;
		 	
		 	try {
		 		
			 		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			 		final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			 		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			 		encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
			 		
		 	} catch (Exception e) {
		 		System.err.println(e.getMessage());
		 	}
		 	return encryptedString;
	 }

	 public static String decrypt(String codeDecrypt) 
	 {
		 String decryptedString = null;
		 try {
			 
			 Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			 final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			 cipher.init(Cipher.DECRYPT_MODE, secretKey);
			 decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
			 
		 } catch (Exception e) {
			 System.err.println(e.getMessage());
		 }
		 return decryptedString;
	 }
}
