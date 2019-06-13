package come.team.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.domain.MemberVO;
import come.team.domain.PageDTO;
import come.team.domain.ReplyVO;
import come.team.service.InquiryService;
import come.team.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/inquiry")
public class InquiryController {
	
	private InquiryService inquiryService;
	private ReplyService replyService;
	
	@GetMapping("/list")
	public void getInquiryList(Criteria criteria, Model model) {
		
		List<InquiryVO> inquiry = inquiryService.getInquiryList(criteria);
		model.addAttribute("inquiry", inquiry);
		
		List<ReplyVO> reply = replyService.getReplyList();
		model.addAttribute("reply", reply);
		
		
		int total = inquiryService.getInquiryNum() + replyService.getReplyNum();
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
	}
	
	@GetMapping("/view")
	public void getInquiryView(int inquiryNo, Model model) {
		
		model.addAttribute("inquiry", inquiryService.getInquiryView(inquiryNo));
		model.addAttribute("reply", replyService.getReplyListByInquiryNo(inquiryNo));
		
	}
	
	// 문의사항 작성 페이지로 매핑
	@GetMapping("/registerForm")
	public void getRegisterInquiry() {
		log.warn("get registerForm");
	}
	
	// 문의사항 작성
	@PostMapping("/register")
	public String registerInquiry(InquiryVO inquiryVO) {
		log.info("register start");
		log.info("제목: " + inquiryVO.getTitle());		
		log.info("작성자: " + inquiryVO.getName());
		log.info("내용: " + inquiryVO.getContent());
		
		inquiryService.registerInquiry(inquiryVO);
		log.info("register finish");
		return "redirect:/inquiry/list";
	}
	
	@DeleteMapping("/delete")
	public void deleteInquiry() {
		
	}

}