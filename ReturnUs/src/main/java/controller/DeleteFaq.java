package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FaqService;
import service.FaqServiceImpl;

/**
 * Servlet implementation class DeleteFaq
 */
@WebServlet("/deletefaq")
public class DeleteFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFaq() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			FaqService faqSerivce = new FaqServiceImpl();
			faqSerivce.deleteFaq(request);
			response.sendRedirect("faq");
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errTitle", "게시글 삭제 실패.");
			request.setAttribute("errContent", "게시글을 삭제 할 수 없습니다.");
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
			
		}
	}

}
