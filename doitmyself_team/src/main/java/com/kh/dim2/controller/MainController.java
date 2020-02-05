package com.kh.dim2.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.dim2.Service.MainService;
import com.kh.dim2.domain.Mail;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;
import com.kh.dim2.task.SendMail;

@Controller
public class MainController {
	
	@Autowired
	public MainService mainService;
	
	@Autowired
	private SendMail sendMail;
	
	private String access_token = "";
	
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	
	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public ModelAndView home(
				ModelAndView mv , Product product , HttpServletResponse response , HttpSession session) {
		
		List<Product> BestproductList = mainService.getBestProduct_List();
		List<Product> NewproductList = mainService.getNewProduct_List();
		
		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = generateState();
		// 세션에 상태 토큰을 저장
		session.setAttribute("StringState", state);
		
		if(session.getAttribute("USER_ID") != null) {
			String USER_ID = session.getAttribute("USER_ID").toString();
			int recentView_Count = mainService.recentViewCount(USER_ID);
			if(recentView_Count > 0) {
				List<HashMap<String, String>> recentViewList = mainService.getRecent_View_List(USER_ID); //최근 본 DIM
			}
		}
		
		mv.addObject("newDim" , NewproductList);
		mv.addObject("bestDim" , BestproductList);
		
		mv.setViewName("main/home");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
				 ModelAndView mv,
				 HttpSession session) {
		return "main/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(
			ModelAndView mv,
			HttpSession session) {
		return "main/join";
	}
	
