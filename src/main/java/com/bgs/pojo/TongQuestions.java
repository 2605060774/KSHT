package com.bgs.pojo;

import lombok.Data;

@Data
public class TongQuestions {

    private String questionsId;
    private String questions;
    private String answer;
    private Integer type;
    private Integer judgeAnswer;
    private String answerIds;
    private Integer difficulty;
    private Integer isShare;
    private Integer userId;
    private Integer quantity;
    private String createTime;
    private String startTime;
    private String endTime;
    private String token;
}
