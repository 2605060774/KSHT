package com.bgs.service.Impl;

import com.bgs.mapper.EmployeesMapper;
import com.bgs.pojo.TestPaper;
import com.bgs.service.EmployeesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeesServiceImpl implements EmployeesService {

    @Resource
    EmployeesMapper employeesMapper;

    @Override
    public List<TestPaper> countType(String username, Integer collectionstates, String startTime, String endTime, String paperName) {
        return employeesMapper.countType(username,collectionstates,startTime,endTime,paperName);
    }

    @Override
    public void insertAssistcollection() {
        employeesMapper.insertAssistcollection();
    }

    //点赞
    @Override
    public int updateAssistStatus(Integer paperId, Integer userId) {
        return employeesMapper.updateAssistStatus(paperId, userId);
    }
    //收藏
    @Override
    public int updateCollectionStatus(Integer paperId, Integer userId) {
        return employeesMapper.updateCollectionStatus(paperId, userId);
    }
    //试卷库查询题目数量
    @Override
    public TestPaper selectOneQuestionCountOfQuestionBankByPaperID(Integer paperId) {
        return employeesMapper.selectOneQuestionCountOfQuestionBankByPaperID(paperId);
    }
}
