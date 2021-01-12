package com.bgs.controller;

import com.bgs.pojo.LayuiUtil;
import com.bgs.pojo.TestPaper;
import com.bgs.service.PcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/pc")
public class PcController {

    @Autowired
    private PcService pcService;

    @RequestMapping("/AllTestPaper")
    public LayuiUtil<List<TestPaper>> AllTestPaper(@RequestParam(name = "page",required = false) Integer page,
            @RequestParam(name = "limit",required = false) Integer limit){
        LayuiUtil<List<TestPaper>> listLayuiUtil=pcService.AllTestPaper(page,limit);
        return listLayuiUtil;
    }
    @RequestMapping("AddTestPaper")
    public Boolean AddTestPaper(TestPaper testPaper){
        return false;
    }
}