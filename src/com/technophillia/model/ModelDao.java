package com.technophillia.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.TransactionException;

import com.technophillia.resource.ProjectUtil;
import com.technophillia.test.vo.AdminBean;
import com.technophillia.test.vo.BalanceSheetBean;
import com.technophillia.test.vo.MemberBean;

public class ModelDao {
	
	public static ArrayList<BalanceSheetBean> getAjaxFrameWork(String input) {
		System.out.println("ModelDao getAjaxFrameWork---> input param:"+input);
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		ArrayList<BalanceSheetBean> result= new ArrayList<BalanceSheetBean>();
        sessionFactory = ProjectUtil.getSessionFactory();

		if (sessionFactory == null)
			throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
		else 
		{
			
			session = sessionFactory.openSession();
			System.out.println("session established");
			try{
				tx=session.beginTransaction();
			
			Query query = session.createQuery("select bean from BalanceSheetBean as bean where member_id LIKE :value1 OR member_name LIKE :value1").setParameter("value1", "%"+ input+"%");
			result=(ArrayList<BalanceSheetBean>) query.list();
			
			System.out.println("<------------------->"+result);
			}
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
		}
	}
	
	public static List<BalanceSheetBean> fetchMemberBasedOnName(String memberName){
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		List<BalanceSheetBean> result=new ArrayList<BalanceSheetBean>();
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else 
			{
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				Query query = session.createQuery("select bean from BalanceSheetBean as bean where member_name=:value1").setParameter("value1", memberName);
				result=query.list();
			
				tx.commit();
				session.close();
				System.out.println("<------------------->"+result);
					
			}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			return result;
		}
	}
	
	
	public static List<BalanceSheetBean> fetchMemberDetailsBasedOnMemberId(String memberId){
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else {
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				Query query = session.createQuery("select bean from BalanceSheetBean as bean where memberId=:value1").setParameter("value1", memberId);
				List<BalanceSheetBean> result=query.list();
				
				System.out.println("<------------------->"+result);
				
				return result;
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Oops something bad happened msg = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
			if (sessionFactory != null)
				sessionFactory.close();
		}
		
		
		
	}
	
	public static String updateReceipt(List<BalanceSheetBean> balanceBean,String memberId, String memberName, String transactionHead, String paymentValue, String transactionDate,String transactionDescription){
		
		System.out.println("[ModelDao](updateReceipt)-->");
		
		System.out.println("Input Params:List<BalanceSheetBean>balanceBean "+balanceBean+" \n ");
		System.out.println("Input Params:String memberId"+memberId+", String memberName"+memberName+", String transactionHead"+transactionHead+", String paymentValue"+paymentValue+", String transactionDate"+transactionDate+",String transactionDescription "+transactionDescription+" \n ");
		
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else 
			{
				session = sessionFactory.openSession();
				tx = session.beginTransaction();
				System.out.println("session established");
				
				BalanceSheetBean bean = balanceBean.get(0);
				
				
				if(transactionHead.equals("monthly_thrift"))
				{
					Float currentYear = new  Float(balanceBean.get(0).getThriftCurrentYear());
					Float currentThriftAddition = new Float(paymentValue);
					Float updatedThriftCurrentYear = currentYear+currentThriftAddition;
					bean.setThriftCurrentYear(updatedThriftCurrentYear.toString());					
					
				}
				if(transactionHead.equals("loan_repayment"))
				{
					
					
					
					
				}
				
				System.out.println("Adding bean"+bean);
				session.update(bean);
				//session.persist(bean);
				tx.commit();
				
				return "success";
				
			}
		}
		catch(TransactionException e){
			System.out.println(">>>>>>>>>>>>>addAdminUser exception occured"+e.getMessage());
			return "error:"+e.getMessage();
		}
		catch(RuntimeException e){
			System.out.println(">>>>>>>>>>>>>addAdminUser exception occured"+e.getMessage());
			return "error:"+e.getMessage();
		}
		finally{
			
			if(session!=null)
				session.close();			
		}
		
		
	
	}
	
	public static String addNewMemberToGroup(String memberId,String memberName, String memberContactNumber,String memberEmailId,String memberAddress,String memberDOB){
		
		System.out.println("<-----ModelDao addNewMemberToGroup()---->");
		
		System.out.println("Input Params: \n"+"memberId :"+memberId+"\n memberName: "+memberName);
		System.out.println("Input Params: \n"+"memberContactNumber :"+memberContactNumber+"\n memberEmailId: "+memberEmailId);
		System.out.println("Input Params: \n"+"memberAddress :"+memberAddress+"\n memberDOB: "+memberDOB);
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else 
			{
				session = sessionFactory.openSession();
				tx = session.beginTransaction();
				System.out.println("session established");
				MemberBean bean = new MemberBean();
				bean.setMemberId(memberId);
				bean.setMemberName(memberName);
				bean.setMemberAddress(memberAddress);
				bean.setMemberContactNumber(memberContactNumber);
				bean.setMemberDOB(memberDOB);
				bean.setMemberEmailId(memberEmailId);
				
				BalanceSheetBean bean1 = new BalanceSheetBean();
				bean1.setMemberId(memberId);
				bean1.setMemberName(memberName);
				bean1.setAdmissionFees(Integer.toString(0));
				bean1.setDividend(Integer.toString(0));
				bean1.setFixedDepositInterestReceived(Integer.toString(0));
				bean1.setLoanInterestPaid(Integer.toString(0));
				bean1.setLoanOutstanding(Integer.toString(0));
				bean1.setRecurringDepositCurrentBalance(Integer.toString(0));
				bean1.setRecurringDepositCurrentYear(Integer.toString(0));
				bean1.setRecurringDepositInterestReceived(Integer.toString(0));
				bean1.setRecurringDepositOpeningBalance(Integer.toString(0));
				bean1.setRecurringDepositRefund(Integer.toString(0));
				bean1.setShareCapitalCurrentBalance(Integer.toString(0));
				bean1.setShareCapitalCurrentYear(Integer.toString(0));
				bean1.setShareCapitalOpeningBalance(Integer.toString(0));
				
				bean1.setThriftCurrentBalance(Integer.toString(0));
				bean1.setThriftCurrentYear(Integer.toString(0));
				bean1.setThriftInterest(Integer.toString(0));
				bean1.setThriftopeningBalance(Integer.toString(0));
				
				
				
				System.out.println("loaded values to MemberBean "+bean);
				System.out.println("loaded values to BalanceSheetBean "+bean1);
				
				session.persist(bean);
				session.persist(bean1);
				tx.commit();
				
				return "success";
				
			}
		}
		
		catch(TransactionException e){
			System.out.println("----------------->>>>>>>>>>>>>addNewMemberUser Transaction exception occured"+e.getMessage());
			return "error: "+e.getMessage();
		}
		catch(HibernateException e){
			System.out.println("----------------->>>>>>>>>>>>>addNewMemberUser Hibernate exception occured"+e.getMessage());
			return "error: "+e.getMessage();
		}
		catch(RuntimeException e){
			System.out.println("++++++++++++++++++++>>>>>>>>>>>>>addNewMemberUser Runtime exception occured"+e.getMessage());
			return "error: "+e.getMessage();
		}
		finally{
			
			if(session!=null)
				session.close();			
		}
	}
	
	public static String addAdminUser(String userName, String password){
		
		System.out.println("<-----ModelDao addAdminUser()---->");
		System.out.println("Input Params: \n"+"username :"+userName+"\n password: "+password);
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else 
			{
				session = sessionFactory.openSession();
				tx = session.beginTransaction();
				System.out.println("session established");
				AdminBean bean = new AdminBean();
				System.out.println("```````````````````ENCRYPT``````````````````````````````````````");
				
				System.out.println("Lets Check UName:  "+ProjectUtil.encryptData(userName));
				System.out.println("Lets Check Password:  "+ProjectUtil.encryptData(password));
				
				
				System.out.println("`````````````````````````````````````````````````````````````````");
				
				
				System.out.println("`````````````````DECRYPT````````````````````````````````");
				
				System.out.println("Lets Check decrypt UName:  "+ProjectUtil.decryptData(ProjectUtil.encryptData(userName)));
				System.out.println("Lets Check decrypt Password:  "+ProjectUtil.decryptData(ProjectUtil.encryptData(password)));
				
				
				System.out.println("`````````````````````````````````````````````````````````````````");
				
				
				
				bean.setUserName(ProjectUtil.encryptData(userName));
				bean.setPassword(ProjectUtil.encryptData(password));
				
				System.out.println("loaded values to bean "+bean);
				
				session.persist(bean);
				tx.commit();
				
				return "success";
				
			}
		}
		catch(TransactionException e){
			System.out.println(">>>>>>>>>>>>>addAdminUser exception occured"+e.getMessage());
			return "error:"+e.getMessage();
		}
		catch(RuntimeException e){
			System.out.println(">>>>>>>>>>>>>addAdminUser exception occured"+e.getMessage());
			return "error:"+e.getMessage();
		}
		finally{
			
			if(session!=null)
				session.close();			
		}
		
	}
	
	public static String checkAdminUser(String username,String password){
		
		System.out.println("Entering checkAdminUser:\n"+"username: "+username+" \n password: "+password);
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else {
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				System.out.println("Lets check input query param:"+ProjectUtil.encryptData(username));
				Query query = session.createQuery("select bean from AdminBean as bean where username=:value1").setParameter("value1", ProjectUtil.encryptData(username));
				List<AdminBean> result=query.list();
				System.out.println("u:"+username+" P:"+password);
				System.out.println("<------------------->"+result);
				if(result.size()!=0)
				{
					if(ProjectUtil.decryptData(result.get(0).getPassword()).equals(password)&& ProjectUtil.decryptData(result.get(0).getUserName()).equals(username))
					{
						System.out.println(result.get(0));
						return "success: User validated Successfully";
					}
					return "error: Invalid Password for the user "+username+ ",Please Retry";
				}
				else{
					return "error:"+ username+" is not a valid user to this portal";
				}
			
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Oops something bad happened msg = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
			if (sessionFactory != null)
				sessionFactory.close();
		}
	
	}
	public static List<MemberBean> viewMemberDetails(String key) {
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else {
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				//Query query = session.createQuery("select bean from MemberBean as bean where member_id "+key+" OR member_name LIKE "+key+" OR contact_number LIKE "+key+" OR email LIKE "+key+" OR dob LIKE "+key+"");
				Query query = session.createQuery("select bean from MemberBean as bean where member_id="+key);
				List<MemberBean> result=query.list();
				
				System.out.println("<-------Lets see what the list has---AJAX--viewMemberDetails-- ------------>"+result);
				
			
				return result;
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Oops something bad happened msg = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
			if (sessionFactory != null)
				sessionFactory.close();
		}
	}

	public static List<MemberBean> viewMemberDetails() {
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else {
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				Query query = session.createQuery("select bean from MemberBean as bean");
				List<MemberBean> result=query.list();
				
				System.out.println("<-------Lets see what the list has------------>"+result);
				
			
				return result;
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Oops something bad happened msg = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
			if (sessionFactory != null)
				sessionFactory.close();
		}
	}
	
	public static List<BalanceSheetBean> viewBalanceSheet() {
		SessionFactory sessionFactory = null;
		Session session = null;
		Transaction tx = null;
		try 
		{
			sessionFactory = ProjectUtil.getSessionFactory();

			if (sessionFactory == null)
				throw new RuntimeException("Oops theres been a problem. Cannot connect to DB! Contact Admin!!");
			else {
				session = sessionFactory.openSession();
				System.out.println("session established");
				tx=session.beginTransaction();
				Query query = session.createQuery("select bean from BalanceSheetBean as bean");
				List<BalanceSheetBean> result=query.list();
				
				System.out.println("<-------Lets see what the list has------------>"+result);
				
			
				return result;
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Oops something bad happened msg = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
			if (sessionFactory != null)
				sessionFactory.close();
		}
	}
	
	
}
