package com.technophillia.business;

public class ProjectBusinessUtil 
{
	 private static final String DATE_PATTERN =
	          "((19|20)\\d\\d)/(0?[1-9]|1[012])/(0?[1-9]|[12][0-9]|3[01])";
	 
	 
	 public static String thriftInterestYearBased(String openingBalance){
		 
		 
		 return "";
	 }

	public static String calculateThriftInterest(String prin, String numberOfMonths, String rate){
		
		Float principal = new Float(prin);
		Float time = new Float(numberOfMonths);
		Float rateOfInterest = new Float(rate);
		
		
		Float thriftInterest = (principal*time*rateOfInterest)/(12*100);
		
		System.out.println("Calculated thriftInterest is :"+thriftInterest);
		
		return thriftInterest.toString();

	}
	
	public static String calculateNoOfMonthsBasedOnDate(String timestamp) throws Exception{
		//Assuming the date format to be yyyy/mm/dd
		String numberOfMonths="";
		if(timestamp.matches(DATE_PATTERN))
		{			
			
			switch(timestamp.substring(5, 7))
			{			
			case "01":numberOfMonths=numberOfMonths+"12";break;
			case "02":numberOfMonths=numberOfMonths+"11";break;
			case "03":numberOfMonths=numberOfMonths+"10";break;
			case "04":numberOfMonths=numberOfMonths+"09";break;
			case "05":numberOfMonths=numberOfMonths+"08";break;
			case "06":numberOfMonths=numberOfMonths+"07";break;
			case "07":numberOfMonths=numberOfMonths+"06";break;
			case "08":numberOfMonths=numberOfMonths+"05";break;
			case "09":numberOfMonths=numberOfMonths+"04";break;
			case "10":numberOfMonths=numberOfMonths+"03";break;
			case "11":numberOfMonths=numberOfMonths+"02";break;
			case "12":numberOfMonths=numberOfMonths+"01";break;			
			
			}
		}
		else{
			System.out.println("Incorrect Date format");
			throw new Exception("Incorrect Date format");			
		}
		
		
		return numberOfMonths;		
	}
	
	
	
	
	
	
}
