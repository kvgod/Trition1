package com.technophillia.resource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.technophillia.model.AuditDao;
import com.technophillia.model.ModelDao;
import com.technophillia.test.vo.BalanceSheetBean;
import com.technophillia.test.vo.MemberBean;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
    }
    
    
    protected void process(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	/*
    	 * ==========================START GET REQUESTS======================================================
    	 */
    	
    try
    {    	
    	
    	if(request.getRequestURI().contains("editSpecificMember"))
    	{
    		HttpSession session = request.getSession(true);
    		String memberName = request.getParameter("search");
            System.out.println("Data For Receipt/Payment " + memberName); 
            List<BalanceSheetBean> result = ModelDao.fetchMemberBasedOnName(memberName);
             
    		if(result.size()!=0){
    			request.setAttribute("member_details", result);
    			RequestDispatcher rd=request.getRequestDispatcher("Receipt.jsp");
    			rd.forward(request, response);	
    			
    		}else{
    			request.setAttribute("message", "Requested User not available, Would you like to register a new user?"+"<a href='RegisterNewMember.jsp'>Register Here</a>");
    			RequestDispatcher rd=request.getRequestDispatcher("SearchMember.jsp");
    			rd.forward(request, response);	
    		}
             
    	}
    	
    	if(request.getRequestURI().contains("searchAjax"))
    	{
    		
    		 response.setContentType("application/json");
             try {
                     String term = request.getParameter("term");
                     System.out.println("Data from ajax call " + term);

                     
                     ArrayList<BalanceSheetBean> list = ModelDao.getAjaxFrameWork(term);
                     
                     List<String> memberNames = new ArrayList<>();
                     
                     for(BalanceSheetBean name:list){
                    	 memberNames.add(name.getMemberName());
                     }

                     //String searchList = new Gson().toJson(list);
                     String searchList = new Gson().toJson(memberNames);
                     request.setAttribute("member_details", list);
                     response.getWriter().write(searchList);
             } catch (Exception e) {
                     System.err.println(e.getMessage());
             }	
    		
    	}
    	
    	if(request.getRequestURI().contains("APKGK")){
    		HttpSession session = request.getSession();
    		String memberId = ProjectUtil.fetchMemberIdFromURL(request.getRequestURI());
    		System.out.println("Lets Check the MemeberID:"+memberId);
    		List<BalanceSheetBean> result = ModelDao.fetchMemberDetailsBasedOnMemberId(memberId);
    		if(result.size()!=0){
    			request.setAttribute("member_details", result);
    			RequestDispatcher rd=request.getRequestDispatcher("MemberBalanceSheetDetails.jsp");
    			rd.forward(request, response);	
    			
    		}else{
    			request.setAttribute("message", "There was a problem fetching the userDetails, Please Contact Support");
    			RequestDispatcher rd=request.getRequestDispatcher("BalanceSheet.jsp");
    			rd.forward(request, response);	
    		}
    		
    	}
    	if(request.getRequestURI().contains("viewSpecificMembers")){
			HttpSession session = request.getSession();
			String key=request.getParameter("name");
			System.out.println("Inside key search member block------>");
			List<MemberBean> members = ModelDao.viewMemberDetails(key);
			request.setAttribute("member_details", members);
			RequestDispatcher rd=request.getRequestDispatcher("MemberDetails.jsp");
			rd.forward(request, response);			
		}
		
		if(request.getRequestURI().contains("logout")){
			HttpSession session = request.getSession();
			request.logout();
			session.removeAttribute("session");
			session.invalidate();
			
			System.out.println("Inside logout block------>");
			RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
			rd.forward(request, response);			
		}
		if(request.getRequestURI().contains("viewMembers")){
			System.out.println("requestURI ==>"+request.getRequestURI());
			
			List<MemberBean> result = ModelDao.viewMemberDetails();
			
			System.out.println("In controller of Hib project"+result);
			
			if(result.size()!=0){
				request.setAttribute("member_details", result);
				RequestDispatcher rd=request.getRequestDispatcher("MemberDetails.jsp");
				rd.forward(request, response);				
			}
			else{				
				request.setAttribute("error_member_details", "Sorry, No Members found to retrive");
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				rd.forward(request, response);
			}
		}
		if(request.getRequestURI().contains("viewBalanceSheet")){
			System.out.println("requestURI ==>"+request.getRequestURI());
			
			List<BalanceSheetBean> result = ModelDao.viewBalanceSheet();
			
			System.out.println("In controller of Hib project"+result);
			
			if(result.size()!=0){
				request.setAttribute("member_details", result);
				RequestDispatcher rd=request.getRequestDispatcher("BalanceSheet.jsp");
				rd.forward(request, response);				
			}
			else{				
				request.setAttribute("error_member_details", "Sorry, No Members found to retrive");
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				rd.forward(request, response);
			}
						
		}
		if(request.getRequestURI().contains("createReceipt")){
			System.out.println("Uri:"+request.getRequestURI());
			request.getRequestDispatcher("SearchMember.jsp").forward(request, response);
		}
    	/*
    	 * =================================== END GET REQUESTS======================================================
    	 */
    	
		
		/*
    	 * ==========================START POST REQUESTS======================================================
    	 */
		
		if(request.getRequestURI().contains("updateBalanceSheet")){
			HttpSession session =request.getSession();
			System.out.println("requestURI ==>"+request.getRequestURI());
			
			
			
		}
		
		
		if(request.getRequestURI().contains("receiptCheck"))
		{
			HttpSession session =request.getSession();
			System.out.println("requestURI ==>"+request.getRequestURI());
			
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String transactionHead = request.getParameter("headValue");
			String paymentValue = request.getParameter("paymentValue");
			String transactionDate = request.getParameter("transaction_date");
			String transactionDescription = request.getParameter("transactionDescription");
			
			
			System.out.println("input:::"+memberId+memberName+transactionHead+paymentValue+transactionDate+transactionDescription);
			
			List<BalanceSheetBean> balanceBean =(List<BalanceSheetBean>) request.getSession().getAttribute("member_balance_sheet");
		
			System.out.println("******///////////////"+request.getSession(true).getAttribute("member_balance_sheet"));
		
			System.out.println("Lets see the list:"+balanceBean);
			
			if(balanceBean!=null&&memberId!=null&&memberName!=null&&transactionHead!=null&&paymentValue!=null&&transactionDate!=null&&transactionDescription!=null)
			{
				String result = ModelDao.updateReceipt(balanceBean,memberId, memberName, transactionHead, paymentValue, transactionDate, transactionDescription);
				
				if(result.equals("success"))
				{
					request.setAttribute("success", "Successfully Added a new member");
					RequestDispatcher rd=request.getRequestDispatcher("DashboardW3.jsp");
					rd.forward(request, response);
				}
			}
			else{
				System.out.println("Some Error Has Occured");
				request.setAttribute("error_check", "Problem with input params");
				RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			
		}
		
		if(request.getRequestURI().contains("addAdminUser"))
		{
			String userName = request.getParameter("username");
			String password = request.getParameter("password");
			
			String result = ModelDao.addAdminUser(userName, password);
				
				if(result.equals("success")){
					request.setAttribute("Admin_Added_Success", "User Added Successfully");
					RequestDispatcher rd=request.getRequestDispatcher("Result.jsp");
					rd.forward(request, response);			
				}
				else{
					request.setAttribute("error", result);
					RequestDispatcher rd=request.getRequestDispatcher("Result.jsp");
					rd.forward(request, response);			
				}
			
		}
		
		if(request.getRequestURI().contains("checkAdmin")){
			System.out.println("requestURI ==>"+request.getRequestURI());
			String result = ModelDao.checkAdminUser(request.getParameter("username"),request.getParameter("password"));
			System.out.println("Lets check the value of result"+result);
			if(result.contains("success")){
				System.out.println("result is equal to success");
				HttpSession session = request.getSession(true);
				session.setMaxInactiveInterval(10);
				session.setAttribute("session", "valid_user");
				request.setAttribute("success", result);
				//RequestDispatcher rd=request.getRequestDispatcher("NewDashboard.jsp");
				AuditDao.addSuccessDataToMongo(request.getParameter("username"));
				Cookie cookie = new Cookie("authentic", request.getParameter("username"));
				cookie.setMaxAge(20);
				response.addCookie(cookie);
				RequestDispatcher rd=request.getRequestDispatcher("DashboardW3.jsp");
				rd.forward(request, response);
				
			}else if (result.contains("error: Invalid Password for the user")) {
				request.setAttribute("error", result);
				AuditDao.addFailureDataToMongo(request.getParameter("username"),result);
				RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
				rd.forward(request, response);
			}
			else{			
				request.setAttribute("error", result);
				AuditDao.addFailureDataToMongo(request.getParameter("username"),result);
				RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
				rd.forward(request, response);
			}
		
		}
		
		if(request.getRequestURI().contains("addNewMember"))
		{
			System.out.println("requestURI ==>"+request.getRequestURI());
			HttpSession session= request.getSession(true);
			session.setAttribute("session", "valid_user");
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberContact = request.getParameter("memberContact");
			String memberEmail = request.getParameter("Email");
			String memberAddress = request.getParameter("address");
			String memberDob = request.getParameter("dateOfBirth");			
			
			String result = ModelDao.addNewMemberToGroup(memberId, memberName, memberContact, memberEmail, memberAddress, memberDob);
			
			if(result.equals("success"))
			{
				request.setAttribute("success", "Successfully Added a new member");
				RequestDispatcher rd=request.getRequestDispatcher("DashboardW3.jsp");
				rd.forward(request, response);
			}
			
		}	
		
		/*
    	 * ==========================END POST REQUESTS======================================================
    	 */
    }
    catch (Exception e) {
		System.out.println("Some Error Has Occured");
		request.setAttribute("error_check", e.getMessage());
		RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
		rd.forward(request, response);
	}
		
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		process(request,response);		
	}

}
