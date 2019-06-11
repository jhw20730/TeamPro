package come.team.mapper;

import java.util.List;

import come.team.domain.UserVO;


public interface UserMapper {
	
	public List<UserVO> list();    //전체 User의 데이터 리스트
	public UserVO user(String id);        //ID에 해당하는 User 데이터 읽기
	public void join(UserVO vo);        //user 테이블 안에 UserVO 데이터를 삽입
	public int update(UserVO vo);        //user 테이블 안에 UserVO 데이터를 수정
	public int delete(String id);        //ID에 해당하는 User 데이터 삭제
	public UserVO read(String id); //로그인...

}
