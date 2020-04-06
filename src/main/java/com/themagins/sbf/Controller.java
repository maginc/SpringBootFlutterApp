package com.themagins.sbf;


import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Andris Magins
 * @created 06-Apr-20
 **/
@org.springframework.stereotype.Controller
public class Controller {
    @RequestMapping("/")
    public String homePage() {
        return "index";
    }
}
