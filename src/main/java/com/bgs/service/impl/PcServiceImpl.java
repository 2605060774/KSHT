package com.bgs.service.impl;

import com.bgs.mapper.PcMapper;
import com.bgs.service.PcService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PcServiceImpl implements PcService {

    @Resource
    private PcMapper pcMapper;


}
