package come.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.domain.ReplyVO;

public interface InquiryMapper {
	
	public List<InquiryVO> getInquiryList(Criteria criteria);
	
	public int getInquiryNum();
	
	public InquiryVO getInquiryView(int inquiryNo);
	
	public void registerInquiry(InquiryVO inquiryVO);
	
	public void deleteInquiry(int inquiryNo);		//게시글 삭제
	
	public void modifyInquiry(InquiryVO inquiryVO);		//게시글 수정

}
