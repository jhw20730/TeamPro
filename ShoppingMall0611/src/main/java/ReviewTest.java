import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import come.team.domain.PaymentVO;
import come.team.mapper.ReviewMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewTest {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	@Test
	public void getReviewTest() {
		PaymentVO vo = reviewMapper.checkPayment("member123", "a12");
		log.info(vo);
	}

}
