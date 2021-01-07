package com.bgs.pojo;

import lombok.Data;

@Data
public class AllAnswer {

  private Integer answerId;
  private String content;
  private Integer answerIndex;
  private String questionsId;
  private Integer userId;
  private String createTime;

  public Integer getAnswerId() {
    return answerId;
  }

  public void setAnswerId(Integer answerId) {
    this.answerId = answerId;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Integer getAnswerIndex() {
    return answerIndex;
  }

  public void setAnswerIndex(Integer answerIndex) {
    this.answerIndex = answerIndex;
  }

  public String getQuestionsId() {
    return questionsId;
  }

  public void setQuestionsId(String questionsId) {
    this.questionsId = questionsId;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }
}
