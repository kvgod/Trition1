package com.technophillia.test.resource;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			request.getRequestDispatcher("Receipt.jsp").forward(request, response);
		}
    	/*
    	 * =================================== END GET REQUESTS======================================================
    	 */
    	
		
		/*
    	 * ==========================START POST REQUESTS======================================================
    	 */
		
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
				session.setAttribute("session", "valid_user");
				request.setAttribute("success", result);
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				rd.forward(request, response);
				
			}else if (result.contains("error: Invalid Password for the user")) {
				request.setAttribute("error", result);
				RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
				rd.forward(request, response);
			}
			else{			
				request.setAttribute("error", result);
				RequestDispatcher rd=request.getRequestDispatcher("Result.jsp");
				rd.forward(request, response);
			}
		
		}
		
		if(request.getRequestURI().contains("addNewMember"))
		{
			System.out.println("requestURI ==>"+request.getRequestURI());
			
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
				RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				rd.forward(request, response);
			}
			
		}
	
		
		/*
    	 * ==========================END POST REQUESTS======================================================
    	 */
		
		
    	
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
