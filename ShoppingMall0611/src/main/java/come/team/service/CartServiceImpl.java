package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.CartVO;
import come.team.mapper.CartMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_=@Autowired)
	private CartMapper mapper;

	@Override
	public void addCart(CartVO cart) {
		mapper.addCart(cart);
	}

	@Override
	public List<CartVO> getCartList(String id) {
		return mapper.getCartList(id);
	}

	@Override
	public void deleteCart(CartVO cart) {
		mapper.deleteCart(cart);
	}

}
