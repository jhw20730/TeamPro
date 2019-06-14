package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNo;
	private String id;
	private String title;
	private String content;
	private Date noticeDate;

}
