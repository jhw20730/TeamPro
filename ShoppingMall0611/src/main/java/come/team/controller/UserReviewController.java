package come.team.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import come.team.domain.Criteria;
import come.team.domain.ReviewPageDTO;
import come.team.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reviews/")
@RestController
@Log4j
@AllArgsConstructor
public class UserReviewController {
	
	private ReviewService reviewService;
	
	@GetMapping(value = "/{productCode}/{page}",
		produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewPageDTO> getReviewList(@PathVariable("page") int page, 
												  @PathVariable("productCode") String productCode){
		log.info("get Review list");
		Criteria criteria = new Criteria(page, 10);
		log.info(criteria);
		
		return new ResponseEntity<ReviewPageDTO>(reviewService.getReviewListPage(criteria, productCode), HttpStatus.OK);
	}

}