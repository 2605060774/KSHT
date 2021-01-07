package com.bgs.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

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