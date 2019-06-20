package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentListVO {
	
	String payCode;
	String id;
	String name;
	int totalPrice;
	int price;
	int amount;
	String productCode;
	String address;
	String contact;
	Date payDate;
	String productName;
	
	int detailNo;
	
	
	

}
