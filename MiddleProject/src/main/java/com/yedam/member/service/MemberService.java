package com.yedam.member.service;

import java.util.List;

import com.yedam.member.domain.DeliveryVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.domain.OrdersVO;
import com.yedam.member.domain.WishVO;
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
	public List<QnaVO> qnaList(int page);
	public List<WishVO> wishList(String id);
	public List<OrdersVO> orderList(String id);
	public boolean deleteOrder(int orderNo);
	public List<DeliveryVO> orderDetail(String id);
	
	
}
