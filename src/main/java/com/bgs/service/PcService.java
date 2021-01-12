package com.bgs.service;

import com.bgs.pojo.LayuiUtil;
import com.bgs.pojo.TestPaper;

import java.util.List;

public interface PcService {
    LayuiUtil<List<TestPaper>> AllTestPaper(Integer page, Integer limit);
}
