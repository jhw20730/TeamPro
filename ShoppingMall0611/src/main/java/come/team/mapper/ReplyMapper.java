package come.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> getReplyList();
	public int getReplyNum();
	public ReplyVO getReplyView(int replyNo);
	public List<ReplyVO> getReplyListByInquiryNo(int inquiryNo);
		
	public void registerReplyInquiry(ReplyVO replyVO);

}
