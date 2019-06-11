package come.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.ProductVO;
import come.team.domain.ReviewPageDTO;
import come.team.domain.ReviewVO;

public interface ReviewService {
	
	List<ReviewVO> getReviewList(@Param("criteria") Criteria criteria, @Param("productCode") String productCode);
	int countAllReview(String productCode);
	
	public ReviewPageDTO getReviewListPage(Criteria criteria, String productCode);

//	public int registerReview(ReviewVO reviewVO);
//	public int modifyReview(ReviewVO reviewVO);
//	public int deleteReview(String reviewNo);

}
