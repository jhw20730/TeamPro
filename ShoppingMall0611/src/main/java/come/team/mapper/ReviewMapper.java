package come.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.PaymentVO;
import come.team.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> getReviewList(@Param("criteria") Criteria criteria, @Param("productCode") String productCode);
	public int countAllReview(String productCode);
	
	public void registerReview(ReviewVO reviewVO);
//	public int modifyReview(ReviewVO reviewVO);
//	public int deleteReview(String reviewNo);
	
	public PaymentVO checkPayment(@Param("id") String id, @Param("productCode") String productCode);
}
