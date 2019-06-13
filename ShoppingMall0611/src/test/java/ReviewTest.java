
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import come.team.domain.Criteria;
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
		Criteria criteria = new Criteria();
		log.info(reviewService.getReviewListPage(criteria, "b12"));
		
	}
}
