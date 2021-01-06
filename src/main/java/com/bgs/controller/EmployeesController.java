package com.bgs.controller;

import com.bgs.pojo.TestPaper;
import com.bgs.service.EmployeesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/Employees")
public class EmployeesController {

    @Resource
    private EmployeesService employeesService;


    //试卷库展示
    @ResponseBody
    @RequestMapping("/countType")
    public List<TestPaper> countType(String username, Integer collectionstates, String startTime, String endTime, String paperName){

        return employeesService.countType(username,collectionstates,startTime,endTime,paperName);
    }
    //添加点赞列表
    @RequestMapping("insertAssistcollection")
    @ResponseBody
    public void insertAssistcollection(){
        employeesService.insertAssistcollection();
    }


    //点赞
    @RequestMapping("updateAssistStatus")
    @ResponseBody
    public int updateAssistStatus(Integer paperId, Integer userId) {
        System.out.println(userId+"这是userId");
        return employeesService.updateAssistStatus(paperId, userId);
    }
    //收藏
    @RequestMapping("updateCollectionStatus")
    @ResponseBody
    public int updateCollectionStatus(Integer paperId, Integer userId) {
        return employeesService.updateCollectionStatus(paperId, userId);
    }
    //试卷库查询题目数量
    @RequestMapping("selectOneQuestionCountOfQuestionBankByPaperID")
    @ResponseBody
    public TestPaper selectOneQuestionCountOfQuestionBankByPaperID(Integer paperId) {
        return employeesService.selectOneQuestionCountOfQuestionBankByPaperID(paperId);
    }

}
