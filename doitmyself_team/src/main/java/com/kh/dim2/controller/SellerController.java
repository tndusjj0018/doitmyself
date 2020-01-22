package com.kh.dim2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.SellerService;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Controller  
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value = "/seller")
	public ModelAndView seller(String doc, ModelAndView mv) {
		if(doc == null) {
			doc = "seller_info";
		}
		mv.addObject("doc",doc);
		mv.setViewName("seller/seller_nav");
		return mv;
	}
	
	// ## 판매자 정보 보기 ##
	@ResponseBody
	//@ResponseBody가 붙은 메서드에서 Map을 반환하면 자동으로 
	//Map 정보가 JSON 객체로 변환되어 전송됩니다.	
	@RequestMapping(value="/sellerInfo")
	public List<Seller> SellerInfo(@RequestParam("id")String id) {
		List<Seller> list = sellerService.sellerInfo(id);
		
		return list;
	}
	
	// ## 판매자 정보 수정 ##
	@RequestMapping(value="/sellerInfoUpdate", method=RequestMethod.POST)
	public void sellerInfoupdate(Seller s,
						HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = sellerService.infoUpdate(s);
		
		out.println("<script>");
		if(result == 1) {
			System.out.println("sellerInfoUpdate() 회원정보 수정성공 : " + result);
			out.println("alert('수정되었습니다');");
			out.println("location.href='seller?doc=seller_info';");
		}else {
			System.out.println("sellerInfoUpdate() 회원정보 수정실패 : " + result);
			out.println("alert('회원 정보 수정에 실패했습니다.');");			
			// out.println("location.href='join.net';");// 새로고침되어 이전에
			out.println("history.back()");// 비밀번호를 제외한 다른 데이터는 유지되어
		}
		out.println("</script>");
		out.close();
	}
	
	// ## 상품등록 ##
	
	// ## 카테고리 불러오기 ##
	@ResponseBody
	@RequestMapping(value="/productCategory")
	public List<Category> productCategory() {
		List<Category> list = sellerService.productCategory();
		
		return list;
	}
	
	// ## 서브카테고리 불러오기 ##
	@ResponseBody
	@RequestMapping(value="/productSubCategory")
	public List<SubCategory> productSubCategory(@RequestParam("c_no")int c_no) {
		List<SubCategory> list = sellerService.productSubCategory(c_no);
		
		return list;
	}
	
	// ## 상품등록 ck에디터 이미지 upload ##
	@RequestMapping("insertImage")
    public void insertImage(HttpServletRequest request, HttpServletResponse response,
            		MultipartFile upload) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        System.out.println("insertImage()");
        //업로드한 파일 이름
        String fileName=upload.getOriginalFilename();
 
        //파일을 바이트 배열로 변환
        byte[] bytes=upload.getBytes();
 
        //파일 이름 변경
        // 난수를 구합니다.(랜덤)
		Random r = new Random();
		int random = r.nextInt(100000000);
		String refileName = random + fileName;
		System.out.println("refileName = " + refileName);
        
        //이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
        String uploadPath=
        	"C:\\Users\\user1\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\upload\\";
        	//"D:\\workspace-sts\\Spring6_MVC_ATTATCH2\\src\\main\\webapp\\resources\\upload\\";
        OutputStream out = new FileOutputStream(new File(uploadPath + refileName));
 
        //서버로 업로드
        out.write(bytes);
        //클라이언트에 결과 표시
        String callback=request.getParameter("CKEditorFuncNum");
 
        //서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();   
        
        String fileUrl= "resources/upload/" + refileName;
        
        printWriter.println(
        		"<script>setTimeout(function(){window.parent.CKEDITOR.tools.callFunction("
        		+ callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')},2300);"
        		+"</script>");
        printWriter.flush();
    }
 
	// ## 상품등록 ##
	@RequestMapping(value="/ProductAddAction", method=RequestMethod.POST)
	public void productAddAction(Product product, HttpServletRequest request, HttpServletResponse response)
							throws Exception{
		//set에 저장된 uploadfile을 가져옴
		MultipartFile uploadfile = product.getUploadfile();
		String fileName = uploadfile.getOriginalFilename();
		
//		if(!uploadfile.isEmpty()) {
//			String fileName = uploadfile.getOriginalFilename();//원래 파일명
//			product.setP_IMG(fileName);//원래 파일명 저장
//		}
		
		String saveFolder = "C:\\Users\\user1\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\upload\\";
		
		// 난수를 구합니다.(랜덤)
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		//새로운 파일명
		String refileName = random + fileName;
		
		//오라클 디비에 저장될 파일 명
		// transferTo(file path) : 업로드한 파일을 매개변수의 경로에 지정합니다.
		uploadfile.transferTo(new File(saveFolder + refileName));
		
		//바뀐 파일명으로 저장
		product.setP_IMG(refileName);
		System.out.println("refileName = " + refileName);
		
		sellerService.insertProduct(product);
		System.out.println(product.getP_DESCRIPTION());
		
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('상품등록 완료')");
		out.println("location.href='seller?doc=product'");
		out.println("</script>");
		out.close();
	}
	
}
	

