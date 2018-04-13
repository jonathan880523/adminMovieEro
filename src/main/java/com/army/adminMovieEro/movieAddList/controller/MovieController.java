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
	
	@RequestMapping(value="/main.do")
	public ModelAndView goMain(ModelAndView mv) {
		System.out.println("main.do 도착....................");
		List<MovieListVo> mainMovieList = new ArrayList<MovieListVo>();
		mainMovieList = movieListService.loadMovieList();
		System.out.println("mainMovieList : " + mainMovieList);
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		List<MovieReviewVo> reviewList = new ArrayList<MovieReviewVo>();
		List<Map<String, Object>> movieInfoList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < mainMovieList.size(); i++) {
			//리스트 불러오기
			mainMovieList = movieListService.loadMovieList();
			//i번째 이름 불러오기
			String movieName = mainMovieList.get(i).getMV_TITLE();
			System.out.println("movieName : " + movieName);
			//i번째 영화 시퀀스 불러오기
			String MVInfoSeq =  mainMovieList.get(i).getMV_INFO_SEQ();
			System.out.println("찾을 seq : " + MVInfoSeq);
			//스틸컷 가져와서 사이즈 구하기
			movieStillcutList = movieVisualService.loadStillcut(MVInfoSeq);
			int stillcutSize = movieStillcutList.size();
			//트레일러 가져와서 사이즈 구하기
			movieTrailerList = movieVisualService.loadTrailer(MVInfoSeq);
			int trailerSize = movieTrailerList.size();
			//리뷰 가져와서 사이즈 구하기
			reviewList = movieReviewService.loadSpecificReview(MVInfoSeq);
			int reviewSize = reviewList.size();
			//영화 정보 맵에 넣기
			Map<String, Object> movieMainMap = new HashMap<String, Object>();
			movieMainMap.put("MVTItle", movieName);
			movieMainMap.put("stillcutSize", stillcutSize);
			movieMainMap.put("trailerSize", trailerSize);
			movieMainMap.put("reviewSize", reviewSize);
			//맵 리스트에 담기
			movieInfoList.add(i, movieMainMap);
			//자료 두 개 비교하기
		}
		
		mv.addObject("movieInfoList", movieInfoList).setViewName("main/index");
		
		return mv;
	}

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
		System.out.println("영화 링크 : " + request.getParameter("resultLink"));
		resultMap.put("resultImage", request.getParameter("resultImage"));

		insertResultMovieService.insertResultMovie(resultMap);
		movieList = movieListService.loadMovieList();
		String sessionSeq = movieList.get(0).getMV_INFO_SEQ();
		String sessionLink = movieList.get(0).getMV_LINK();
		sessionMap.put("sessionSeq", sessionSeq);
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
	public ModelAndView loadVisualItems(HttpServletRequest request, ModelAndView mv, MovieListVo vo, 
			HttpSession visualSession, Map<String, String> visualMap) {
		System.out.println("loadVisualItems.do 도착.......................");
		//영화 제목 불러오기
		String MVInfoSeq = request.getParameter("movieUniNumDel");
		vo = movieListService.loadMovieTitle(MVInfoSeq);
		String MVTitle = vo.getMV_TITLE();
		System.out.println("사진/영상 추가할 영화 : " + MVTitle);
		visualMap.put("MVInfoSeq", MVInfoSeq);
		visualMap.put("MVTitle", MVTitle);
		visualSession.setAttribute("visualMap", visualMap);
		
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		
		movieStillcutList = movieVisualService.loadStillcut(MVInfoSeq);
		movieTrailerList = movieVisualService.loadTrailer(MVInfoSeq);
		
		mv.addObject("resultStillcutList", movieStillcutList)
		  .addObject("resultTrailerList", movieTrailerList)
		  .setViewName("movieBoard/addVisualitems");
		
		return mv;
	}

	// 영화 스틸컷 추가
	@RequestMapping("insertVisualItems.do")
	public String insertVisualItems(HttpServletRequest request, Map<String, String> stillcutMap,
			Map<String, String> trailerMap, HttpSession visualSession, Map<String, String> comeVisualMap) {
		System.out.println("insertVisualItems.do 도착.................");
		comeVisualMap = (Map<String, String>) visualSession.getAttribute("visualMap");
		String MVTitle = comeVisualMap.get("MVTitle");
		String MVInfoSeq = comeVisualMap.get("MVInfoSeq");
		System.out.println("사진/영상 추가할 영화 제목 : " + MVTitle);
		System.out.println("사진/영상 추가할 영화 시퀀스 : " + MVInfoSeq);
		String stillcutURL = request.getParameter("stillcutURL");
		System.out.println("사진URL : " + stillcutURL);
		String trailerURL = request.getParameter("trailerURL");
		System.out.println("영상URL : " + trailerURL);
		String trailerDesc = request.getParameter("trailerDesc");
		System.out.println("영상설명 : " + trailerDesc);
		
		if(!stillcutURL.equals("")) {
			System.err.println("stillcut 입력");
			stillcutMap.put("MVTitle", MVTitle);
			stillcutMap.put("MVInfoSeq", MVInfoSeq);
			stillcutMap.put("StillcutURL", stillcutURL);
			
			movieVisualService.insertStillcut(stillcutMap);
		}else if(!trailerURL.equals("")) {
			System.err.println("trailer 입력");
			trailerMap.put("MVTitle", MVTitle);
			trailerMap.put("MVInfoSeq", MVInfoSeq);
			trailerMap.put("trailerURL", trailerURL);
			trailerMap.put("trailerDesc", trailerDesc);
			
			movieVisualService.insertTrailer(trailerMap);
		}
		
		return "redirect:reloadVisualItems.do";
	}
	
	@RequestMapping("reloadVisualItems.do")
	public ModelAndView reloadVisualItems(ModelAndView mv, HttpSession getVisualSession, 
			Map<String, String> getVisualMap) {
		getVisualMap = (Map<String, String>) getVisualSession.getAttribute("visualMap");
		String MVTitle = getVisualMap.get("MVTitle");
		String MVInfoSeq = getVisualMap.get("MVInfoSeq");
		System.out.println("가져올 시퀀스 : " + MVInfoSeq);
		
		List<MovieVisualVo> movieStillcutList = new ArrayList<MovieVisualVo>();
		List<MovieVisualVo> movieTrailerList = new ArrayList<MovieVisualVo>();
		
		movieStillcutList = movieVisualService.loadStillcut(MVInfoSeq);
		System.out.println("movieStillcutList : " + movieStillcutList);
		movieTrailerList = movieVisualService.loadTrailer(MVInfoSeq);
		System.out.println("movieTrailerList : " + movieTrailerList);
		
		mv.addObject("resultStillcutList", movieStillcutList)
		  .addObject("resultTrailerList", movieTrailerList)
		  .setViewName("movieBoard/addVisualitems");
		
		return mv;
	}
	
	@RequestMapping("deleteVisualItems.do")
	public ModelAndView deleteVisualItems(ModelAndView mv, HttpServletRequest request) {
		System.out.println("deleteVisualItems.do 도착...................");
		String stillcutSeq = request.getParameter("stillcutSeq");
		System.out.println("stillcutSeq : " + stillcutSeq);
		String trailerSeq = request.getParameter("trailerSeq");
		System.out.println("trailerSeq : " + trailerSeq);
		
		if(stillcutSeq != null) {
			movieVisualService.deleteStillcut(stillcutSeq);
		}else if(trailerSeq != null){
			movieVisualService.deleteTrailer(trailerSeq);
		}
		
		mv.setViewName("redirect:reloadVisualItems.do");
		return mv;
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
			
			System.out.println("map의 사이즈 : " + MovieDetailMap.size());
			
			int result = movieDetailServie.addMovieDetail(MovieDetailMap);
			if(result > 0) {
				System.out.println("입력 성공");
			}else {
				System.err.println("입력 실패");
			}
			
		}catch(Exception e) {
			e.getLocalizedMessage();
		}
		getMVInfoMap.invalidate();
		return "redirect:loadDetailInfo.do";
	}
	
	@RequestMapping("loadDetailInfo.do")
	public ModelAndView loadDetailInfo(ModelAndView mv) {
		System.out.println("loadDetailInfo.do 도착.......................");
		List<MovieDetailVo> detailResult = new ArrayList<MovieDetailVo>();
		detailResult = movieDetailServie.loadMovieDetail();
		mv.addObject("detailResult", detailResult).setViewName("redirect:loadMovie.do");
		return mv;
	}
	
	@RequestMapping("loadDetail.do")
	public ModelAndView loadDetail(ModelAndView mv) {
		System.out.println("loadDetailInfo.do 도착.......................");
		List<MovieDetailVo> detailResult = new ArrayList<MovieDetailVo>();
		detailResult = movieDetailServie.loadMovieDetail();
		mv.addObject("detailResult", detailResult).setViewName("movieBoard/movieDetail");
		return mv;
	}
}