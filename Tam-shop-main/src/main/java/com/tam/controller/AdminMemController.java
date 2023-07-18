package com.tam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.Criteria;
import com.tam.model.PageMakerDTO;
import com.tam.service.AdminMemService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminMember")
public class AdminMemController {
	
	@Autowired
	private AdminMemService aservice;

	@GetMapping("/memberList")
	public void memberListGET(Model model, Criteria cri) {
		log.info("유저 리스트 이동");

		model.addAttribute("list", aservice.getListPaging(cri));
		int total = aservice.getTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);		
		model.addAttribute("pageMaker", pageMake);
	}

}