	@RequestMapping(value="/idcheck" , method=RequestMethod.GET)
	@ResponseBody
	public void idcheck(@RequestParam("USER_ID") String USER_ID,
						HttpServletResponse response) throws Exception {
		
		int result = mainService.isId(USER_ID);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	@RequestMapping(value="/emailcheck" , method=RequestMethod.GET)
	@ResponseBody
	public void emailcheck(@RequestParam("USER_EMAIL") String USER_EMAIL , 
			HttpServletResponse response) throws Exception {
		
		int result = mainService.isEmail(USER_EMAIL);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="/email_id_check" , method=RequestMethod.GET)
	@ResponseBody
	public void email_id_check(@RequestParam("USER_EMAIL") String USER_EMAIL, @RequestParam("USER_ID") String USER_ID , 
			HttpServletResponse response) throws Exception {
		
		int emailcheck = mainService.isEmail(USER_EMAIL);
		int idcheck = mainService.isId(USER_ID);
		int result = -1;
		if(emailcheck == 1 && idcheck == 1) {
			response.setContentType("text/html;charset=utf-8");
			result = 1;
		}
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="/joinProcess" , method = RequestMethod.POST)
	@ResponseBody
	public void joinProcess(Member member, 
							HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = mainService.insert(member);
		out.println("<script>");

		if(result == 1) {//삽입 성공시
			out.println("alert('회원가입에 성공했습니다.');");
			out.println("location.href='login';");
		} else if(result == -1) {
			out.println("alert('회원가입에 실패했습니다.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value="/home" , method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam("USER_ID") String USER_ID , @RequestParam("USER_PASSWORD") String USER_PASSWORD , Recent_View recent_view ,
							HttpServletRequest request , HttpServletResponse response , HttpSession session , ModelAndView mv) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		int result = mainService.isId(USER_ID , USER_PASSWORD);
		int seller_result = mainService.isSeller(USER_ID);
		
		Member admin_check = mainService.isAdmin(USER_ID);
		
		if(result == 1) {
			
			int recentView_Count = mainService.recentViewCount(USER_ID);
			int adminNumber = admin_check.getUSER_IS_ADMIN();//관리자인지 아닌지 확인
			List<Product> BestproductList = mainService.getBestProduct_List();//Best Dim 구하기
			List<Product> NewproductList = mainService.getNewProduct_List();//New Dim 구하기
			session.setAttribute("USER_ID", USER_ID);
			session.setAttribute("SELLER_RESULT" , seller_result);
			
			if(recentView_Count > 0) {
				List<HashMap<String, String>> recentViewList = mainService.getRecent_View_List(USER_ID); //최근 본 DIM
				mv.addObject("recentView", recentViewList);
			}
			mv.addObject("newDim" , NewproductList);
			mv.addObject("bestDim" , BestproductList);
			session.setAttribute("adminNumber" , adminNumber);
			mv.setViewName("main/home");
			
			return mv;
			
		} else {
			String message = "아이디나 비밀번호가 일치하지 않습니다.";

			response.setContentType("text/html;charset=utf-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('" + message + "');");
	         out.println("location.href='login';");
	         out.println("</script>");
	         out.close();
	         return null;
		}
	}
  
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value="/cart_count", method=RequestMethod.POST)
	public void cart_count(String id, HttpServletResponse response) throws Exception {
		int result = mainService.cartCount(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="/naverLoginProcess" , method=RequestMethod.GET)
	public String naverLoginProcess(@RequestParam("state") String state , @RequestParam("code") String code , HttpSession session ,  HttpServletResponse response) throws Exception{
		
		String NaverState = state;
		
		// 세션 또는 별도의 저장 공간에서 상태 토큰을 가져옴
		String storedState = (String)session.getAttribute("state");
		
		if( !NaverState.equals( storedState ) ) {
		    return null; //401 unauthorized
		} else {
			
		    return "redirect:naverLogin_ok?code=" + code + "&state=" + state;
		}
	}
	
	@RequestMapping(value="/naverLogin_ok" , method=RequestMethod.GET)
	public String naverLogin_ok(HttpServletRequest request , String apiURL2) throws Exception{
	    String clientId = "iOLTY0IrYPUE_O2gwkSU";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "BgSe5KALbL";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    
	    
	    String redirectURI = URLEncoder.encode("http://192.168.40.48:8088/dim2/naverSuccess", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    access_token = "";
	
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      if(responseCode==200) { //정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        String json = res.toString();
	        access_token = json.substring(17, json.indexOf("\"", 18));// 네아로 접근 토큰 값";
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return "redirect:naverProfile";
	}
	
	@RequestMapping(value="/naverProfile")
	public ModelAndView NaverLogin(HttpServletRequest request , Member member, HttpServletResponse response2 , 
								   HttpSession session ,  Recent_View recent_view , ModelAndView mv) throws Exception{
		
		String header = "Bearer " + access_token;

		try{
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			
			URL url=new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
	
				if(responseCode==200){
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { //에러
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
					String inputLine;
					StringBuffer response = new StringBuffer();
				while((inputLine=br.readLine()) != null){
					response.append(inputLine);
				}
				      br.close();
				if(responseCode==200) {
					//System.out.println("Profile = "+response.toString());
					String NProfile = response.toString();
					JsonParser JParser = new JsonParser();
					JsonObject JObject = (JsonObject) JParser.parse(NProfile);
					JsonObject ProfileObject = (JsonObject) JObject.get("response");
					
						String N_Id = ProfileObject.get("id").toString().replace("\"", "");
						String N_Pass = ProfileObject.get("name").toString().replace("\"", "");
						String N_Name = ProfileObject.get("name").toString().replace("\"", "");
						String N_Birth = ProfileObject.get("birthday").toString().replace("\"", "");
						String N_Gender = ProfileObject.get("gender").toString().replace("\"", "");
						String N_Email = ProfileObject.get("email").toString().replace("\"", "");
					
						//int index = N_Id.indexOf("@");
						//String NaverId = N_Id.substring(0 , index);
					int result = mainService.isNaverId(N_Id);
						//System.out.println("NaverId result = "+result);
					if(result == 1) { //네아로 가입된 아이디가 있을 시
						session.setAttribute("USER_ID", N_Id);
						int seller_result = mainService.isSeller(N_Id);
						int recentView_Count = mainService.recentViewCount(N_Id);
						List<Product> BestproductList = mainService.getBestProduct_List();//Best Dim 구하기
						List<Product> NewproductList = mainService.getNewProduct_List();//New Dim 구하기
						session.setAttribute("SELLER_RESULT" , seller_result);
						
						if(recentView_Count > 0) {
							List<HashMap<String, String>> recentViewList = mainService.getRecent_View_List(N_Id); //최근 본 DIM
							mv.addObject("recentView", recentViewList);
						}
						mv.addObject("newDim" , NewproductList);
						mv.addObject("bestDim" , BestproductList);
						mv.setViewName("main/home");
						
						return mv;
						
					} else if(result == 0) { //네아로 가입된 아이디 없을 시 회원가입
						HashMap<String, String> map = new HashMap<>();
						
						map.put("USER_ID", N_Id);
						map.put("USER_PASS", N_Pass);
						map.put("USER_NAME", N_Name);
						map.put("USER_BIRTH", N_Birth);
						map.put("USER_GENDER", N_Gender);
						map.put("USER_EMAIL" , N_Email);
						
						response2.setContentType("text/html;charset=utf-8");
						PrintWriter out = response2.getWriter();
						int result2 = mainService.NaverInsert(map);
						out.println("<script>");
						
						if(result2 == 1) {//삽입 성공시 로그인까지
							session.setAttribute("USER_ID", N_Id);
							int seller_result = mainService.isSeller(N_Id);
							int recentView_Count = mainService.recentViewCount(N_Id);
							List<Product> BestproductList = mainService.getBestProduct_List();//Best Dim 구하기
							List<Product> NewproductList = mainService.getNewProduct_List();//New Dim 구하기
							session.setAttribute("SELLER_RESULT" , seller_result);
							session.setAttribute("N_NAME", N_Name);
							
							if(recentView_Count > 0) { //최근 본 DIM가 있을 시
								List<HashMap<String, String>> recentViewList = mainService.getRecent_View_List(N_Id); //최근 본 DIM 리스트 추출
								mv.addObject("recentView", recentViewList);
							}
							mv.addObject("newDim" , NewproductList);
							mv.addObject("bestDim" , BestproductList);
							mv.setViewName("main/home");
							
							return mv;
						} else if(result2 == -1) {
							out.println("alert('네이버 회원가입에 실패했습니다.');");
							out.println("history.back()");
							out.println("</script>");
							out.close();
						}
					} else {
						PrintWriter out = response2.getWriter();
						out.println("<script>");
						out.println("alert('네이버 로그인에 실패했습니다.');");
						out.println("history.back()");
						out.println("</script>");
						out.close();
					}
				}
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return null;
	}
	@RequestMapping(value="/Naver_idcheck" , method=RequestMethod.GET)
	@ResponseBody
	public void Naver_idcheck(@RequestParam("USER_ID") String USER_ID,
						HttpServletResponse response) throws Exception {
		
		int result = mainService.isId(USER_ID);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="/Find_Pass" , method=RequestMethod.GET)
	public String Find_Pass(HttpServletResponse response , ModelAndView mv) throws Exception {
		
			return "main/Find_Pass";
	}
	
	@RequestMapping(value="/MailSender")
	@ResponseBody
	public void MailSender(@RequestParam("USER_ID") String USER_ID , Member m ,
			HttpServletResponse response , HttpSession session) throws Exception{

			StringBuffer Find_Code = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 6; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			    	Find_Code.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			    	Find_Code.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			    	Find_Code.append((rnd.nextInt(10)));
			        break;
			    }
			}
		
			Mail mail = new Mail();
			mail.setContent("당신의 비밀번호를 찾기 위한 코드는 " + Find_Code + " 입니다.");
			mail.setReceiver(m.getUSER_EMAIL());
			mail.setSubject("안녕하세요 "+USER_ID + "님," + "USER_ID" + "님의 비밀번호 코드를 확인해주세요");
			sendMail.SendEmail(mail);

			System.out.println("USER_ID = " + USER_ID);
			System.out.println("FIND_CODE = " + Find_Code);
			
			HashMap<String , Object> map = new HashMap<>();
			
			map.put("USER_ID" , USER_ID);
			map.put("FIND_CODE" , Find_Code.toString());
			
			int result = mainService.codeInsert(map);
	}
	
	@RequestMapping(value="/code_identify" , method=RequestMethod.GET)
	@ResponseBody
	public void code_identify(@RequestParam("FIND_CODE") String FIND_CODE, @RequestParam("USER_ID") String USER_ID , 
			HttpServletResponse response , Member m) throws Exception {
		
		int findcode = mainService.isCode(FIND_CODE);
		int idcheck = mainService.isId(USER_ID);
		int result = -1;
		PrintWriter out = response.getWriter();
		System.out.println(idcheck);
		System.out.println(findcode);
		if(findcode == 1 && idcheck == 1) {
			m = mainService.isPass(m);
			String USER_PASS = m.getUSER_PASSWORD();
			response.setContentType("text/html;charset=utf-8");
			result = 1;
			out.print(USER_PASS);
			System.out.println("USER_PASS = "+USER_PASS);
		}
	}
	
	@RequestMapping(value="/Search_home" , method = RequestMethod.GET)
	public ModelAndView memberList(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="8", required=false) int limit, ModelAndView mv,
			@RequestParam(value="search_field", defaultValue="-1") int index,
			@RequestParam(value="search_word", defaultValue="") String search_word ,
			HttpSession session) throws Exception {
		
		List<Product> BestproductList = mainService.getBestProduct_List();
		List<Product> NewproductList = mainService.getNewProduct_List();
		
		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = generateState();
		// 세션에 상태 토큰을 저장
		session.setAttribute("StringState", state);
		
		if(session.getAttribute("USER_ID") != null) {
			String USER_ID = session.getAttribute("USER_ID").toString();
			int recentView_Count = mainService.recentViewCount(USER_ID);
			if(recentView_Count > 0) {
				List<HashMap<String, String>> recentViewList = mainService.getRecent_View_List(USER_ID); //최근 본 DIM
				mv.addObject("recentView", recentViewList);
			}
		}
		
		mv.addObject("newDim" , NewproductList);
		mv.addObject("bestDim" , BestproductList);
		
		List<Product> list = null;
		int listcount = 0;
		
		list = mainService.getSearchList(index, search_word, page, limit);
		listcount = mainService.getSearchListCount(index, search_word);
		
		//총 페이지 수   
		int maxpage = (listcount + limit -1) / limit;
						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;
				
		//10, 20, 30 등
		int endpage = startpage + 10 -1;
						  
		if (endpage > maxpage) endpage = maxpage;
		
		mv.setViewName("main/Search");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("ProductList", list);
		mv.addObject("limit", limit);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
			
		return mv;
	}
}
