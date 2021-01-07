package com.bgs.pojo;

import lombok.Data;

import java.util.List;

@Data
public class AllQuestions {

  private String questionsId;
  private String questions;
  private Integer answer;
  private Integer type;
  private Integer judgeAnswer;
  private String answerIds;
  private Integer difficulty;
  private Integer isShare;
  private Integer userId;
  private Integer quantity;
  private String createTime;
  private List<AllAnswer> allAnswers;

  public String getQuestionsId() {
    return questionsId;
  }

  public void setQuestionsId(String questionsId) {
    this.questionsId = questionsId;
  }

  public String getQuestions() {
    return questions;
  }

  public void setQuestions(String questions) {
    this.questions = questions;
  }

  public Integer getAnswer() {
    return answer;
  }

  public void setAnswer(Integer answer) {
    this.answer = answer;
  }

  public Integer getType() {
    return type;
  }

  public void setType(Integer type) {
    this.type = type;
  }

  public Integer getJudgeAnswer() {
    return judgeAnswer;
  }

  public void setJudgeAnswer(Integer judgeAnswer) {
    this.judgeAnswer = judgeAnswer;
  }

  public String getAnswerIds() {
    return answerIds;
  }

  public void setAnswerIds(String answerIds) {
    this.answerIds = answerIds;
  }

  public Integer getDifficulty() {
    return difficulty;
  }

  public void setDifficulty(Integer difficulty) {
    this.difficulty = difficulty;
  }

  public Integer getIsShare() {
    return isShare;
  }

  public void setIsShare(Integer isShare) {
    this.isShare = isShare;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public Integer getQuantity() {
    return quantity;
  }

  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
  }

  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }

  public List<AllAnswer> getAllAnswers() {
    return allAnswers;
  }

  public void setAllAnswers(List<AllAnswer> allAnswers) {
    this.allAnswers = allAnswers;
  }
}
