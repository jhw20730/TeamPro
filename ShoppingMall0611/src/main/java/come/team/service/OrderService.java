package come.team.service;

import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentVO;

public interface OrderService {
	
	// 주문 정보에 넣기
	public void orderInput(PaymentVO payment);
	
	// 주문 상세 정보에 넣기
	public void orderDetailInput(PaymentDetailVO paymentDetail);
}
