package com.bgs.pojo;

import lombok.Data;

@Data
public class AllAnswer {

  private String answerId;
  private String content;
  private Integer answerIndex;
  private String completion;
  private String questionsId;
  private Integer userId;
  private String createTime;




  public void setCompletion(String[] completion) {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < completion.length; i++) {
      sb.append(completion[i]);
      if ((i + 1) != completion.length) {
        sb.append(",");
      }
    }
    this.completion = sb.toString();
  }

}
