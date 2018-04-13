package com.army.adminMovieEro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test2 {

	public static void main(String[] args) {
		List list = new ArrayList();
		Map MVInfo = new HashMap();
		try {
			Document doc = Jsoup.connect("https://movie.naver.com/movie/bi/mi/basic.nhn?code=75426").get();
			
			Element MVTitle = doc.select(".h_movie a:eq(0)").get(0);
			Elements MVTitles = MVTitle.select("a");
			for(Element e : MVTitles) {
				MVInfo.put("MVTitle", e.text());
			}
			Element summaryValue = doc.select(".info_spec .step1+dd").get(0);
			Elements summaryValues = summaryValue.select("span");
			for(Element e : summaryValues) {
				list.add(e.text());
			}
			
			Element directorValue = doc.select(".info_spec .step2+dd p").get(0);
			Elements directorValues = directorValue.select("a");
			for(Element e : directorValues) {
				MVInfo.put("director", e.text());
			}
			
			Element actorValue = doc.select(".info_spec .step3+dd").get(0);
			Elements actorValues = actorValue.select("p");
			for(Element e : actorValues) {
				MVInfo.put("actor", e.text());
			}
			
			Element gradeValue = doc.select(".info_spec .step4+dd p").get(0);
			Elements gradeValues = gradeValue.select("a");
			for(Element e : gradeValues) {
				MVInfo.put("grade", e.text());
			}
			
			Element storyValue = doc.select(".story_area").get(0);
			Elements storyValues = storyValue.select("p");
			for(Element e : storyValues) {
				MVInfo.put("story", e.text());
			}
			
			
			MVInfo.put("genre", list.get(0));
			MVInfo.put("country", list.get(1));
			MVInfo.put("runtime", list.get(2));
			MVInfo.put("releaseDate", list.get(3));
			
			
			
			
			
			List MVInfoList = new ArrayList();
			MVInfoList.add(MVInfo);
			
			for(int i=0; i < MVInfoList.size(); i++) {
				System.out.println(MVInfoList.get(i));
			}
			
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}
}