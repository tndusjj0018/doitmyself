package com.kh.dim2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.SellerService;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Qna;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Controller  
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value = "/seller")
	   public ModelAndView seller(String doc, ModelAndView mv , HttpSession session) {
	      String seller = session.getAttribute("SELLER_RESULT").toString();

	      if(seller == null) {
	         mv.setViewName("main/login");
	         return mv;
	      }
	      
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
        		+ callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')},2500);"
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
		
		String p_description = product.getP_DESCRIPTION();
		if(p_description.equals("")) {
			product.setP_DESCRIPTION("상품설명을 등록해주세요.");
		}
		
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
	
	// ## 주문관리 주문리스트 ##
//	@ResponseBody
//	@PostMapping(value="OrderList")
//	public List<Order> OrderListAjax(@RequestParam("USER_ID")String USER_ID){
//		List<Order> list = sellerService.getOrderList(USER_ID);
//		return list;
//	}
	
	// ## 주문관리 주문리스트 + 페이징 ##
	@ResponseBody
	@PostMapping(value="OrderList")
	public Object OrderList(@RequestParam("USER_ID")String USER_ID,
							@RequestParam(value="limit", defaultValue="10", required=false)int limit,
							@RequestParam(value="page", defaultValue="1", required=false)int page,
							@RequestParam(value="viewSelect", required=false)String viewSelect,
							@RequestParam(value="search_field", defaultValue="-1", required=false)int index,
							@RequestParam(value="search_word", required=false)String search_word,
							@RequestParam(value="startDate", required=false)String startDate,
							@RequestParam(value="endDate", required=false)String endDate,
							@RequestParam(value="status", required=false)String status)throws Exception{
		//List<Order> list = sellerService.getOrderList(USER_ID);
		
		//총 리스트 수 
		int listcount = sellerService.getOrderListCount(USER_ID);
		System.out.println("listcount" + listcount);
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지 수 " + maxpage);
		
		//현재 페이지 그룹에서 맨 처음에 표시될 페이지 수 
		int startpage = ((page-1)/10) * 10+1;
		//현재 페이지에 보여줄 마지막 페이지 수 (10, 20 , 30 등)
		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Order> orderlist = sellerService.getOrderList(USER_ID, page, limit, viewSelect, index, search_word, startDate, endDate, status);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("orderlist", orderlist);
		map.put("limit",limit);
		
		return map;
	}
	
	//## 가게이름 가져옴 ##
	@ResponseBody
	@PostMapping(value="sellerName")
	public void SellerName(@RequestParam("USER_ID")String USER_ID,
							HttpServletResponse response) throws Exception {
		
		String sellerName = sellerService.getSellerName(USER_ID); 
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(sellerName);
	}
	
	//## 판매 관리 리스트 ##
	@ResponseBody
	@PostMapping(value="SaleList")
	public List<Product> SaleList(@RequestParam("USER_ID")String USER_ID,
								  @RequestParam("saleSelect")String saleSelect){
		List<Product> list = sellerService.SaleList(USER_ID, saleSelect);
		return list;
	}
	
	//## 상품 수정 페이지 ##
	@GetMapping(value="productInfo")
	public ModelAndView productInfo(@RequestParam("P_NO")int P_NO,
									ModelAndView mv) {
		Product p = sellerService.productInfo(P_NO);
		
		mv.setViewName("seller/seller_nav");
		mv.addObject("doc", "productUpdate");
		mv.addObject("p", p);
		
		return mv;
	}
	
	//## 상품 수정 ##
	@PostMapping(value="/ProductUpdate")
	public void ProductUpdate(Product product, HttpServletResponse response)throws Exception{
		
		MultipartFile uploadfile = product.getUploadfile();
		String saveFolder = "C:\\Users\\user1\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\upload\\";
		//파일이 변경된 경우
		if(uploadfile != null && !uploadfile.isEmpty()) {
			System.out.println("메인사진이 변경된 경우");
			String fileName = uploadfile.getOriginalFilename(); //원래 파일 명
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			//새로운 파일명
			String refileName = random + fileName;
			
			//오라클 디비에 저장될 파일 명
			// transferTo(file path) : 업로드한 파일을 매개변수의 경로에 지정합니다.
			uploadfile.transferTo(new File(saveFolder + refileName));
			
			//변경된 파일명으로 저장
			product.setP_IMG(refileName);			
		}else {// 메인사진 변경 안한경우
			System.out.println("uploadfile.isEmpty()");
			product.setP_IMG("");
		}
		
		int result = sellerService.productUpdate(product);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//수정 실패한 경우
		out.println("<script>");
		if(result == 0) {
			out.println("alert('상품수정 실패')");
			out.println("history.back()");
		}else {
			out.println("alert('상품수정 완료')");
			out.println("setTimeout(function(){location.href='seller?doc=seller_sale';}, 2000);");
		}
		out.println("</script>");
	}
	
	//## 상품 삭제 ##
	@GetMapping(value="/productDelete")
	public void productDelete(int P_NO, HttpServletResponse response)throws Exception {
		int result = sellerService.productDelete(P_NO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		if(result == 0) {
			out.println("alert('상품삭제 실패')");
			out.println("history.back()");
		}else {
			out.println("alert('상품삭제 완료')");
			out.println("location.href='seller?doc=seller_sale'");
		}
		out.println("</script>");
	}
	
	//## 배송상태 처리 ##
	@ResponseBody
	@PostMapping(value="/orderDelivery2")
	public void orderStatus(@RequestParam("ORDER_P_NO")int P_NO,
							@RequestParam(value="ORDER_TRNO", required=false)int ORDER_TRNO,
							@RequestParam("orderDeliveryVal")int orderDeliveryVal) {
		System.out.println("ORDER_P_NO = " + P_NO);
		String ORDER_TRNO_S = Integer.toString(ORDER_TRNO);
		int result = sellerService.orderStatus(P_NO, ORDER_TRNO_S, orderDeliveryVal);
		if(result == 1) {
			System.out.println("주문상태 변경 완료");
		}else {
			System.out.println("주문상태 변경 실패");
		}
	}
	
	//## 상품문의 답변 리스트 ##
	@ResponseBody
	@PostMapping(value="/sellerQna")
	public List<Qna> sellerQna(@RequestParam("USER_ID")String USER_ID){
		//@RequestParam("qnaSelect")String qnaSelect
		List<Qna> list = sellerService.sellerQna(USER_ID);
		return list; 
	}
	
	//## 질문 답변 페이지 ##
	@GetMapping(value="/QnaReplyView")
	public ModelAndView QnaReplyView(int q_p_no, ModelAndView mv) {
		Qna qnaView = sellerService.QnaReplyView(q_p_no);
		System.out.println(q_p_no);
		mv.setViewName("seller/seller_nav");
		mv.addObject("doc", "QnaReplyView"); // QnaReplyView.jsp 이동
		mv.addObject("qnaView", qnaView);
		
		return mv;
	}
	
	//## 질문 답변 답변작성 ##
	@GetMapping(value="/QnaUpdate")
	public void QnaUpdate(HttpServletResponse response,
							int QnaNo, String QnaAnswer)throws Exception {
		int result = sellerService.QnaUpdate(QnaNo, QnaAnswer);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//수정 실패한 경우
		out.println("<script>");
		if(result == 0) {
			out.println("alert('답변작성 실패')");
			out.println("history.back()");
		}else {
			//out.println("confirm('수정하시겠습니까?')");
			out.println("alert('답변작성 완료')");
			out.println("location.href='seller?doc=seller_qna'");
		}
		out.println("</script>");
	}
	
	//## 배송중 확인시 재고수량 - ##
	@PostMapping(value="/OrderAmountM")
	public void OrderAmountM(int ORDER_AMOUNT, int ORDER_P_NO) {
		int result = sellerService.OrderAmountM(ORDER_AMOUNT, ORDER_P_NO);
		if(result == 0){
			System.out.println("재고수량 변경 실패");
		}else {
			System.out.println("재고수량 변경 완료");
		}
	}
}
	

