package com.bgs.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TestPaper {

    //试卷id
    private int paperId;
    //试卷名称
    private String paperName;
    //出题方式
    private String paperType;
    //考卷总分
    private int totalScore;
    //考试及格分
    private int passScore;
    //进入考场次数
    private int entries;
    //考试开始时间
    @JsonFormat(pattern = "yyyy-MM-dd  HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    //考试结束时间
    @JsonFormat(pattern = "yyyy-MM-dd  HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    //状态（0未开始，1考试中，2已结束，3已删除）
    private int status;
    //是否发布（0否，1是）
    private int isPublish;
    //判卷人用户id列表,多个id以英文逗号分隔
    private int scoreUserIds;
    //判卷是否结束（0否，1是）
    private int isScoreFinish;
    //创建人用户id
    private int userId;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd  HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

}

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


