package com.tam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.PageDTO;
import com.tam.model.ProductVO;
import com.tam.service.CategoryService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/category")
@Log4j
public class CategoryController {
   
   @Autowired
   private CategoryService cateService;
   
   /* 상품 전체조회 페이지 이동 */
   @GetMapping("/cosmeticMain")
   public void cosmeticMainGET(Model model, Criteria cri) {
      log.info("상품 카테고리 페이지 이동");
      
      List<CateVO> cateAll = cateService.getCateList();         // 카테고리 정보
      model.addAttribute("cateAll", cateAll); 
      
      List<ProductVO> prodAll = cateService.getProdList(cri);      // 상품 정보
      
      if(!prodAll.isEmpty()) {   // 상품목록이 존재
         model.addAttribute("prodAll", prodAll);
      }else {
         model.addAttribute("prodCheck", "empty");
      }
      
      model.addAttribute("pageMaker", new PageDTO(cri, cateService.getProdTotal(cri)));
   }
   
   /* 상품 카테고리 조회 */
   @GetMapping("/cosmeticMain/{cateCode}")
   public String cosmenticCateGET(@PathVariable("cateCode") String cateCode, Model model, Criteria cri) {
	   
	   List<CateVO> cateAll = cateService.getCateList();         // 카테고리 정보
	   model.addAttribute("cateAll", cateAll); 
	   
	   cri.setKeyword(cateCode);
	   String[] type = new String[1];
	   type[0] = "C";
	   cri.setTypeArr(type);
	   
	   List<ProductVO> prodAll = cateService.getCateProd(cri);      // 상품 정보
	      
	      if(!prodAll.isEmpty()) {   // 상품목록이 존재
	         model.addAttribute("prodAll", prodAll);
	      }else {
	         model.addAttribute("prodCheck", "empty");
	      }
	      
	      model.addAttribute("pageMaker", new PageDTO(cri, cateService.getProdTotal(cri)));
	      
	      return "/category/cosmeticMain";
   }
}