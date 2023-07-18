package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.MemberVO;
import com.tam.service.LoginService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login")
@Log4j
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	/* 로그인 페이지 이동 */
	@GetMapping("/loginPage")
	public void loginPageGET() {
		log.info("로그인 페이지 이동");
	}
	
	/* 로그인 */
	@PostMapping("/loginPage")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		log.info("로그인");
		
		HttpSession session = request.getSession();		// 세션 생성
		String rawPw = "";
		String encodePw ="";
		
		MemberVO lvo = loginService.memberLogin(member);
		log.info("" + lvo);
		
		if(lvo != null) {	// 일치하지 않는 아이디, 비밀번호 입력 경우
			rawPw = member.getPw(); 	// 사용자가 제출한 비밀번호
			encodePw = lvo.getPw(); 	// db에 저장된 암호화(인코딩)된 비밀번호
				
			if(true == pwEncoder.matches(rawPw, encodePw)) {	// 비밀번호 일치
				lvo.setPw("");
				session.setAttribute("member", lvo);
				return "redirect:/";	// 메인 페이지로 돌아감
			}else {	// 비밀번호 불일치
				rttr.addFlashAttribute("result", 0);
				return "redirect:/login/loginPage";		// 로그인 페이지로 돌아감
			}
				
		}else { //일치하는 아이디가 없을때 로그인 실패 시
			rttr.addFlashAttribute("result", 0);
			return "redirect:/login/loginPage"; //로그인 페이지로 이동
		}
	}
	
	/* 로그아웃 */
	@GetMapping("/logout.do")
    public String logoutGET(HttpServletRequest request) throws Exception{     
        log.info("로그아웃");
        
        HttpSession session = request.getSession();  
        session.invalidate();	// 세션 삭제
        
        return "redirect:/";
	}

}
