package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.MemberVO;
import come.team.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findPasswordById(String id) {
		MemberVO vo = mapper.getMember(id);
		return vo.getPassword();
	}

	@Override
	public void join(MemberVO vo) { //회원가입
		mapper.join(vo);
	}

	@Override
	public MemberVO getMember(String id) {
		return mapper.getMember(id);
	}

	@Override
	public void update(MemberVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(String id) {// 회원탈퇴
		mapper.delete(id);
	}

}
