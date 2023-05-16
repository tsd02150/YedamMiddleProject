package com.yedam.member.service;

import java.util.List;

import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.DeliveryVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.domain.OrderDetailVO;
import com.yedam.member.domain.OrdersVO;
import com.yedam.member.domain.WishVO;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.QnaVO;

public interface MemberService {
	public boolean addMember(MemberVO vo);
	public boolean modifyMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberInfo(String id);
	public String searchId(MemberVO vo);
	public String searchPw(MemberVO vo);
	public boolean updateMemberM(MemberVO vo);
	public List<QnaVO> qnaList(String id);
	public int totalCount();
	public List<QnaVO> qnaListCustomer(QnaVO vo);
	public List<QnaVO> qnaListSeller(QnaVO vo);
	public List<WishVO> wishList(String id);
	public List<OrdersVO> orderList(String id);
	public boolean deleteOrder(int orderNo);
	public List<DeliveryVO> orderDetail(String id);
	
	public List<MemberVO> memberList(int page);
	public int memberCount();

	public List<OrdersVO> orderNoList(String orderNo);
	public List<OrderDetailVO> myCart(int memberNo);
	public CompanyVO companyInfo(String id);
	public boolean updateMemberCo(CompanyVO vo);
	public boolean updateCart(OrderDetailVO vo);
	public boolean deleteCart(int orderDetailNo);
	public List<BoardVO> orderProdList(int memberNo);
	public boolean delMember(int memberNo);
	public boolean updateQna(QnaVO vo);
	public boolean changeDeli(int orderNo);
	public boolean changeDeli2(int orderNo);
}
