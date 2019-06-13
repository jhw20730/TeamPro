package come.team.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String productCode;
	private String id;
	private int amount;
	
	//added
	private	String productName;
	private	int price;
	private	String description;
}
