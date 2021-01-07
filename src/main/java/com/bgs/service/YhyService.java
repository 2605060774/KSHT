package com.bgs.service;

import com.bgs.pojo.PaperQuestions;
import com.bgs.pojo.Yhy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface YhyService {

    List<Yhy> findKszx(Yhy yhy);

    List<Yhy> findUser(Integer paperId);

    int updChengji(Yhy yhy);

    List<PaperQuestions> SJShow(int paperId);


}
