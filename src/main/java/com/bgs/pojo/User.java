package com.bgs.pojo;

import lombok.Data;

@Data
public class User {

  private Integer id;
  private String username;
  private String password;

  private String paperName;
  private java.sql.Timestamp createTime;
  private String assiststates;
  private String collectionstates;
  private Integer paperId;


}
