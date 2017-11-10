package com.technophillia.model;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.TransactionException;
import com.technophillia.test.resource.ProjectUtil;
import com.technophillia.test.vo.AdminBean;
import com.technophillia.test.vo.BalanceSheetBean;
import com.technophillia.test.vo.MemberBean;

public class ModelDao {
	
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
	
	public static String addNewThriftReceipt(String memberId, String amountPaid,String transactionDescription){
		
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
				
				/*session.persist();
				tx.commit();*/
				
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
				bean.setUserName(userName);
				bean.setPassword(password);
				
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
				Query query = session.createQuery("select bean from AdminBean as bean where username=:value1").setParameter("value1", username);
				List<AdminBean> result=query.list();
				System.out.println("u:"+username+" P:"+password);
				System.out.println("<------------------->"+result);
				if(result.size()!=0)
				{
					if(result.get(0).getPassword().equals(password)&& result.get(0).getUserName().equals(username))
					{
						System.out.println(result.get(0));
						return "success: User validated Successfully";
					}
					return "error: Invalid Password for the user "+username;
				}
				else{
					return "error: user was not found";
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
