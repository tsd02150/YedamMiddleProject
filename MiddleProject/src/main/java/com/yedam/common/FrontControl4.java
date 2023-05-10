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
import com.yedam.member.control.WishListControl;
import com.yedam.member.control.AdminCompanyControl;
import com.yedam.member.control.AdminMemberControl;
import com.yedam.member.control.AdminNewCompanyControl;
import com.yedam.member.control.ConfirmControl;
import com.yedam.member.control.DeleteOrderControl;
import com.yedam.member.control.ModifyMemberControl;
import com.yedam.member.control.MyPageControl;
import com.yedam.member.control.MyQnaListControl;
import com.yedam.member.control.OrderDetailControl;
import com.yedam.member.control.OrderListControl;
import com.yedam.notice.control.AddNotiControl;
import com.yedam.notice.control.AddNotiFormControl;
import com.yedam.notice.control.CustomerAddControl;
import com.yedam.notice.control.CustomerAddFormControl;
import com.yedam.notice.control.CustomerCenterControl;
import com.yedam.notice.control.DelCustomerControl;
import com.yedam.notice.control.DelNotiControl;
import com.yedam.notice.control.DelReplyCustomerControl;
import com.yedam.notice.control.FaqControl;
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
import com.yedam.product.control.BoardListControl;
import com.yedam.product.control.CategoryBoardControl;
import com.yedam.product.control.GetProductControl;
import com.yedam.product.control.ProductListControl;
import com.yedam.product.control.ThemeControl;
import com.yedam.product.control.ThemeListControl;
import com.yedam.product.control.getBoardControl;

public class FrontControl4 extends HttpServlet {

	private Map<String, Control> map;
	String encoding;

	public FrontControl4() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");

		// 메인 페이지
		map.put("/main.do", new MainControl());

		// 로그인 페이지
		map.put("/signIn.do", new SignInControl());
		// 회원가입 페이지
		map.put("/signUp.do", new SignUpControl());
		// 로그아웃 페이지
		map.put("/signOut.do", new SignOutControl());
		
		// 상품 페이지
		map.put("/prodList.do", new ProductListControl());
		// 상품 상세페이지
		map.put("/getProduct.do", new GetProductControl());
		// 상품 게시판 리스트
		map.put("/boardList.do", new BoardListControl());
		// 상품게시판 상세보기
		map.put("/getBoard.do", new getBoardControl());
		// 카테고리별
		map.put("/categoryBoard.do", new CategoryBoardControl());

		
		// 고객센터
		map.put("/customerCenter.do", new CustomerCenterControl());
		map.put("/customerAddForm.do", new CustomerAddFormControl());
		map.put("/customerAdd.do", new CustomerAddControl());
		map.put("/getCustomer.do", new GetCustomerControl());
		map.put("/modifyCustomer.do", new ModifyCustomerControl());
		map.put("/delCustomer.do", new DelCustomerControl());

		// 고객센터 댓글
		map.put("/replyListCustomer.do", new ReplyListCustomerControl());
		map.put("/addReplyCustomer.do", new AddReplyCustomerControl());
		map.put("/modifyReplyCustomer.do", new ModifyReplyCustomerControl());
		map.put("/delReplyCustomer.do", new DelReplyCustomerControl());
		
		//자주묻는 질문
		map.put("/faq.do", new FaqControl());
		
		// 공지사항
		map.put("/noti.do", new NotiControl());
		map.put("/addNotiForm.do", new AddNotiFormControl());
		map.put("/addNoti.do", new AddNotiControl());
		map.put("/getNoti.do", new GetNotiControl());
		map.put("/modifyNotiForm.do", new ModifyNotiFormControl());
		map.put("/modifyNoti.do", new ModifyNotiControl());
		map.put("/delNoti.do", new DelNotiControl());

		// 테마
		map.put("/theme.do", new ThemeControl());
		map.put("/themeList.do", new ThemeListControl());

		// 관리자용 페이지
		// 회원관리
		map.put("/adminMember.do", new AdminMemberControl());
		// 업체관리
		map.put("/adminCompany.do", new AdminCompanyControl());
		// 신규업체
		map.put("/newCompany.do", new AdminNewCompanyControl());
		//업체컨펌
		map.put("/confirm.do", new ConfirmControl());

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

		if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}
		if (viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0, viewPage.length() - 5));
			return;
		}

		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);

	}
}
