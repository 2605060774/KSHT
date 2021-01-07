package com.bgs.pojo;

import lombok.Data;

@Data
public class UserQuestions {

  private Integer id;
  private Integer userId;
  private Integer paperId;
  private String questionsId;
  private String choiceAnswerIds;
  private String choiceBiaoshi;
  private String fillAnswers;
  private String shortAnswer;
  private String judgeAnswer;
  private Integer score;
  private String createTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public Integer getPaperId() {
    return paperId;
  }

  public void setPaperId(Integer paperId) {
    this.paperId = paperId;
  }

  public String getQuestionsId() {
    return questionsId;
  }

  public void setQuestionsId(String questionsId) {
    this.questionsId = questionsId;
  }

  public String getChoiceAnswerIds() {
    return choiceAnswerIds;
  }

  public void setChoiceAnswerIds(String choiceAnswerIds) {
    this.choiceAnswerIds = choiceAnswerIds;
  }

  public String getChoiceBiaoshi() {
    return choiceBiaoshi;
  }

  public void setChoiceBiaoshi(String choiceBiaoshi) {
    this.choiceBiaoshi = choiceBiaoshi;
  }

  public String getFillAnswers() {
    return fillAnswers;
  }

  public void setFillAnswers(String fillAnswers) {
    this.fillAnswers = fillAnswers;
  }

  public String getShortAnswer() {
    return shortAnswer;
  }

  public void setShortAnswer(String shortAnswer) {
    this.shortAnswer = shortAnswer;
  }

  public String getJudgeAnswer() {
    return judgeAnswer;
  }

  public void setJudgeAnswer(String judgeAnswer) {
    this.judgeAnswer = judgeAnswer;
  }

  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }

  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }
}
