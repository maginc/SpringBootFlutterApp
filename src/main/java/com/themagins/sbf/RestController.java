package com.themagins.sbf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

/**
 * @author Andris Magins
 * @created 06-Apr-20
 **/

@org.springframework.web.bind.annotation.RestController
@CrossOrigin(origins = "*")
@RequestMapping("/v1")
public class RestController {
    private static Logger LOG = LoggerFactory.getLogger(RestController.class);

    @CrossOrigin(origins = "*")
    @GetMapping("/randomnumber")
    @ResponseBody
    public String randomnnumber(){
        Random rand = new Random();

        int n = rand.nextInt(50);
        return "{\"value\":" +n+ ",\"operation\" : \"Random number\"}";
    }

}
