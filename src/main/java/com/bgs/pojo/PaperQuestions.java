package com.bgs.pojo;

import lombok.Data;

@Data
public class PaperQuestions {

  private Integer id;
  private Integer paperId;
  private String questionsId;
  private Integer questionsScore;
  private Integer userId;
  private Integer index;
  private String href;
  private String createTime;
  private AllQuestions allQuestions;
  private UserQuestions userQuestions;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
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

  public Integer getQuestionsScore() {
    return questionsScore;
  }

  public void setQuestionsScore(Integer questionsScore) {
    this.questionsScore = questionsScore;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public Integer getIndex() {
    return index;
  }

  public void setIndex(Integer index) {
    this.index = index;
  }

  public String getHref() {
    return href;
  }

  public void setHref(String href) {
    this.href = href;
  }

  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }

  public AllQuestions getAllQuestions() {
    return allQuestions;
  }

  public void setAllQuestions(AllQuestions allQuestions) {
    this.allQuestions = allQuestions;
  }

  public UserQuestions getUserQuestions() {
    return userQuestions;
  }

  public void setUserQuestions(UserQuestions userQuestions) {
    this.userQuestions = userQuestions;
  }

}
