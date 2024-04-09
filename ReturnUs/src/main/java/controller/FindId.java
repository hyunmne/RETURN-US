package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dto.Account;
import service.AccountService;
import service.AccountServiceImpl;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/findid")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/account/findId.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String data = request.getParameter("data");
		System.out.println(data);
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject jobj = (JSONObject)parser.parse(data);
			String accName = (String)jobj.get("accName");
			String accBirth = (String)jobj.get("accBirth");
			String email = (String)jobj.get("email");
			
			AccountService accountService = new AccountServiceImpl();
			Account account = accountService.findId(accName,accBirth,email);
			String accId = account.getAccId();
			Date accJoinDt = account.getAccJoinDt();
			
			System.out.println("findidaccId:"+accId);
			System.out.println("findidaccJoinDt:"+accJoinDt);
			JSONObject res = new JSONObject();
			res.put("isSuccess", "true");
			res.put("accId", accId);
			res.put("accJoinDt", accJoinDt.toString());
			response.getWriter().write(res.toJSONString());
			
		}catch (Exception e) {
			e.printStackTrace(); 
			JSONObject res = new JSONObject();
			res.put("isSuccess", "false");
			res.put("msg", e.getMessage());
			response.getWriter().write(res.toJSONString());
		}
		
	}

}
