package com.technophillia.model;

import java.util.Date;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.technophillia.resource.ProjectUtil;

public class AuditDao 
{
	
	
	public static void addSuccessDataToMongo(String userName) throws Exception
	{
		
		
		DBCollection collection = ProjectUtil.mongoConnection("project1", "LoginSuccess");
		
		if(collection!=null)
		{
		BasicDBObject document = new BasicDBObject();
		document.put("Database", "usersLoginAttempt");
		
		BasicDBObject documentSuccessful = new BasicDBObject();
		documentSuccessful.put("userName", userName);
		documentSuccessful.put("Access Time", new Date());
		document.put("loginSuccessful", documentSuccessful);
		
		collection.insert(document);
		}
		else{
			
			throw new Exception("Could not establish Connection with MongoDB");
		}
		
	}
	public static void addFailureDataToMongo(String userName, String message) throws Exception
	{
		DBCollection collection = ProjectUtil.mongoConnection("project1", "LoginFailure");
		
		if(collection!=null)
		{
		BasicDBObject document = new BasicDBObject();
		document.put("Database", "usersLoginAttempt");
		
		BasicDBObject documentFailed = new BasicDBObject();
		documentFailed.put("userName", userName);
		documentFailed.put("Message", message);
		documentFailed.put("Access Time", new Date());
		document.put("loginFailed", documentFailed);
		
		collection.insert(document);
		}
		else{
			
			throw new Exception("Could not establish Connection with MongoDB");
		}
		
	}

}
