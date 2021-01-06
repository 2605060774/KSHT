package com.bgs.mapper;

import com.bgs.pojo.TestPaper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeesMapper {

    /*试卷库列表查*/
    List<TestPaper> countType(@Param("username")String username, @Param("collectionstates")Integer collectionstates, @Param("startTime") String startTime, @Param("endTime")String endTime, @Param("paperName")String paperName);

    void insertAssistcollection();

    //点赞
    int updateAssistStatus(@Param("paperId") Integer paperId, @Param("userId") Integer userId);
    //收藏
    int updateCollectionStatus(@Param("paperId") Integer paperId, @Param("userId") Integer userId);
    //试卷库查询题目数量
    TestPaper selectOneQuestionCountOfQuestionBankByPaperID(@Param("paperId") Integer paperId);
}
