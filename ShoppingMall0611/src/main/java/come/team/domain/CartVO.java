package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String productCode;
	private String id;
	private int amount;
	private String productName;
	
	//added
	private	int price;
	private	Date addDate;
}
