package come.team.service;

import java.util.List;



import come.team.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> getReplyList();
	public int getReplyNum();
	public ReplyVO getReplyView(int replyNo);
	public List<ReplyVO> getReplyListByInquiryNo(int inquiryNo);
	public void registerReplyInquiry(ReplyVO replyVO);
		
}
