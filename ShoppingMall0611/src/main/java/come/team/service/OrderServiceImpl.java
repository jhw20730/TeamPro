package come.team.service;

import org.springframework.stereotype.Service;

import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentVO;
import come.team.mapper.OrderMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper mapper;
	
	@Override
	public void orderInput(PaymentVO payment) { //주문 정보에 넣기
		mapper.orderInput(payment);		
	}

	@Override
	public void orderDetailInput(PaymentDetailVO paymentDetail) {
		mapper.orderDetailInput(paymentDetail);
		
	}

}
