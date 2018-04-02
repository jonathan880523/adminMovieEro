package com.army.adminMovieEro.movieAddList.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.adminMovieEro.movieAddList.model.service.DeleteMovieService;
import com.army.adminMovieEro.movieAddList.model.service.InsertResultMovieService;
import com.army.adminMovieEro.movieAddList.model.service.MovieListService;
import com.army.adminMovieEro.movieAddList.model.service.MovieVisualService;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Controller
public class AddMovieController {

	@Autowired
	MovieListService movieListService;

	@Autowired
	InsertResultMovieService insertResultMovieService;

	@Autowired
	DeleteMovieService deleteMovieService;

	@Autowired
	MovieVisualService movieVisualService;

	public static final Logger logger = LoggerFactory.getLogger(AddMovieController.class);

	// 영화 추가 controller
	@RequestMapping(value = "addMovie.do")
	public String goAddMovie() {

		logger.info("addMovie.do 도착...............");

		return "movieBoard/addMovie";
	}

	@RequestMapping("loadMovie.do")
	public ModelAndView loadMoive(ModelAndView mv) {
		logger.info("loadMovie.do 도착...............");
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();

		movieList = movieListService.loadMovieList();
		if (movieList != null) {
			System.out.println("movieList" + movieList);
			mv.addObject("movieList", movieList).setViewName("movieBoard/movieList");
		} else {
			mv.addObject("movieList", movieList).setViewName("movieBoard/movieList");
		}
		return mv;
	}

	// 영화 검색 Ajax
	@ResponseBody
	@RequestMapping(value = "/ajaxAddMovie.do", method = RequestMethod.GET)
	public Map<String, String> ajaxAddMovie(HttpServletRequest request, Model model) {
		Map<String, String> map = null;
		StringBuffer response = new StringBuffer();
		try {
			System.out.println("AjaxAddMovieController 도착.................");

			String clientId = "yxO7C6C5LsdJtbHkbfHs";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "TOjCC9nvUj";// 애플리케이션 클라이언트 시크릿값";

			// ajax를 통해서 넘어온 request값
			String query = request.getParameter("query");
			query = URLEncoder.encode(query, "UTF-8");
			System.out.println("query = " + query);
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

			if (display != "") {
				apiURL += "&display=" + display;
				System.out.println(apiURL);
			}
			if (genre != "") {
				apiURL += "&genre=" + genre;
				System.out.println(apiURL);
			}
			if (country != "") {
				apiURL += "&country=" + country;
				System.out.println(apiURL);
			}
			if (yearfrom != "") {
				apiURL += "&yearfrom=" + yearfrom;
				System.out.println(apiURL);
			}
			if (yearto != "") {
				apiURL += "&yearto=" + yearto;
				System.out.println(apiURL);
			}
			System.out.println("마지막 apiURL = " + apiURL);

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
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
			} catch (Exception e) {
				e.getStackTrace();
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}

	// 영화 등록 controller
	@RequestMapping(value = "insertMovie.do", method = RequestMethod.GET)
	public String insertMovie(HttpServletRequest request) {
		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("resultTitle", request.getParameter("resultTitle"));
		System.out.println("영화 제목 : " + resultMap.get(0));
		resultMap.put("resultSubtitle", request.getParameter("resultSubtitle"));
		resultMap.put("resultDirector", request.getParameter("resultDirector"));
		System.out.println("영화 감독 : " + resultMap.get("resultDirector"));
		resultMap.put("resultActor", request.getParameter("resultActor"));
		resultMap.put("resultPubDate", request.getParameter("resultPubDate"));
		resultMap.put("resultUserRating", request.getParameter("resultUserRating"));
		resultMap.put("resultLink", request.getParameter("resultLink"));
		resultMap.put("resultImage", request.getParameter("resultImage"));
		System.out.println("영화 이미지URL : " + resultMap.get("resultImage"));

		insertResultMovieService.insertResultMovie(resultMap);

		return "redirect:loadMovie.do";

	}

	// 영화 목록에서 지우기
	@RequestMapping("deleteMovie.do")
	public String deleteMovie(HttpServletRequest request) {
		System.out.println("deleteMovie.do 도착.......................");

		String movieUniNum = request.getParameter("movieUniNumDel");

		System.out.println("삭제할 UniqueNumber : " + movieUniNum);

		int resultDeleteMovie = deleteMovieService.deleteMovie(movieUniNum);

		if (resultDeleteMovie > 0) {
			return "redirect:loadMovie.do";
		}
		return "#";

	}

}