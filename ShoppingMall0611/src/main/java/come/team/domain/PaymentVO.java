package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	int payNo;
	int cartNo;
	String id;
	String productCode;
	String name;
	int amount;
	String address;
	Date payDate;
	String contact;

}
