package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import service.AccountService;
import service.AccountServiceImpl;
import util.NaverMailSendToChangePassword;

/**
 * Servlet implementation class FindPw
 */
@WebServlet("/findpw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/account/findPw.jsp").forward(request, response);
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
			String accId = (String)jobj.get("accId");
			String email = (String)jobj.get("email");
			
			AccountService accountSerivce = new AccountServiceImpl();
			accountSerivce.checkPassword(accId,email);
			JSONObject res = new JSONObject();
			res.put("isSuccess", "true");
			res.put("msg", "비밀번호가 재설정 되었습니다. 이메일을 확인하세요.");
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
