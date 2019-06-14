package come.team.service;

import java.util.List;

import come.team.domain.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> list();
	
	public NoticeVO view(int noticeNo);
	
	public void insert(NoticeVO vo);
	
	public void update(NoticeVO vo);
	
	public void delete(int noticeNo);

}
