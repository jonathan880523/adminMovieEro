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
			Document doc = Jsoup.connect("https://movie.naver.com/movie/bi/mi/basic.nhn?code=136898").get();
			
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
			
			Element storyValue = doc.select(".story_area").get(0);
			Elements storyValues = storyValue.select("p");
			for(Element e : storyValues) {
				list.add(e.text());
			}
			
			
			MVInfo.put("MVTitle", list.get(0));
			MVInfo.put("genre", list.get(1));
			MVInfo.put("country", list.get(2));
			MVInfo.put("runtime", list.get(3));
			MVInfo.put("releaseDate", list.get(4));
			MVInfo.put("director", list.get(5));
			MVInfo.put("actor", list.get(6));
			MVInfo.put("grade", list.get(7));
			MVInfo.put("story", list.get(8));
			
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