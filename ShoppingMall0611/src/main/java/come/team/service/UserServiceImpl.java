package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.UserVO;
import come.team.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public List<UserVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findPasswordById(String id) {
		UserVO vo = mapper.user(id);
		return vo.getPassword();
	}

	@Override
	public void join(UserVO vo) { //회원가입
		mapper.join(vo);
	}

}
