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

import com.yedam.member.control.AdminCompanyControl;
import com.yedam.member.control.AdminMemberControl;
import com.yedam.member.control.AdminNewCompanyControl;
import com.yedam.member.control.ConfirmControl;
import com.yedam.member.control.DeleteOrderControl;
import com.yedam.member.control.ModifyMemberControl;
import com.yedam.member.control.MyCartControl;
import com.yedam.member.control.MyPageControl;
import com.yedam.member.control.MyQnaListControl;
import com.yedam.member.control.SignInControl;
import com.yedam.member.control.SignOutControl;
import com.yedam.member.control.SignUpCheckControl;
import com.yedam.member.control.SignUpCompanyControl;
import com.yedam.member.control.SignUpControl;
import com.yedam.member.control.UpdateCartControl;
import com.yedam.member.control.WishListControl;
import com.yedam.notice.control.AddNotiControl;
import com.yedam.notice.control.AddNotiFormControl;
import com.yedam.notice.control.AddReplyCustomerControl;
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
import com.yedam.notice.control.ModifyNotiControl;
import com.yedam.notice.control.ModifyNotiFormControl;
import com.yedam.notice.control.ModifyReplyCustomerControl;
import com.yedam.notice.control.NotiControl;
import com.yedam.notice.control.ReplyListCustomerControl;
import com.yedam.member.control.NaverLoginControl;
import com.yedam.member.control.OrderDetailControl;
import com.yedam.member.control.OrderListControl;
import com.yedam.member.control.OrderPageControl;
import com.yedam.member.control.OtherLoginControl;
import com.yedam.member.control.OtherLoginInfoControl;
import com.yedam.member.control.SearchIdControl;
import com.yedam.member.control.SearchPwControl;
import com.yedam.product.control.AddBoardControl;
import com.yedam.product.control.AddBoardFormControl;
import com.yedam.product.control.AddProductControl;
import com.yedam.product.control.AddProductFormControl;
import com.yedam.product.control.AddReviewControl;
import com.yedam.product.control.AddReviewFormControl;
import com.yedam.product.control.BoardListControl;
import com.yedam.product.control.CategoryBoardControl;
import com.yedam.product.control.CtgJoin;
import com.yedam.product.control.CtgMain;
import com.yedam.product.control.CtgProd;
import com.yedam.product.control.CtgSub;
import com.yedam.product.control.DeleteBoardControl;
import com.yedam.product.control.DeleteProductControl;
import com.yedam.product.control.GetProductControl;
import com.yedam.product.control.ModifyBoardControl;
import com.yedam.product.control.ModifyProductControl;
import com.yedam.product.control.ModifyReviewControl;
import com.yedam.product.control.PayControl;
import com.yedam.product.control.ProductListControl;
import com.yedam.product.control.QnaListControl;
import com.yedam.product.control.RemoveReviewControl;
import com.yedam.product.control.ReviewListControl;
import com.yedam.product.control.SearchProductNameControl;
import com.yedam.product.control.ThemeControl;
import com.yedam.product.control.ThemeListControl;
import com.yedam.product.control.getBoardControl;

public class FrontControl extends HttpServlet {
	private Map<String, Control> map;
	String encoding;

	public FrontControl() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		// 메인페이지
		map.put("/main.do", new MainControl());
		// 검색기능
		map.put("/searchProductName.do", new SearchProductNameControl());

		// 로그인 페이지
		map.put("/signIn.do", new SignInControl());
		// 회원가입 회원종류 체크
		map.put("/signUpCheck.do", new SignUpCheckControl());
		// 회원가입 페이지
		map.put("/signUp.do", new SignUpControl());
		// 업체 회원일 경우 업체정보 입력
		map.put("/signUpCompany.do", new SignUpCompanyControl());
		// 로그아웃 페이지
		map.put("/signOut.do", new SignOutControl());
		// id,pw찾기
		map.put("/searchId.do", new SearchIdControl());
		map.put("/searchPw.do", new SearchPwControl());
		// kakao,naver 로그인
		map.put("/otherLogin.do", new OtherLoginControl());
		map.put("/naverLogin.do", new NaverLoginControl());
		map.put("/otherLoginInfo.do", new OtherLoginInfoControl());

