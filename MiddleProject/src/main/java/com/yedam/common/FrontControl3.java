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

import com.yedam.member.control.MyQnaListControl;
import com.yedam.member.control.OrderDeliListControl;
import com.yedam.member.control.OrderDetailControl;
import com.yedam.member.control.DeleteOrderControl;
import com.yedam.member.control.ModifyMemberCoControl;
import com.yedam.member.control.ModifyMemberControl;
import com.yedam.member.control.MyPageControl;
import com.yedam.member.control.OrderListControl;
import com.yedam.member.control.OrderPageControl;
import com.yedam.member.control.OrderProdListControl;
import com.yedam.member.control.SalesControl;
import com.yedam.member.control.SignInControl;
import com.yedam.member.control.SignOutControl;
import com.yedam.member.control.SignUpCheckControl;
import com.yedam.member.control.SignUpCompanyControl;
import com.yedam.member.control.SignUpControl;
import com.yedam.member.control.UpdateDeliControl;
import com.yedam.member.control.WishListControl;
import com.yedam.product.control.DeleteNowProductControl;
import com.yedam.product.control.DeleteProductControl;
import com.yedam.product.control.GetProductControl;
import com.yedam.product.control.ProdNowListControl;
import com.yedam.product.control.ProductListControl;


public class FrontControl3 extends HttpServlet{
	private Map<String, Control> map;
	String encoding;
	public FrontControl3() {
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		
		map.put("/main.do", new MainControl());
		
		// 로그인 페이지
		map.put("/signIn.do", new SignInControl());
		//회원가입 회원종류 체크
		map.put("/signUpCheck.do", new SignUpCheckControl());
		// 회원가입 페이지
		map.put("/signUp.do", new SignUpControl());
		// 업체 회원일 경우 업체정보 입력
		map.put("/signUpCompany.do", new SignUpCompanyControl());
		// 로그아웃 페이지
		map.put("/signOut.do", new SignOutControl());
		//상품 페이지
		map.put("/prodList.do", new ProductListControl());
		//상품 상세페이지
		map.put("/getProduct.do", new GetProductControl());
		//마이페이지
		map.put("/myPage.do", new MyPageControl());
		map.put("/modifyMember.do", new ModifyMemberControl());
		map.put("/orderList.do", new OrderListControl());
		map.put("/wishList.do", new WishListControl());
		map.put("/myQnaList.do", new MyQnaListControl());
		map.put("/deleteOrder.do", new DeleteOrderControl());
		map.put("/orderDetail.do", new OrderDetailControl());
		map.put("/orderPage.do", new OrderPageControl());
		
		map.put("/modifyMemberCo.do",new ModifyMemberCoControl());
		map.put("/prodNowList.do", new ProdNowListControl());
		map.put("/deleteNowProduct.do", new DeleteNowProductControl());
		map.put("/orderProdList.do", new OrderProdListControl());
		map.put("/orderDeliList.do", new OrderDeliListControl());
		map.put("/updateDeli.do", new UpdateDeliControl());
		map.put("/sales.do", new SalesControl());
		
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
		
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
