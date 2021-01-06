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

}
