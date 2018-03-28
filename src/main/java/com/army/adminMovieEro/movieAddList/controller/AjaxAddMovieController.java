package com.army.adminMovieEro.movieAddList.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxAddMovieController {
	
	@ResponseBody
	@RequestMapping(value = "/ajaxAddMovie.do", method = RequestMethod.GET)
	public Map<String, String> ajaxAddMovie(HttpServletRequest request, Model model){
		Map<String, String> map = null;
		StringBuffer response = new StringBuffer();
		try {
			System.out.println("AjaxAddMovieController 도착.................");
			
			String clientId = "yxO7C6C5LsdJtbHkbfHs";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "TOjCC9nvUj";//애플리케이션 클라이언트 시크릿값";
	        
	        //ajax를 통해서 넘어온 request값 
	        String query = request.getParameter("query");
	        query = URLEncoder.encode(query, "UTF-8");
	        System.out.println("query = "+query);
	        String display = request.getParameter("display");
	        System.out.println("display = " + display);
	        String genre = request.getParameter("genre");
	        System.out.println("genre = " + genre);
	        String country = request.getParameter("country");
	        System.out.println("country = " + country);
	        String yearfrom = request.getParameter("yearfrom");
	        System.out.println("yearfrom = " + yearfrom);
	        String yearto = request.getParameter("yearto");
	        System.out.println("yearto = " + yearto);
	        
	        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + query; // json 결과과
	        
	        if(display != "") {
	        	apiURL += "&display="+display;
	        	System.out.println(apiURL);
	        }
	        if(genre != "") {
	        	apiURL += "&genre="+genre;
	        	System.out.println(apiURL);
	        }
	        if(country != "") {
	        	apiURL += "&country="+country;
	        	System.out.println(apiURL);
	        }
	        if(yearfrom != "") {
	        	apiURL += "&yearfrom="+yearfrom;
	        	System.out.println(apiURL);
	        }
	        if(yearto != "") {
	        	apiURL += "&yearto="+yearto;
	        	System.out.println(apiURL);
	        }
	        System.out.println("마지막 apiURL = " + apiURL);
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            
            try {
            	map = new ObjectMapper().readValue(response.toString(), Map.class);
            	
            	System.out.println("map = " + map);
            	System.out.println("map의 size" + map.size());
            	model.addAttribute("addMovieMap", map);
            }catch(Exception e) {
            	e.getStackTrace();
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
		return map;
	}
}