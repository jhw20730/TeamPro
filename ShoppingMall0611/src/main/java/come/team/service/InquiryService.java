package come.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.domain.ReplyVO;

public interface InquiryService {

	public List<InquiryVO> getInquiryList(Criteria criteria);
	
	public int getInquiryNum();
	
	public InquiryVO getInquiryView(int inquiryNo);
	
	public void registerInquiry(InquiryVO inquiryVO);	//게시물 작성
	
	public void deleteInquiry();
	
}
