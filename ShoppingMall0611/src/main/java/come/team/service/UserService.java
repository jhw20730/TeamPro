package come.team.service;

import java.util.List;

import come.team.domain.UserVO;

public interface UserService {
	
	List<UserVO> list();    //전체 유저
	String findPasswordById(String id);    //로그인에 필요한 비밀번호 불러오기
	
	void join(UserVO vo); //회원 가입, 회원 정보 등록
}
