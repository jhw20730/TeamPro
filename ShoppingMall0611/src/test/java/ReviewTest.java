
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import come.team.domain.ReviewVO;
import come.team.service.ReviewService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewTest {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	@Test
	public void reviewTest() {
//		Criteria criteria = new Criteria();
//		log.info(reviewService.getReviewListPage(criteria, "b12"));
		
//		ReviewVO reviewVO = reviewService.getReview(22);
//		log.info(reviewVO);
//		reviewVO.setContent("수정된 리뷰");
//		reviewService.modifyReview(reviewVO);
//		log.info(reviewService.getReview(22));
		
//		reviewService.deleteReview(22);
		
	}
}
