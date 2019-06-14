package come.team.controller;


import java.security.Principal;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import come.team.domain.Criteria;
import come.team.domain.MemberVO;
import come.team.domain.PaymentVO;
import come.team.domain.ReviewPageDTO;
import come.team.domain.ReviewVO;
import come.team.service.MemberService;
import come.team.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reviews/")
@RestController
@Log4j
@AllArgsConstructor
public class UserReviewController {
	
	private ReviewService reviewService;
	private MemberService memberService;
	
	@GetMapping(value = "/{productCode}/{page}",
		produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewPageDTO> getReviewList(@PathVariable("page") int page, 
												  @PathVariable("productCode") String productCode){
		Criteria criteria = new Criteria(page, 10);
		
		return new ResponseEntity<ReviewPageDTO>(reviewService.getReviewListPage(criteria, productCode), HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole{'ROLE_MEMBER'}")
	@PostMapping("/register")
	public void registerReview(Principal principal, ReviewVO reviewVO) {
		MemberVO memberVO = memberService.getMember(principal.getName());
		
		reviewVO.setId(memberVO.getId());
		reviewVO.setName(memberVO.getName());
		
		PaymentVO paymentVO = reviewService.checkPayment(reviewVO.getId(), reviewVO.getProductCode());
		
		reviewVO.setCartNo(paymentVO.getCartNo());
		reviewVO.setPayCode(paymentVO.getPayCode());
		
		reviewService.registerReview(reviewVO);
		log.info("registered " + reviewVO);

	}

}