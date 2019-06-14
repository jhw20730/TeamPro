package come.team.mapper;

import java.util.List;

import come.team.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> getNoticeList();
	
	public NoticeVO getNoticeView(int noticeNo);
	
	public void registerNotice(NoticeVO vo);
	
	public void updateNotice(NoticeVO vo);
	
	public void deleteNotice(int noticeNo);

}
