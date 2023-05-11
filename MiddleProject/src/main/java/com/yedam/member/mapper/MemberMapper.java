package com.yedam.member.mapper;

import java.util.List;

import com.yedam.member.domain.DeliveryVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.domain.OrderDetailVO;
import com.yedam.member.domain.OrdersVO;
import com.yedam.member.domain.WishVO;
import com.yedam.product.domain.QnaVO;

public interface MemberMapper {
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberInfo(String id);
	public String searchId(MemberVO vo);
	public String searchPw(MemberVO vo);
	public int updateMemberM(MemberVO vo);
	public List<QnaVO> qnaList(String id);
	public List<QnaVO> qnaWithPage(int page);
	public int getCount();
	public List<WishVO> wishList(String id);
	public List<OrdersVO> orderList(String id);
	public int deleteOrder(int orderNo);
	public int deleteOrderDetail(int orderNo);
	public List<DeliveryVO> orderDetail(String id);
	public List<MemberVO> memberList();
	public List<OrdersVO> orderNoList(String orderNo);
	public List<OrderDetailVO> myCart(int memberNo);
}
