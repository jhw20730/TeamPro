package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDetailVO {
	
	int detailNo;
	String payCode;
	String id;
	String productCode;
	int amount;
	Date payDate;
	
	

}
