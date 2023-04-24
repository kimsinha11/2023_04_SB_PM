package com.KoreaIT.ksh.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.ksh.demo.vo.Article;
import com.KoreaIT.ksh.demo.vo.Member;

@Mapper
public interface MemberRepository {

	
	public int getLastInsertId();


	public void doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);


	public Member getMemberById(int id);


	public Member getMemberByLoginId(String loginId);


	public Member getMemberByNameAndEmail(String name, String email);
}