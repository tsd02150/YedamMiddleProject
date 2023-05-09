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
import com.yedam.notice.control.AddNotiControl;
import com.yedam.notice.control.AddNotiFormControl;
import com.yedam.notice.control.CustomerAddControl;
import com.yedam.notice.control.CustomerAddFormControl;
import com.yedam.notice.control.CustomerCenterControl;
import com.yedam.notice.control.DelCustomerControl;
import com.yedam.notice.control.DelNotiControl;
import com.yedam.notice.control.DelReplyCustomerControl;
import com.yedam.notice.control.GetCustomerControl;
import com.yedam.notice.control.GetNotiControl;
import com.yedam.notice.control.ModifyCustomerControl;
import com.yedam.notice.control.ModifyCustomerFormControl;
import com.yedam.notice.control.ModifyNotiControl;
import com.yedam.notice.control.ModifyNotiFormControl;
import com.yedam.notice.control.ModifyReplyCustomerControl;
import com.yedam.notice.control.NotiControl;
import com.yedam.notice.control.ReplyListCustomerControl;
import com.yedam.notice.control.AddReplyCustomerControl;
import com.yedam.product.control.GetProductControl;
import com.yedam.product.control.ProductListControl;
import com.yedam.product.control.ThemeControl;


public class FrontControl4 extends HttpServlet{
	private Map<String, Control> map;
	String encoding;
	public FrontControl4() {
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
		//상품 페이지
		map.put("/prodList.do", new ProductListControl());
		//상품 상세페이지
		map.put("/getProduct.do", new GetProductControl());
		
		
		
		
		//고객센터 목록
		map.put("/customerCenter.do",new CustomerCenterControl());
		//고객센터 글등록
		map.put("/customerAddForm.do", new CustomerAddFormControl());
		map.put("/customerAdd.do", new CustomerAddControl());
		//고객센터 글조회
		map.put("/getCustomer.do", new GetCustomerControl());
		//고객센터 글수정
		map.put("/modifyCustomer.do", new ModifyCustomerControl());
		//고객센터 글삭제
		map.put("/delCustomer.do", new DelCustomerControl());
		
		//댓글목록
		map.put("/replyListCustomer.do", new ReplyListCustomerControl());
		//댓글등록
		map.put("/addReplyCustomer.do",new AddReplyCustomerControl());
		//댓글수정
		map.put("/modifyReplyCustomer.do",new ModifyReplyCustomerControl());
		//댓글삭제
		map.put("/delReplyCustomer.do",new DelReplyCustomerControl());
		
		
		
		//공지사항 목록
		map.put("/noti.do", new NotiControl()); 
		//공지사항 등록
		map.put("/addNotiForm.do", new AddNotiFormControl());
		map.put("/addNoti.do", new AddNotiControl());
		//공지사항 글조회
		map.put("/getNoti.do", new GetNotiControl());
		//공지사항 수정
		map.put("/modifyNotiForm.do", new ModifyNotiFormControl());
		map.put("/modifyNoti.do", new ModifyNotiControl());
		//공지사항 삭제
		map.put("/delNoti.do", new DelNotiControl());
				
		
		//테마
		map.put("/theme.do",new ThemeControl());
		
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
