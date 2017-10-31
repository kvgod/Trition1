package com.technophillia.business;

public class ProjectBusinessUtil 
{

	public static float calculateThriftInterest(float principal, float time, float rateOfInterest){
		
		float thriftInterest = principal*time*rateOfInterest/100;
		
		System.out.println("Calculated thriftInterest is :"+thriftInterest);
		
		return thriftInterest;
		
		
	}
	
}
