package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	
	int inquiryNo;
	String id;
	String name;
	String title;
	String content;
	Date inquiryDate;

}
