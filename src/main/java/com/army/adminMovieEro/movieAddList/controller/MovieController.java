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
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.adminMovieEro.movieAddList.model.service.InsertResultMovieService;
import com.army.adminMovieEro.movieAddList.model.service.MovieDetailServie;
import com.army.adminMovieEro.movieAddList.model.service.MovieListService;
import com.army.adminMovieEro.movieAddList.model.service.MovieReviewService;
import com.army.adminMovieEro.movieAddList.model.service.MovieVisualService;
import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Controller
public class MovieController {

	@Autowired
	MovieListService movieListService;

	@Autowired
	InsertResultMovieService insertResultMovieService;

	@Autowired
	MovieVisualService movieVisualService;
	
	@Autowired
	MovieReviewService movieReviewService;
	
	@Autowired
	MovieDetailServie movieDetailServie;

	public static final Logger logger = LoggerFactory.getLogger(MovieController.class);

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
			System.out.println("movieList" + movieList.toString());
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
	public String insertMovie(HttpServletRequest request, HttpSession getMVInfoMap) {
		Map<String, String> resultMap = new HashMap<String, String>();
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		Map<String, String> sessionMap = new HashMap<String, String>();
		
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
		movieList = movieListService.loadMovieList();
		int sessionSeq = movieList.get(0).getMV_INFO_SEQ();
		String sessionLink = movieList.get(0).getMV_LINK();
		sessionMap.put("sessionSeq", Integer.toString(sessionSeq));
		sessionMap.put("sessionLink", sessionLink);
		getMVInfoMap.setAttribute("sessionMap", sessionMap);
		if(getMVInfoMap != null) {
			System.out.println("getMVInfoMap : " + getMVInfoMap);
			System.out.println("세션 생성 성공");
		}

		return "redirect:addMovieDetail.do";

	}

	// 영화 목록에서 지우기
	@RequestMapping("deleteMovie.do")
	public String deleteMovie(HttpServletRequest request) {
		System.out.println("deleteMovie.do 도착.......................");

		String movieUniNum = request.getParameter("movieUniNumDel");

		System.out.println("삭제할 UniqueNumber : " + movieUniNum);

		movieDetailServie.deleteMovieDetail(movieUniNum);
		movieListService.deleteMovie(movieUniNum);

		return "redirect:loadMovie.do";
	}

	// 영화 스틸컷, 트레일러 목록 불러오기
	@RequestMapping("loadVisualItems.do")
	public ModelAndView loadVisualItems(HttpServletRequest request, ModelAndView mv, MovieListVo vo) {
		System.out.println("loadVisualItems.do 도착.......................");
		//영화 제목 불러오기
		String MVInfoSeq = request.getParameter("movieUniNumDel");
		vo = movieListService.loadMovieTitle(Integer.parseInt(MVInfoSeq));
		String MVTitle = vo.getMV_TITLE();
		System.out.println("사진/영상 추가할 영화 : " + MVTitle);
		
		List<MovieVisualVo> resultItems = new ArrayList<MovieVisualVo>();
		resultItems = movieVisualService.loadVisualItems(MVInfoSeq);
		System.out.println("resultItems : " + resultItems);
		if(resultItems.size() <= 0) {
			System.out.println("resultItems == null");
			mv.addObject("nullTitle", MVTitle)
			  .setViewName("movieBoard/addVisualitems");
		}else {
			System.out.println("resultItems != null");
			mv.addObject("resultVisualItems", resultItems)
			  .setViewName("movieBoard/addVisualitems");
		}
		return mv;
	}

	// 영화 스틸컷 추가
	@RequestMapping("insertVisualItems.do")
	public String insertVisualItems(HttpServletRequest request, Map<String, String> visualMap) {
		System.out.println("insertStillcut.do 도착.................");
		String MVTitle = request.getParameter("MVTitle");
		String MVInfoSeq = request.getParameter("MVInfoSeq");
		String StillcutURL = request.getParameter("stillcutURL");
		String trailerURL = request.getParameter("trailerURL");
		
		if(StillcutURL != null) {
			visualMap.put("MVTitle", MVTitle);
			visualMap.put("MVInfoSeq", MVInfoSeq);
			visualMap.put("StillcutURL", StillcutURL);
			
			movieVisualService.insertStillcut(visualMap);
		}else if(trailerURL != null) {
			visualMap.put("MVTitle", MVTitle);
			visualMap.put("MVInfoSeq", MVInfoSeq);
			visualMap.put("trailerURL", trailerURL);
			
			movieVisualService.insertTrailer(visualMap);
		}
		
		return "redirect:loadVisualItems.do";
	}
	
	@RequestMapping("searchReview.do")
	public ModelAndView searchReview(HttpServletRequest request, ModelAndView mv) {
		System.out.println("searchReview.do 도착...................");
		String MVTitle = request.getParameter("seachTitle");
		List<MovieReviewVo> vo = new ArrayList<MovieReviewVo>();
		System.out.println("검색한 영화 이름 : " + MVTitle);
		vo = movieReviewService.searchReview(MVTitle);
		System.out.println("검색된 영화 갯수: " + vo.size());
		mv.addObject("resultMVTitle", vo)
		  .setViewName("movieBoard/movieReview");
		
		return mv;
	}
	
