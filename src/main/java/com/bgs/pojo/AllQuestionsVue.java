package com.bgs.pojo;

import lombok.Data;

import java.util.List;

@Data
public class AllQuestionsVue {

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
  private List<AllAnswer> allAnswers;


  public void setAnswerIds(String[] choiceAnswerIds) {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < choiceAnswerIds.length; i++) {
      sb.append(choiceAnswerIds[i]);
      if ((i + 1) != choiceAnswerIds.length) {
        sb.append(",");
      }
    }
    this.answerIds = sb.toString();
  }

}
