package com.bgs.mapper;

import com.bgs.pojo.TestPaper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PcMapper {
    List<TestPaper> AllTestPaper();
}
