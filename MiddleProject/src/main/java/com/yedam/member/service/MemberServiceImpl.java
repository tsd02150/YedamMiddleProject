package com.yedam.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.domain.CompanyVO;
import com.yedam.member.domain.DeliveryVO;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.domain.OrderDetailVO;
import com.yedam.member.domain.OrdersVO;
import com.yedam.member.domain.WishVO;
import com.yedam.member.mapper.MemberMapper;
import com.yedam.product.domain.BoardVO;
import com.yedam.product.domain.QnaVO;

public class MemberServiceImpl implements MemberService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	@Override
	public boolean addMember(MemberVO vo) {
		return mapper.insertMember(vo)>0;
	}
	@Override
	public boolean modifyMember(MemberVO vo) {
		return mapper.updateMember(vo)>0;
	}
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return mapper.loginCheck(vo);
	}
	@Override
	public MemberVO memberInfo(String id) {
		return mapper.memberInfo(id);
	}
	@Override
	public String searchId(MemberVO vo) {
		return mapper.searchId(vo);
	}
	@Override
	public String searchPw(MemberVO vo) {
		return mapper.searchPw(vo);
	}
	@Override
	public boolean updateMemberM(MemberVO vo) {
		return mapper.updateMemberM(vo)>0;
	}
	@Override
	public List<QnaVO> qnaList(String id) {
		return mapper.qnaList(id);
	}
	@Override
	public int totalCount() {
		return mapper.getCount();
	}
	@Override
	public List<QnaVO> qnaListCustomer(QnaVO vo) {
		return mapper.qnaListCustomer(vo);
	}
	@Override
	public List<QnaVO> qnaListSeller(QnaVO vo) {
		return mapper.qnaListSeller(vo);
	}
	@Override
	public List<WishVO> wishList(String id) {
		return mapper.wishList(id);
	}
	@Override
	public List<OrdersVO> orderList(String id) {
		return mapper.orderList(id);
	}
	@Override
	public boolean deleteOrder(int orderNo) {
		return (mapper.deleteOrder(orderNo)>0)&&(mapper.deleteOrderDetail(orderNo)>0);
	}
	@Override
	public List<DeliveryVO> orderDetail(String id) {
		return mapper.orderDetail(id);
	}
	
	
	@Override
	public List<MemberVO> memberList(int page) {
		return mapper.memberList(page);
	}
	@Override
	public int memberCount() {
		return mapper.memberCount();
	}
	@Override
	public List<OrdersVO> orderNoList(String orderNo) {
		return mapper.orderNoList(orderNo);
	}
	@Override
	public List<OrderDetailVO> myCart(int memberNo) {
		return mapper.myCart(memberNo);
	}

	@Override
	public CompanyVO companyInfo(String id) {
		return mapper.companyInfo(id);
	}
	@Override
	public boolean updateMemberCo(CompanyVO vo) {
		return mapper.updateMemberCo(vo)>0;
	}
	@Override
	public List<BoardVO> orderProdList(int memberNo) {
		return mapper.orderProdList(memberNo);
	}
	@Override
	public boolean delMember(int memberNo) {
		return mapper.deleteMember(memberNo)==1;
	}
	@Override
	public boolean updateCart(OrderDetailVO vo) {
		return mapper.updateCart(vo)>0;
	}
	@Override
	public boolean deleteCart(int orderDetailNo) {
		return mapper.deleteCart(orderDetailNo)>0;		
	}
	@Override
	public boolean updateQna(QnaVO vo) {
		return mapper.updateQna(vo)>0;
	}
	
	@Override
	public boolean changeDeli(int orderNo) {
		return mapper.changeDeli(orderNo)>0;
	}
	@Override
	public boolean changeDeli2(int orderNo) {
		return mapper.changeDeli2(orderNo)>0;
	}
	
	
}