		// 마이페이지
		map.put("/myPage.do", new MyPageControl());
		map.put("/modifyMember.do", new ModifyMemberControl());
		map.put("/orderList.do", new OrderListControl());
		map.put("/wishList.do", new WishListControl());
		map.put("/myQnaList.do", new MyQnaListControl());
		map.put("/deleteOrder.do", new DeleteOrderControl());
		map.put("/orderDetail.do", new OrderDetailControl());
		map.put("/orderPage.do", new OrderPageControl());

		// 상품 전체 리스트
		map.put("/productList.do", new ProductListControl());
		// 상품 상세페이지
		map.put("/getProduct.do", new GetProductControl());
		// 상품 등록, 수정, 삭제(판매자)
		map.put("/addProductForm.do", new AddProductFormControl());
		map.put("/addProduct.do", new AddProductControl());
		map.put("/modifyProduct.do", new ModifyProductControl());
		map.put("/deleteProduct.do", new DeleteProductControl());

		map.put("/ctgMain.do", new CtgMain());
		map.put("/ctgSub.do", new CtgSub());
		map.put("/ctgProd.do", new CtgProd());
		map.put("/ctgJoin.do", new CtgJoin());

		// 상품 게시판 리스트
		map.put("/boardList.do", new BoardListControl());
		// 상품게시판 상세보기
		map.put("/getBoard.do", new getBoardControl());
		// 카테고리별
		map.put("/categoryBoard.do", new CategoryBoardControl());

		// 게시판 등록, 수정, 삭제 (판매자)
		map.put("/addBoardForm.do", new AddBoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		map.put("/deleteBoard.do", new DeleteBoardControl());

		// 상품후기
		map.put("/reviewList.do", new ReviewListControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/addReviewForm.do", new AddReviewFormControl());
		map.put("/modifyReview.do", new ModifyReviewControl());
		map.put("/removeReview.do", new RemoveReviewControl());

		map.put("/qnaList.do", new QnaListControl());
		
		// 자주묻는 질문
		map.put("/faq.do", new FaqControl());

		// 고객센터 목록
		map.put("/customerCenter.do", new CustomerCenterControl());
		// 고객센터 글등록
		map.put("/customerAddForm.do", new CustomerAddFormControl());
		map.put("/customerAdd.do", new CustomerAddControl());
		// 고객센터 글조회
		map.put("/getCustomer.do", new GetCustomerControl());
		// 고객센터 글수정
		map.put("/modifyCustomer.do", new ModifyCustomerControl());
		// 고객센터 글삭제
		map.put("/delCustomer.do", new DelCustomerControl());

		// 댓글목록
		map.put("/replyListCustomer.do", new ReplyListCustomerControl());
		// 댓글등록
		map.put("/addReplyCustomer.do", new AddReplyCustomerControl());
		// 댓글수정
		map.put("/modifyReplyCustomer.do", new ModifyReplyCustomerControl());
		// 댓글삭제
		map.put("/delReplyCustomer.do", new DelReplyCustomerControl());

		// 공지사항 목록
		map.put("/noti.do", new NotiControl());
		// 공지사항 등록
		map.put("/addNotiForm.do", new AddNotiFormControl());
		map.put("/addNoti.do", new AddNotiControl());
		// 공지사항 글조회
		map.put("/getNoti.do", new GetNotiControl());
		// 공지사항 수정
		map.put("/modifyNotiForm.do", new ModifyNotiFormControl());
		map.put("/modifyNoti.do", new ModifyNotiControl());
		// 공지사항 삭제
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
		
		//결제
		map.put("/pay.do", new PayControl());
		
		//장바구니
		map.put("/myCart.do", new MyCartControl());
		map.put("/updateCart.do", new UpdateCartControl());
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
