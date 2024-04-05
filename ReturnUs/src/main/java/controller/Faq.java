package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Account;
import service.FaqService;
import service.FaqServiceImpl;

/**
 * Servlet implementation class Faq
 */
@WebServlet("/faq")
public class Faq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Faq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			FaqService faqService = new FaqServiceImpl();
			faqService.faqListByPage(request);
			HttpSession session = request.getSession();
			Account acc = (Account)session.getAttribute("acc");
			if(acc != null) {
				request.setAttribute("admin", acc.getAccAdmin());
			}		
			request.getRequestDispatcher("/views/guide/faq.jsp").forward(request, response);
    	}catch (Exception e) {		
    		e.printStackTrace();
			request.setAttribute("errTitle", "조회 실패");
			request.setAttribute("errTitle", "자주묻는 질문 조회에 실패했습니다.");
			request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
		}
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
