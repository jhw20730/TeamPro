package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	String payCode;
	String id;
	String name;
	int price;
	int amount;
	String productCode;
	String address;
	String contact;
	Date payDate;
	
	

}
