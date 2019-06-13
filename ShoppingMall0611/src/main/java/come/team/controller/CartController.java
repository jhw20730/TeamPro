package come.team.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import come.team.domain.CartVO;
import come.team.domain.Criteria;
import come.team.domain.ProductVO;
import come.team.service.CartService;
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
}
