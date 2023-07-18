package com.tam.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.CateVO;
import com.tam.model.Criteria;
import com.tam.model.PageMakerDTO;
import com.tam.model.ProductVO;
import com.tam.service.AdminProdService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/adminProd")
@Log4j
public class AdminProdController {
	
	@Autowired
	private AdminProdService apService;
	
	/* 관리자 메인 페이지 이동 */
//	@GetMapping("/main")
//	public void mainPageGET(Model model) {
//		log.info("관리자 메인 페이지 이동");
//	}
	
	/* 상품 목록 페이지 이동 + 페이징 */
	@GetMapping("/list")
	public void adminListGET(Model model, Criteria cri) {
		log.info("상품 목록 페이지 진입");
		model.addAttribute("list", apService.pagingList(cri));
		int total = apService.searchProd(cri);
		PageMakerDTO pDto = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pDto);
	}
	
	/* 상품 등록 페이지 이동 */
	@GetMapping("/create")
	public void adminCreateGET(Model model) {
		log.info("상품 등록 페이지 이동");
		
		List<CateVO> cateList = apService.getCateList();
		model.addAttribute("cateList", cateList);
	}
	
	/* 상품 등록 */
	@PostMapping("/create")
	public String adminCreatePOST(ProductVO pVo, RedirectAttributes rttr) {
		log.info("ProductVO : "+pVo);
		
		apService.createProd(pVo);
		rttr.addFlashAttribute("result", "등록 성공");
		
		return "redirect:/adminProd/list";
	}
	
	/* 상품 이미지 파일 업로드 */
	@PostMapping("/uploadAjaxAction/{imgNum}")
	public void uploadAjaxActionPOST(@PathVariable("imgNum") int imgNum, MultipartFile uploadFile) {
		log.info("이미지 파일 업로드");
		
//		log.info("파일 이름 : " + uploadFile.getOriginalFilename());
//		log.info("파일 타입 : " + uploadFile.getContentType());
//		log.info("파일 크기 : " + uploadFile.getSize());
		
		String uploadFolder = null;		// 파일 경로
		String uploadFileName = null;	// 파일 이름
		File saveFile = null;			// File 객체
		
		if(imgNum == 1) {
			uploadFolder = "C:\\mySpring\\tam\\src\\main\\webapp\\resources\\image_1";
		}else if(imgNum == 2) {
			uploadFolder = "C:\\mySpring\\tam\\src\\main\\webapp\\resources\\image_2";
		}else if(imgNum == 3) {
			uploadFolder = "C:\\mySpring\\tam\\src\\main\\webapp\\resources\\image_3";
		}
		
		uploadFileName = uploadFile.getOriginalFilename();
		saveFile = new File(uploadFolder, uploadFileName);
		
		// 파일 저장
		try {
			uploadFile.transferTo(saveFile);
			
			// 썸네일 생성
			File thumbnailFile = new File(uploadFolder, "s_" + uploadFileName);	
			
			BufferedImage bo_image = ImageIO.read(saveFile);

			//비율 
			double ratio = 3;
			//넓이 높이
			int width = (int) (bo_image.getWidth() / ratio);
			int height = (int) (bo_image.getHeight() / ratio);							
			
			Thumbnails.of(saveFile)
	        .size(width, height)
	        .toFile(thumbnailFile);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품 조회
	@GetMapping("/read")
	public void adminReadGET(int pno, RedirectAttributes rttr, Model model) {
		log.info("상품 조회 페이지 진입");
		model.addAttribute("pageInfo", apService.readProd(pno));
		rttr.addFlashAttribute("result", "조회 성공");
	}
	
	//상품 수정					
	@GetMapping("/update")
	public void adminUpdateGET(int prodNum, Model model) {
		log.info("상품 목록 수정 페이지 진입");
		model.addAttribute("pageInfo", apService.readProd(prodNum));
	}
	
	@PostMapping("/update")
	public String adminUpdatePOST(ProductVO pVo, RedirectAttributes rttr) {
		apService.updateProd(pVo);		
		rttr.addFlashAttribute("result" ,"수정 성공");
		
		return "redirect:/adminProd/list";
	}
	
	//상품 삭제
	@PostMapping("/delete")
	public String adminDeleteGET(int prodNum, RedirectAttributes rttr) {
		apService.deleteProd(prodNum);
		rttr.addFlashAttribute("result", "삭제 성공");
		return "redirect:/adminProd/list";
	}

}
