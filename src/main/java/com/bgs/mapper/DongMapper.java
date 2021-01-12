package com.bgs.mapper;

import com.bgs.pojo.*;

import java.util.List;

public interface DongMapper {
    User selUserInfoByName(User user);

    List<AllQuestions> listAllQuestions(AllQuestions questions);

    Boolean addQuestions(AllQuestionsVue questions);

    Boolean addAnswer(List<AllAnswer> allAnswers);

    List<AllQuestions> shareListQuestions(AllQuestions questions);

    Boolean myQuestionsShang(List<TongQuestions> questions);

    Boolean shareQuestionsXia(List<TongQuestions> questions);
}
