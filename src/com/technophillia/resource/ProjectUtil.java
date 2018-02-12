package com.technophillia.resource;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

public class ProjectUtil 
{
	public static DBCollection mongoConnection(String database,String collection){
		DBCollection collection1 = null;
		try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB(database);
			
			collection1 = db.getCollection(collection);
			
			System.out.println("Connected to MongoDB Successfully:Database Choosen :"+database+" Collection selected is:"+collection);
		
		}
		catch (UnknownHostException e) {
		e.printStackTrace();
	    } catch (MongoException e) {
		e.printStackTrace();
	    }
		return collection1;
		
		
	}
	
	public static String fetchPropertyValue(String key){
		String result="";
		
		Properties prop = new Properties();
		InputStream input = null;

		try {

			input = new FileInputStream("Project.properties");

			// load a properties file
			prop.load(input);

			// get the property value and print it out
			System.out.println(prop.getProperty(key));
			
			result=prop.getProperty(key);
			
			

		} catch (IOException ex) {
			ex.printStackTrace();
		} 
		finally 
		{
			if (input != null) 
			{
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			
		}
		return result;	
		
	}
	
	
	public static String fetchMemberIdFromURL(String uri){
	
		
		String splituri[] = uri.replace("APKGK", "").trim().replace("QAZ", "").trim().split("/");
		
		return splituri[splituri.length-1];
	}
	
	public static String encryptData(String text) 
    {
		String encryptedString="";
        try 
        {            
            String key = "Bar12349Bar12349"; // 128 bit key
            // Create key and cipher
            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            // encrypt the text
            cipher.init(Cipher.ENCRYPT_MODE, aesKey);
            byte[] encrypted = cipher.doFinal(text.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b: encrypted) {
                sb.append((char)b);
            }

            // the encrypted String
            String enc = sb.toString();
            System.out.println("encrypted:" + enc);

            
            encryptedString=""+ enc;

        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        
        return encryptedString;
    }
	
	public static String decryptData(String text) 
    {
		String decryptedString="";
        try 
        {
            //String text = "Hello World";
            String key = "Bar12349Bar12349"; // 128 bit key
            // Create key and cipher
            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
                        
            // now convert the string to byte array
            // for decryption
            byte[] bb = new byte[text.length()];
            for (int i=0; i<text.length(); i++) {
                bb[i] = (byte) text.charAt(i);
            }

            // decrypt the text
            cipher.init(Cipher.DECRYPT_MODE, aesKey);
            String decrypted = new String(cipher.doFinal(bb));
            System.err.println("decrypted:" + decrypted);
            
            decryptedString=""+decrypted;
            

        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        return decryptedString;
    }
	
	
	
	public static SessionFactory getSessionFactory()
	{
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		catch (Exception e) {
			// The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
			// so destroy it manually
			e.printStackTrace();
			if(sessionFactory!=null)
			sessionFactory.close();
		}
		return  sessionFactory;
		
	}

	public static Connection createJdbcConnection(){
		
		Connection con=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project1?autoReconnect=true&useSSL=false","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	public static Connection createAdminJdbcConnection(){
		
		Connection con=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project1?autoReconnect=true&useSSL=false","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	public static String checkIfEmpty(String var){
		if(checkIfNull(var).equals("notNull"))
		{
			if(var.length()==0){
			return "empty";	
			}
			return "notEmpty";
		}
		return "error";
	}
	
	public static String checkIfNull(String var){
		if(var!=null){
			
			return "notNull";
		}
		return "null";
	}
	
	public static String generateSessionId(String memberId){
		Random random =new Random();
		String sessionId = "ct9448fa-9dab-11d1-80b4-00c04fd430c8"+"-"+Math.abs(random.nextInt())+ ":" +memberId.trim();
		System.out.println(sessionId+"      soaTransactionID");
		return sessionId;
	}
	
	public static void encryptText(String text) 
    {
        try 
        {
            String key = "Bar12349Bar12349"; // 128 bit key
            // Create key and cipher
            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            // encrypt the text
            cipher.init(Cipher.ENCRYPT_MODE, aesKey);
            byte[] encrypted = cipher.doFinal(text.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b: encrypted) {
                sb.append((char)b);
            }

            // the encrypted String
            String enc = sb.toString();
            System.out.println("encrypted:" + enc);

            // now convert the string to byte array
            // for decryption
            byte[] bb = new byte[enc.length()];
            for (int i=0; i<enc.length(); i++) {
                bb[i] = (byte) enc.charAt(i);
            }

            // decrypt the text
            cipher.init(Cipher.DECRYPT_MODE, aesKey);
            String decrypted = new String(cipher.doFinal(bb));
            System.err.println("decrypted:" + decrypted);

        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
    }
	
}
