package com.kh.dim2.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MainService;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;

@Controller
public class MainController {
	
	@Autowired
	public MainService mainService;
	
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
	public void emailcheck(@RequestParam("USER_EMAIL") String USER_EMAIL,
			HttpServletResponse response) throws Exception {
		
		int result = mainService.isEmail(USER_EMAIL);
		response.setContentType("text/html;charset=utf-8");
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
				List<Recent_View> recentViewList = mainService.getRecent_View_List(USER_ID); //최근 본 DIM
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
		String clientSecret = "BgSe5KALbL";
		
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
	
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
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
	        System.out.println(res.toString());
	        String json = res.toString();
	        access_token = json.substring(17, json.indexOf("\"", 18));// 네아로 접근 토큰 값";
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return "redirect:naverProfile";
	}
	
	@RequestMapping(value="/naverProfile")
	public void NaverLogin(HttpServletRequest request) throws Exception{
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
					System.out.println("Profile = "+response.toString());
					
			
				}
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	}
}
