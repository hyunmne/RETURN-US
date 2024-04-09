package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NotFoundId
 */
@WebServlet("/resultfindid")
public class ResultFindid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultFindid() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    String accId = request.getParameter("accId");
	    String accJoinDt = request.getParameter("accJoinDt");
	    System.out.println("resutlfindidaccId:"+accId);
	    System.out.println("resultfindidaccJoinDt:"+accJoinDt);
	    request.setAttribute("accId", accId);
	    request.setAttribute("accJoinDt", accJoinDt);
	    request.getRequestDispatcher("/views/account/resultFindId.jsp").forward(request, response);
	}

}