	@RequestMapping("loadReview.do")
	public ModelAndView loadReview(ModelAndView mv) {
		System.out.println("loadReview.do 도착...................");
		List<MovieReviewVo> vo = new ArrayList<MovieReviewVo>();
		vo = movieReviewService.loadReview();
		mv.addObject("resultMVTitle", vo)
		.setViewName("movieBoard/movieReview");
		
		return mv;
	}
	
	@RequestMapping("deleteReview.do")
	public ModelAndView deleteReview(int reviewSeq, ModelAndView mv) {
		System.out.println("deleteReview.do 도착.....................");
		System.out.println("삭제할 리뷰 시퀀스 : " + reviewSeq);
		boolean resultDeleteReview = movieReviewService.deleteReview(reviewSeq);
		if(resultDeleteReview) {
			mv.setViewName("redirect:loadReview.do");
			return mv;
		}else {
			mv.setViewName("redirect:loadReview.do");
			return mv;
		}
	}
	
	@RequestMapping("reloadReview.do")
	public ModelAndView reloadReview(ModelAndView mv) {
		System.out.println("reloadReview.do 도착......................");
		mv.setViewName("redirect:loadReview.do");
		return mv;
	}
	
	@RequestMapping("addMovieDetail.do")
	public String addMovieDetail(Map<String, String> seqLnkMap, HttpServletRequest request, HttpSession getMVInfoMap) {
		seqLnkMap = (Map<String, String>) getMVInfoMap.getAttribute("sessionMap");
		String sessionSeq = seqLnkMap.get("sessionSeq");
		String sessionLink = seqLnkMap.get("sessionLink");
		String movieUniNum = sessionSeq;
		System.out.println("추가할 seq : " + movieUniNum);
		String MovieLink = sessionLink;
		System.out.println("추가할 link : " + MovieLink);
		List list = new ArrayList();
		try {
			Document doc = Jsoup.connect(MovieLink).get();

			Element MVTitle = doc.select(".h_movie a:eq(0)").get(0);
			Elements MVTitles = MVTitle.select("a");
			for(Element e : MVTitles) {
				list.add(e.text());
			}
			Element summaryValue = doc.select(".info_spec .step1+dd").get(0);
			Elements summaryValues = summaryValue.select("span");
			for(Element e : summaryValues) {
				list.add(e.text());
			}
			
			Element directorValue = doc.select(".info_spec .step2+dd p").get(0);
			Elements directorValues = directorValue.select("a");
			for(Element e : directorValues) {
				list.add(e.text());
			}
			
			Element actorValue = doc.select(".info_spec .step3+dd").get(0);
			Elements actorValues = actorValue.select("p");
			for(Element e : actorValues) {
				list.add(e.text());
			}
			
			Element gradeValue = doc.select(".info_spec .step4+dd p").get(0);
			Elements gradeValues = gradeValue.select("a");
			for(Element e : gradeValues) {
				list.add(e.text());
			}
			
			//String으로 casting
			String setMVTitle = (String) list.get(0);
			String genre = (String)list.get(1);
			String country = (String)list.get(2);
			String runtime = (String)list.get(3);
			String releaseDate = (String)list.get(4);
			String director = (String)list.get(5);
			String actor = (String)list.get(6);
			String grade = (String)list.get(7);
			
			Map<String, String> MovieDetailMap = new HashMap<String, String>();
			MovieDetailMap.put("MVInfoSeq", movieUniNum);
			MovieDetailMap.put("MovieLink", MovieLink);
			MovieDetailMap.put("MVTitle", setMVTitle);
			MovieDetailMap.put("genre", genre);
			MovieDetailMap.put("country", country);
			MovieDetailMap.put("runtime", runtime);
			MovieDetailMap.put("releaseDate", releaseDate);
			MovieDetailMap.put("director", director);
			MovieDetailMap.put("actor", actor);
			MovieDetailMap.put("grade", grade);
			System.out.println("map의 사이즈 : " + MovieDetailMap.size());
			int result = movieDetailServie.addMovieDetail(MovieDetailMap);
			if(result > 0) {
				System.out.println("입력 성공");
			}else {
				System.out.println("입력 실패");
			}
			
		}catch(Exception e) {
			e.getLocalizedMessage();
		}
		getMVInfoMap.invalidate();
		return "redirect:loadDetailInfo.do";
	}
	
	@RequestMapping("loadDetailInfo.do")
	public ModelAndView loadDetailInfo(ModelAndView mv) {
		List<MovieDetailVo> detailResult = new ArrayList<MovieDetailVo>();
		detailResult = movieDetailServie.loadMovieDetail();
		mv.addObject("detailResult", detailResult).setViewName("movieBoard/movieDetail");
		return mv;
	}
}