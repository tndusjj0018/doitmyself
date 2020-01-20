package com.kh.dim2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

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
 
        //이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
        String uploadPath=
        	"C:\\Users\\user1\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\upload\\";
        	//"D:\\workspace-sts\\Spring6_MVC_ATTATCH2\\src\\main\\webapp\\resources\\upload\\";
        OutputStream out = new FileOutputStream(new File(uploadPath+fileName));
 
        //서버로 업로드
        out.write(bytes);
        //클라이언트에 결과 표시
        String callback=request.getParameter("CKEditorFuncNum");
 
        //서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();
 
        String fileUrl=
                    request.getContextPath() + "/resources/upload/" + fileName;
 
        printWriter.println(
        		"<script>window.parent.CKEDITOR.tools.callFunction("
        		+ callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')"
        		+"</script>");
        printWriter.flush();
    }
 
}
	
	// ## 상품등록 ##


