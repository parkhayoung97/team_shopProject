package com.tam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.Criteria;
import com.tam.model.OrderVO;
import com.tam.model.PageMakerDTO;
import com.tam.service.AdminOrderService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminOrder")
@Log4j
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService aoService;
	
	// 주문 목록 페이지 이동
	@GetMapping("/orderList")
	public void adminOrderListGET(Model model,Criteria cri) {		
		log.info("주문 목록 페이지 이동");
		
		model.addAttribute("olist", aoService.pagingList(cri));
		int total = aoService.searchOrder(cri);
		PageMakerDTO pDto = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pDto);

	}
	
	// 주문 상세 페이지
	@GetMapping("/orderDetail")
	public void adminOrderDetailGET(int orderNum, Model model, RedirectAttributes rttr) {
		log.info("주문 목록 상세 페이지 진입");
		model.addAttribute("olist", aoService.readOrder(orderNum));
		rttr.addFlashAttribute("result", "조회 성공"); 
	}
	
	// 주문 상태 수정
	@PostMapping("/orderUpdate")
	public String adminOrderUpdatePOST(OrderVO oVo, RedirectAttributes rttr) {
		log.info("update 시작");
		aoService.updateOrder(oVo);
		log.info(oVo.getOrderStatus());
		rttr.addFlashAttribute("result", "수정 성공");
		
		return "redirect:/adminOrder/orderList";
	}

}
