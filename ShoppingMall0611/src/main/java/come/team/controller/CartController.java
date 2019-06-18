package come.team.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import come.team.domain.CartVO;
import come.team.domain.Criteria;
import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentVO;
import come.team.domain.ProductVO;
import come.team.service.CartService;
import come.team.service.OrderService;
import come.team.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private CartService cartService;
	private ProductService productService;
	private OrderService orderService;
	
	@PostMapping("/addCart")
	public String addCart(CartVO cart) {
		log.info("addCart start");
		cartService.addCart(cart);
		log.info("addCart finish");
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("/cartList")
	public void getCartList(Model model, Criteria criteria, Principal principal) {
		log.info("get cartList");
		String id = principal.getName();
		List<CartVO> cartList = cartService.getCartList(id);
		
		for(int i=0; i<cartList.size(); i++) {
			ProductVO productVO = productService.productView(cartList.get(i).getProductCode());
			cartList.get(i).setProductName(productVO.getProductName());
			cartList.get(i).setDescription(productVO.getDescription());
			cartList.get(i).setPrice(productVO.getPrice());
		}
		model.addAttribute("cart", cartList);
	}
	
	// 카트 삭제
	@ResponseBody
	@PostMapping(value = "/deleteCart")
	public void deleteCart(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		log.info("delete cart");

		int cartNo = 0;

		for (String i : chArr) {
			CartVO cart = new CartVO();
			cartNo = Integer.parseInt(i);
			cart.setCartNo(cartNo);
			cartService.deleteCart(cart);
			}
	}
		
	@GetMapping(value = "/cartList/json",
			produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CartVO>> getReviewList(Principal principal, Model model){
		String id = principal.getName();

		List<CartVO> cartList = cartService.getCartList(id);

		for (int i = 0; i < cartList.size(); i++) {
			ProductVO productVO = productService.productView(cartList.get(i).getProductCode());
			cartList.get(i).setProductName(productVO.getProductName());
			cartList.get(i).setDescription(productVO.getDescription());
			cartList.get(i).setPrice(productVO.getPrice());
		}
				
		return new ResponseEntity<List<CartVO>>(cartList, HttpStatus.OK);
	}
	
	@PostMapping("/orderInput")
	public String orderInput(PaymentVO payment, PaymentDetailVO paymentDetail) {
		log.info("start orderInput");
		orderService.orderInput(payment);
		
		/*orderService.orderDetailInput(paymentDetail);*/
		log.info("finish orderInput");
		return "redirect:/";  // 주문 내역 확인 페이지로 이동
				
	}
}
