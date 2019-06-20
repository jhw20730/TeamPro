package come.team.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String contact;
	private String email;
	private int point;
	private Date regiDate;
	private Date updateDate;
	private boolean enabled;
	private List<AuthVO> authList;
}
