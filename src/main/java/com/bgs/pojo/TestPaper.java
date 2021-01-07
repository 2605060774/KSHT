package com.bgs.pojo;


import lombok.Data;

@Data

public class TestPaper {

  private long paperId;
  private String paperName;
  private String paperType;
  private long totalScore;
  private long passScore;
  private String entries;

  private java.sql.Timestamp startTime;
  private java.sql.Timestamp endTime;
  private long status;
  private long isPublish;
  private String scoreUserIds;
  private long isScoreFinish;
  private long userId;
  private java.sql.Timestamp createTime;

  //查询题目数量查找创建者
  private String username;

//题型
  private String danxuan;
  private String duoxuan;
  private String panduan;
  private String tiankong;
  private String jianda;

  //点赞  收藏
  private String assiststates;
  private String collectionstates;
}


