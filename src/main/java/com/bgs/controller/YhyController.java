package com.bgs.controller;

import com.bgs.pojo.PaperQuestions;
import com.bgs.pojo.Yhy;
import com.bgs.service.YhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/yhy")
public class YhyController {

    @Autowired
    private YhyService yhyService;

    @RequestMapping("/findKszx")
    public List<Yhy> findKszx(@RequestBody Yhy yhy){
        List<Yhy> list=yhyService.findKszx(yhy);
        return list;
    }


    @RequestMapping("/findUser")
    public List<Yhy> findUser(Integer paperId){
        List<Yhy> list=yhyService.findUser(paperId);
        return list;
    }

    @RequestMapping("/updChengji")
    public int updChengji(@RequestBody Yhy yhy){
        int i=yhyService.updChengji(yhy);
        return i;
    }

    @RequestMapping("/SJShow")
    public List<PaperQuestions> SJShow(@RequestBody Map<String,String> map){
        int paperId = Integer.parseInt(map.get("paperId"));
        List<PaperQuestions> list=yhyService.SJShow(paperId);
        return list;
    }
}
