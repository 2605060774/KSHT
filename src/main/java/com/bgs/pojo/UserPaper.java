package com.bgs.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserPaper {


    private Integer id;
    //用户id
    private Integer userId;
    //试卷id
    private Integer paperId;
    //主观分
    private String subjectiveScores;
    //客观分
    private String objectiveScore;
    //剩余考试次数
    private Integer entries;
    //创建时间
    private Date createTime;
    //是否通过(是否通过 1通过0不通过)
    private Integer statusUser;
    //
}
