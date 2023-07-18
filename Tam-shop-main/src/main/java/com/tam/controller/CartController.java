package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tam.model.CartVO;
import com.tam.model.MemberVO;
import com.tam.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	/* 장바구니 페이지 이동 */
	@GetMapping("/{id}")
	public String cartPageGET(@PathVariable("id") String id, Model model) {
		log.info("장바구니 페이지 이동");
		
		model.addAttribute("cartInfo", cartService.getCartList(id));
		System.out.println(cartService.getCartList(id));
		return "/cart/cartPage";
	}
	
	/* 장바구니 추가 */
	@PostMapping("/add")
	@ResponseBody
	public String addCartPOST(CartVO cart, HttpServletRequest request) {
		//로그인체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		System.out.println(cart);
		//카트 등록
		int result = cartService.addCart(cart);
		return result + "";
	}
	
	//장바구니 수량 수정
	@PostMapping("/update")
	public String updateCartPOST(CartVO cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getId();
		
	}
	
	//삭제
	@PostMapping("/delete")
	public String deleteCartPOST(CartVO cart) {
		
		cartService.deleteCart(cart.getCartNum());
		
		return "redirect:/cart/" + cart.getId();
	}

}
