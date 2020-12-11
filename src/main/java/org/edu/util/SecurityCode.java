package org.edu.util;

import org.springframework.stereotype.Controller;
// @Controller class 사용하는 이유: 스프링에서 사용 가능한 bean으로 만들기 위하여
@Controller
public class SecurityCode {
	
	/**
	 * XSS 방지 처리 = cross site script 약자, 교차하여 사이트 스크립트를 방지하는 코드(아래)
	 * @param data
	 * @return
	 */
	
	public String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        String ret = data;
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        return ret;
    }
	
}
