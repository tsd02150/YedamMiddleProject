package com.yedam.product.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class SearchProductNameControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService service = new ProductServiceImpl();
		//String search = seperate(req.getParameter("search"));
		String search = req.getParameter("search");
		List<String> list = new ArrayList<>();
		if(search!="") {
			list = service.searchProductName(search+"%");
		}
		System.out.println(list);
		String json="[";
		for(int i=0;i<list.size();i++) {
			json+="\""+list.get(i)+"\"";
			if(i!=list.size()-1) {
				json+=",";
			}
		}
		json+="]";
		return json+".json";
	}
	
	public String seperate(String string) {
        // 초성 19개
        String[] arr_cho =
                {"ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};

        // 중성 21개
        String[] arr_jung =
                {"ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"};

        // 종성 28개
        String[] arr_jong =
                {"", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};

        StringBuffer sb = new StringBuffer();
        for (int i=0; i<string.length(); i++) {
            char uniVal = string.charAt(i);

            try {
                if (uniVal >= 0xAC00 && uniVal <= 0xD7A3) {
                    uniVal = (char)(uniVal - 0xAC00);
                    char cho = (char)(uniVal / 28 / 21);
                    char jung = (char)(uniVal / 28 % 21);
                    char jong = (char)(uniVal % 28);

                    sb.append(arr_cho[cho]);
                    sb.append(arr_jung[jung]);
                    sb.append(arr_jong[jong]);
                } else {
                    sb.append(uniVal);
                }
            } catch (RuntimeException e) {
                sb.append(uniVal);
            }
        }

        return sb.toString();
    }

}
