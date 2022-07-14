package edu.kh.podo.admin.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberList();

	Map<String, Object> inquiryList(int cp);

}
