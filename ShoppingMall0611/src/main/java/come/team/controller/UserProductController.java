package come.team.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.Criteria;
import come.team.domain.PageDTO;
import come.team.domain.ProductVO;
import come.team.domain.ReviewVO;
import come.team.service.ProductService;
import come.team.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/product")
public class UserProductController {
	
	private ProductService productService;
	//private CartService cartservice;
	private ReviewService reviewService;
	
	@GetMapping("/list")
	public void list(Criteria criteria, Model model) {
		
		criteria.setAmount(10);
		
		log.info("list: " + criteria);
		
		model.addAttribute("list", productService.findPagingList(criteria));
		
		int total = productService.countAll(criteria);
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
	}
	
	@GetMapping("/view")
	public void view(String productCode, Model model) {
	
		ProductVO productVO = productService.productView(productCode);
		Criteria criteria = new Criteria(1, 10);
		List<ReviewVO> reviewList = reviewService.getReviewList(criteria, productCode);
		model.addAttribute("board", productVO);
		model.addAttribute("review", reviewList);	
	}
	
	//카트담기
	@PreAuthorize("hasRole{'ROLE_MEMBER'}") //로그인한 멤버만 가능하게끔
	@GetMapping("/view/addcart")
	public void addCart() {
		
	}
	
	
}
