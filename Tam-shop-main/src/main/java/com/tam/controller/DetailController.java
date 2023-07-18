package com.tam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.ProductVO;
import com.tam.service.ProdDetailService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/detail")
@Log4j
public class DetailController {
	
	@Autowired
	private ProdDetailService pdService;
	
	@GetMapping("/cosmeticDetail/{prodNum}")
	public String cosmeticDetailGET(@PathVariable("prodNum") int prodNum, Model model) {
		log.info("상품 상세페이지 이동");
		
		// 상품 번호로 상세정보 조회
		ProductVO prodDetail = pdService.getProdDetail(prodNum);
		log.info(prodDetail);
		
		// 상품 상세정보 데이터 전송
		model.addAttribute("prodDetail", prodDetail);
		return "/detail/cosmeticDetail";
	}

}
