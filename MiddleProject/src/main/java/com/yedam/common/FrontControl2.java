package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.member.control.SignInControl;
import com.yedam.member.control.SignOutControl;
import com.yedam.member.control.SignUpControl;
import com.yedam.product.control.AddBoardControl;
import com.yedam.product.control.AddBoardFormControl;
import com.yedam.product.control.AddProductControl;
import com.yedam.product.control.AddProductFormControl;
import com.yedam.product.control.AddReviewControl;
import com.yedam.product.control.BoardListControl;
import com.yedam.product.control.DeleteBoardControl;
import com.yedam.product.control.DeleteProductControl;
import com.yedam.product.control.GetProductControl;
import com.yedam.product.control.ModifyBoardControl;
import com.yedam.product.control.ModifyProductControl;
import com.yedam.product.control.ModifyReviewControl;
import com.yedam.product.control.ProductListControl;
import com.yedam.product.control.RemoveReviewControl;
import com.yedam.product.control.ReviewListControl;
import com.yedam.product.control.getBoardControl;


public class FrontControl2 extends HttpServlet{
	private Map<String, Control> map;
	String encoding;
	public FrontControl2() {
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		
		map.put("/main.do", new MainControl());
		
		// 로그인 페이지
		map.put("/signIn.do", new SignInControl());
		// 회원가입 페이지
		map.put("/signUp.do", new SignUpControl());
		// 로그아웃 페이지
		map.put("/signOut.do", new SignOutControl());
		
		//상품 리스트
		map.put("/productList.do", new ProductListControl());
		//상품 상세리스트
		map.put("/getProduct.do", new GetProductControl());
		//상품 등록, 수정, 삭제(판매자)
		map.put("/addProductForm.do", new AddProductFormControl());
		map.put("/addProduct.do", new AddProductControl());
		map.put("/modifyProduct.do", new ModifyProductControl());
		map.put("/deleteProduct.do", new DeleteProductControl());
		
		
		//상품 게시판 리스트
		map.put("/boardList.do", new BoardListControl());
		//상품게시판 상세보기
		map.put("/getBoard.do", new getBoardControl());
		
		//게시판 등록, 수정, 삭제 (판매자)
		map.put("/addBoardForm.do", new AddBoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		map.put("/deleteBoard.do", new DeleteBoardControl());
		
		//상품후기
		map.put("/reviewList.do", new ReviewListControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/modifyReview.do", new ModifyReviewControl());
		map.put("/removeReview.do", new RemoveReviewControl());
		
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding(encoding);
		
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);
		
		Control control = map.get(path);
		String viewPage = control.execute(req, resp);
		System.out.println(viewPage);
		
		if(viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}
		if(viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0,viewPage.length()-5));
			return;
		}
		if(viewPage.indexOf(".do") != -1) {
			resp.sendRedirect(viewPage);
			return;
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
