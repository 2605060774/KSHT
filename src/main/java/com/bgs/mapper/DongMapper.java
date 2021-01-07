package com.bgs.mapper;

import com.bgs.pojo.AllAnswer;
import com.bgs.pojo.AllQuestions;
import com.bgs.pojo.AllQuestionsVue;
import com.bgs.pojo.User;

import java.util.List;

public interface DongMapper {
    User selUserInfoByName(User user);

    List<AllQuestions> listAllQuestions(AllQuestions questions);

    Boolean addQuestions(AllQuestionsVue questions);

    Boolean addAnswer(List<AllAnswer> allAnswers);

    List<AllQuestions> shareListQuestions(AllQuestions questions);
}
