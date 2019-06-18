package come.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.PaymentVO;
import come.team.domain.ReviewPageDTO;
import come.team.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(@Param("criteria") Criteria criteria, @Param("productCode") String productCode);
	public int countAllReview(String productCode);
	
	public ReviewPageDTO getReviewListPage(Criteria criteria, String productCode);

	public void registerReview(ReviewVO reviewVO);
	
	public ReviewVO getReview(int reviewNo);
	public void modifyReview(ReviewVO reviewVO);
	public void deleteReview(@Param("reviewNo") int reviewNo, @Param("id") String id);
	
	public PaymentVO checkPayment(@Param("id") String id, @Param("productCode") String productCode);

}
