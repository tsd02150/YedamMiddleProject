package com.yedam.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServiceImpl;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.MainCategoryVO;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class MainControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		//핫딜 창 결정
		if (req.getParameter("checked") != null) {
			session.setAttribute("checked", req.getParameter("checked"));
		} else {
			if(session.getAttribute("checked") == null) {
				session.setAttribute("checked", "false");
			}
		}			
		if (req.getParameter("close") != null) {
			req.setAttribute("close", req.getParameter("close"));
		}
		
		// 게시물
		ProductService ps = new ProductServiceImpl();
		List<BoardVO> boardList = ps.boardList(1);
		int total = ps.totalCount();
		PageDTO dto = new PageDTO(1, total);
		req.setAttribute("boardList", boardList);
		req.setAttribute("pageInfo", dto);
		
		//카테고리
		List<MainCategoryVO> mainCateoryList = ps.ctgMain();
		req.setAttribute("mainCategoryList", mainCateoryList);
		
		//공지사항
		NoticeService ns = new NoticeServiceImpl();
		List<NoticeVO> noticeList = ns.notiList();
		if(noticeList.size()>4) {
			noticeList=noticeList.subList(0, 4);
		}
		req.setAttribute("noticeList", noticeList);
		
		//자주묻는질문
		List<NoticeVO> faqList = ns.searchFaq(1);
		if(faqList.size()>4) {
			faqList=faqList.subList(0, 4);			
		}
		req.setAttribute("faqList", faqList);

		
		return "common/main.tiles";
	}

}
