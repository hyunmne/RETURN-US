package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.Faq;
import service.FaqService;
import service.FaqServiceImpl;

/**
 * Servlet implementation class ModifyFaq
 */
@WebServlet("/faqmodify")
public class FaqModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			FaqService faqService = new FaqServiceImpl();
			Faq faq = faqService.faqSelect(request);
			request.setAttribute("faq", faq);
			request.getRequestDispatcher("/views/guide/faqModify.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errTitle", "조회 실패");
			request.setAttribute("errContent", "조회에 실패했습니다");
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			FaqService faqSerivce = new FaqServiceImpl();
			Integer faqNo = Integer.parseInt(request.getParameter("faqNo"));
			System.out.println(faqNo);
			faqSerivce.faqModify(request);
			response.sendRedirect("faq");
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errTitle", "수정 실패");
			request.setAttribute("errContent", "수정에 실패했습니다");
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
		}	
	}

}
