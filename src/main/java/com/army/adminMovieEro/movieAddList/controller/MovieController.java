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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.adminMovieEro.movieAddList.model.service.MovieService;
import com.army.adminMovieEro.movieAddList.model.vo.MovieDetailVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieListVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieReviewVo;
import com.army.adminMovieEro.movieAddList.model.vo.MovieVisualVo;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieservice;

	@RequestMapping(value="/main.do")
	public ModelAndView goMain(ModelAndView mv) {
		System.out.println("main.do 도착....................");
		List<MovieListVo> mainMovieList = new ArrayList<MovieListVo>();
		mainMovieList = movieservice.loadMovieList();
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		List<MovieReviewVo> reviewList = new ArrayList<MovieReviewVo>();
		List<Map<String, Object>> movieInfoList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < mainMovieList.size(); i++) {
			mainMovieList = movieservice.loadMovieList();
			String movieName = mainMovieList.get(i).getMV_TITLE();
			String MVInfoSeq =  mainMovieList.get(i).getMV_INFO_SEQ();
			movieStillcutList = movieservice.loadStillcut(MVInfoSeq);
			int stillcutSize = movieStillcutList.size();
			movieTrailerList = movieservice.loadTrailer(MVInfoSeq);
			int trailerSize = movieTrailerList.size();
			reviewList = movieservice.loadSpecificReview(MVInfoSeq);
			int reviewSize = reviewList.size();
			Map<String, Object> movieMainMap = new HashMap<String, Object>();
			movieMainMap.put("MVTItle", movieName);
			movieMainMap.put("stillcutSize", stillcutSize);
			movieMainMap.put("trailerSize", trailerSize);
			movieMainMap.put("reviewSize", reviewSize);
			movieInfoList.add(i, movieMainMap);
		}
		mv.addObject("movieInfoList", movieInfoList).setViewName("main/index");
		return mv;
	}

	// 영화 추가 controller
	@RequestMapping(value = "addMovie.do")
	public String goAddMovie() {
		System.out.println("controller addMovie.do 도착...............");
		return "movieBoard/addMovie";
	}

	@RequestMapping("loadMovie.do")
	public ModelAndView loadMoive(ModelAndView mv) {
		System.out.println("controller loadMovie.do 도착...............");
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		movieList = movieservice.loadMovieList();
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
			System.out.println("controller ajaxAddMovie.do 도착.................");
			String clientId = "yxO7C6C5LsdJtbHkbfHs";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "TOjCC9nvUj";// 애플리케이션 클라이언트 시크릿값";

			// ajax를 통해서 넘어온 request값
			String query = request.getParameter("query");
			query = URLEncoder.encode(query, "UTF-8");
			String display = request.getParameter("display");
			String genre = request.getParameter("genre");
			String country = request.getParameter("country");
			String yearfrom = request.getParameter("yearfrom");
			String yearto = request.getParameter("yearto");
			String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + query; // json 결과과

			if (display != "") {
				apiURL += "&display=" + display;
				System.out.println(apiURL);
			}
			if (genre != "") {
				apiURL += "&genre=" + genre;
			}
			if (country != "") {
				apiURL += "&country=" + country;
			}
			if (yearfrom != "") {
				apiURL += "&yearfrom=" + yearfrom;
			}
			if (yearto != "") {
				apiURL += "&yearto=" + yearto;
			}
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
			try {
				map = new ObjectMapper().readValue(response.toString(), Map.class);
				model.addAttribute("addMovieMap", map);
			} catch (Exception e) {
				e.getStackTrace();
			}

		} catch (Exception e) {
			System.err.println(e);
		}
		return map;
	}

	// 영화 등록 controller
	@RequestMapping(value = "insertMovie.do", method = RequestMethod.GET)
	public String insertMovie(HttpServletRequest request, HttpSession getMVInfoMap) {
		System.out.println("controller insertMovie.do 도착..................");
		Map<String, String> resultMap = new HashMap<String, String>();
		List<MovieListVo> movieList = new ArrayList<MovieListVo>();
		Map<String, String> sessionMap = new HashMap<String, String>();
		
		resultMap.put("resultTitle", request.getParameter("resultTitle"));
		resultMap.put("resultSubtitle", request.getParameter("resultSubtitle"));
		resultMap.put("resultDirector", request.getParameter("resultDirector"));
		resultMap.put("resultActor", request.getParameter("resultActor"));
		resultMap.put("resultPubDate", request.getParameter("resultPubDate"));
		resultMap.put("resultUserRating", request.getParameter("resultUserRating"));
		resultMap.put("resultLink", request.getParameter("resultLink"));
		resultMap.put("resultImage", request.getParameter("resultImage"));

		movieservice.insertResultMovie(resultMap);
		movieList = movieservice.loadMovieList();
		String sessionSeq = movieList.get(0).getMV_INFO_SEQ();
		String sessionLink = movieList.get(0).getMV_LINK();
		sessionMap.put("sessionSeq", sessionSeq);
		sessionMap.put("sessionLink", sessionLink);
		getMVInfoMap.setAttribute("sessionMap", sessionMap);
		return "redirect:addMovieDetail.do";

	}

	// 영화 목록에서 지우기
	@RequestMapping("deleteMovie.do")
	public String deleteMovie(HttpServletRequest request) {
		System.out.println("controller deleteMovie.do 도착..................");
		String movieUniNum = request.getParameter("movieUniNumDel");
		movieservice.deleteMovieDetail(movieUniNum);
		movieservice.deleteMovie(movieUniNum);
		return "redirect:loadMovie.do";
	}

	// 영화 스틸컷, 트레일러 목록 불러오기
	@RequestMapping("loadVisualItems.do")
	public ModelAndView loadVisualItems(HttpServletRequest request, ModelAndView mv, MovieListVo vo, 
			HttpSession visualSession, Map<String, String> visualMap) {
		System.out.println("controller loadVisualItems.do 도착..................");
		//영화 제목 불러오기
		String MVInfoSeq = request.getParameter("movieUniNumDel");
		vo = movieservice.loadMovieTitle(MVInfoSeq);
		String MVTitle = vo.getMV_TITLE();
		visualMap.put("MVInfoSeq", MVInfoSeq);
		visualMap.put("MVTitle", MVTitle);
		visualSession.setAttribute("visualMap", visualMap);
		
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		
		movieStillcutList = movieservice.loadStillcut(MVInfoSeq);
		movieTrailerList = movieservice.loadTrailer(MVInfoSeq);
		
		mv.addObject("resultStillcutList", movieStillcutList)
		  .addObject("resultTrailerList", movieTrailerList)
		  .setViewName("movieBoard/addVisualitems");
		
		return mv;
	}

	// 영화 스틸컷 추가
	@RequestMapping("insertVisualItems.do")
	public String insertVisualItems(HttpServletRequest request, Map<String, String> stillcutMap,
			Map<String, String> trailerMap, HttpSession visualSession, Map<String, String> comeVisualMap) {
		System.out.println("controller insertVisualItems.do 도착.................");
		comeVisualMap = (Map<String, String>) visualSession.getAttribute("visualMap");
		String MVTitle = comeVisualMap.get("MVTitle");
		String MVInfoSeq = comeVisualMap.get("MVInfoSeq");
		String stillcutURL = request.getParameter("stillcutURL");
		String trailerURL = request.getParameter("trailerURL");
		String trailerDesc = request.getParameter("trailerDesc");
		
		if(!stillcutURL.equals("")) {
			stillcutMap.put("MVTitle", MVTitle);
			stillcutMap.put("MVInfoSeq", MVInfoSeq);
			stillcutMap.put("StillcutURL", stillcutURL);
			
			movieservice.insertStillcut(stillcutMap);
		}else if(!trailerURL.equals("")) {
			trailerMap.put("MVTitle", MVTitle);
			trailerMap.put("MVInfoSeq", MVInfoSeq);
			trailerMap.put("trailerURL", trailerURL);
			trailerMap.put("trailerDesc", trailerDesc);
			
			movieservice.insertTrailer(trailerMap);
		}
		return "redirect:reloadVisualItems.do";
	}
	
	@RequestMapping("reloadVisualItems.do")
	public ModelAndView reloadVisualItems(ModelAndView mv, HttpSession getVisualSession, 
			Map<String, String> getVisualMap) {
		System.out.println("controller reloadVisualItems.do 도착.................");
		getVisualMap = (Map<String, String>) getVisualSession.getAttribute("visualMap");
		String MVTitle = getVisualMap.get("MVTitle");
		String MVInfoSeq = getVisualMap.get("MVInfoSeq");
		
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		
		movieStillcutList = movieservice.loadStillcut(MVInfoSeq);
		movieTrailerList = movieservice.loadTrailer(MVInfoSeq);
		
		mv.addObject("resultStillcutList", movieStillcutList)
		  .addObject("resultTrailerList", movieTrailerList)
		  .setViewName("movieBoard/addVisualitems");
		
		return mv;
	}
	
	@RequestMapping("deleteVisualItems.do")
	public ModelAndView deleteVisualItems(ModelAndView mv, HttpServletRequest request) {
		System.out.println("controller deleteVisualItems.do 도착...................");
		String stillcutSeq = request.getParameter("stillcutSeq");
		String trailerSeq = request.getParameter("trailerSeq");
		
		if(stillcutSeq != null) {
			movieservice.deleteStillcut(stillcutSeq);
		}else if(trailerSeq != null){
			movieservice.deleteTrailer(trailerSeq);
		}
		mv.setViewName("redirect:reloadVisualItems.do");
		return mv;
	}
	
	@RequestMapping("searchReview.do")
	public ModelAndView searchReview(HttpServletRequest request, ModelAndView mv) {
		System.out.println("controller searchReview.do 도착...................");
		String MVTitle = request.getParameter("seachTitle");
		List<MovieReviewVo> vo = new ArrayList<MovieReviewVo>();
		vo = movieservice.searchReview(MVTitle);
		mv.addObject("resultMVTitle", vo)
		  .setViewName("movieBoard/movieReview");
		return mv;
	}
	
	@RequestMapping("loadReview.do")
	public ModelAndView loadReview(ModelAndView mv) {
		System.out.println("controller loadReview.do 도착...................");
		List<MovieReviewVo> vo = movieservice.loadReview();
		mv.addObject("resultMVTitle", vo)
		.setViewName("movieBoard/movieReview");
		
		return mv;
	}
	
	@RequestMapping("deleteReview.do")
	public ModelAndView deleteReview(int reviewSeq, ModelAndView mv) {
		System.out.println("controller deleteReview.do 도착.....................");
		boolean resultDeleteReview = movieservice.deleteReview(reviewSeq);
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
		System.out.println("controller reloadReview.do 도착......................");
		mv.setViewName("redirect:loadReview.do");
		return mv;
	}
	
	@RequestMapping("addMovieDetail.do")
	public String addMovieDetail(Map<String, String> seqLnkMap, HttpServletRequest request, HttpSession getMVInfoMap) {
		seqLnkMap = (Map<String, String>) getMVInfoMap.getAttribute("sessionMap");
		String sessionSeq = seqLnkMap.get("sessionSeq");
		String sessionLink = seqLnkMap.get("sessionLink");
		String movieUniNum = sessionSeq;
		String MovieLink = sessionLink;
		List list = new ArrayList();
		try {
			Map<String, String> MovieDetailMap = new HashMap<String, String>();
			Document doc = Jsoup.connect(MovieLink).get();

			Element MVTitle = doc.select(".h_movie a:eq(0)").get(0);
			Elements MVTitles = MVTitle.select("a");
			for(Element e : MVTitles) {
				MovieDetailMap.put("MVTitle", e.text());
			}
			Element summaryValue = doc.select(".info_spec .step1+dd").get(0);
			Elements summaryValues = summaryValue.select("span");
			for(Element e : summaryValues) {
				list.add(e.text());
			}
			
			Element directorValue = doc.select(".info_spec .step2+dd p").get(0);
			Elements directorValues = directorValue.select("a");
			for(Element e : directorValues) {
				MovieDetailMap.put("director", e.text());
			}
			
			Element actorValue = doc.select(".info_spec .step3+dd").get(0);
			Elements actorValues = actorValue.select("p");
			for(Element e : actorValues) {
				MovieDetailMap.put("actor", e.text());
			}
			
			Element gradeValue = doc.select(".info_spec .step4+dd p").get(0);
			Elements gradeValues = gradeValue.select("a");
			for(Element e : gradeValues) {
				MovieDetailMap.put("grade", e.text());
			}
			
			Element storyValue = doc.select(".story_area").get(0);
			Elements storyValues = storyValue.select("p");
			for(Element e : storyValues) {
				MovieDetailMap.put("story", e.text());
			}
			
			MovieDetailMap.put("genre", (String) list.get(0));
			MovieDetailMap.put("country", (String) list.get(1));
			MovieDetailMap.put("runtime", (String) list.get(2));
			MovieDetailMap.put("releaseDate", (String) list.get(3));
			MovieDetailMap.put("MovieLink", MovieLink);
			MovieDetailMap.put("MVInfoSeq", movieUniNum);
			
		}catch(Exception e) {
			e.getLocalizedMessage();
		}
		getMVInfoMap.invalidate();
		return "redirect:loadDetailInfo.do";
	}
	
	@RequestMapping("loadDetailInfo.do")
	public ModelAndView loadDetailInfo(ModelAndView mv) {
		System.out.println("controller loadDetailInfo.do 도착.......................");
		List<MovieDetailVo> detailResult = movieservice.loadMovieDetail();
		mv.addObject("detailResult", detailResult).setViewName("redirect:loadMovie.do");
		return mv;
	}
	
	@RequestMapping("loadDetail.do")
	public ModelAndView loadDetail(ModelAndView mv) {
		System.out.println("loadDetailInfo.do 도착.......................");
		List<MovieDetailVo> detailResult = movieservice.loadMovieDetail();
		mv.addObject("detailResult", detailResult).setViewName("movieBoard/movieDetail");
		return mv;
	}
}