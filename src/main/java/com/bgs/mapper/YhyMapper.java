package com.bgs.mapper;

import com.bgs.pojo.PaperQuestions;
import com.bgs.pojo.Yhy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface YhyMapper {

    List<Yhy> findKszx(Yhy yhy);

    List<Yhy> findUser(Integer paperId);

    int updChengji(Yhy yhy);

    List<PaperQuestions> SJShow(@Param("id")int paperId);
}
