package com.army.adminMovieEro;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Test2 {

	public static void main(String[] args) {
		
		try {
			Document doc = Jsoup.connect("https://movie.naver.com/movie/bi/mi/basic.nhn?code=136898").get();
			
			Elements test = doc.select(".article");
			
			System.out.println(test);
			
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}
}