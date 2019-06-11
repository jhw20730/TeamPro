package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	int reviewNo;
	int cartNo;
	String productCode;
	String payCode;
	String id;
	String name;
	String content;
	int reviewPoint;
	Date reviewDate;
}
