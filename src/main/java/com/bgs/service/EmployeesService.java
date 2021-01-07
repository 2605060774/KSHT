package com.bgs.service;

import com.bgs.pojo.PaperQuestions;
import com.bgs.pojo.TestPaper;

import java.util.List;

public interface EmployeesService {

    List<TestPaper> countType(String username, Integer collectionstates, String startTime, String endTime, String paperName);

    void insertAssistcollection();

    //点赞
    int updateAssistStatus(Integer paperId,Integer userId);
    //收藏
    int updateCollectionStatus(Integer paperId,Integer userId);
    //试卷库查询题目数量
    TestPaper selectOneQuestionCountOfQuestionBankByPaperID(Integer paperId);
    //展示试卷
    List<PaperQuestions> PaperQuestions(Integer paperId);
}
