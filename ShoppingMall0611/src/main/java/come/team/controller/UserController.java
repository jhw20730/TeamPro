package come.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import come.team.domain.UserVO;
import come.team.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {
	
	private UserService service;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@GetMapping("/index")
	public void index() {
		
	}
	
	@GetMapping("/join")
	public void join() throws Exception{
		log.info("get join");
	}
	
	@PostMapping("/join") //회원가입하고 로그인폼으로 이동
	public String join(UserVO vo) throws Exception{
		log.info("post join");
		
		String inputPass = vo.getPassword();
		String pass = passEncoder.encode(inputPass);
		vo.setPassword(pass);
		
		service.join(vo);
		
		log.info("UserVO: " + vo);
		
		return "redirect:/";	
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied: " + auth);
		
		model.addAttribute("msg", "access denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "login error check your account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout!!");
		}
	
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("logout");
	}
	
	@PostMapping("customLogout")
	public void logoutPost() {
		log.info("post logout");
	}
	
	
}
