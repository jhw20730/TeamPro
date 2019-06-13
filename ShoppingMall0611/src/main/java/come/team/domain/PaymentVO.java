package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	String payCode;
	int cartNo;
	String id;
	String productCode;
	int amount;
	String address;
	Date payDate;
	String contact;

}
