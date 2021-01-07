package com.bgs.service.impl;

import com.bgs.mapper.YhyMapper;
import com.bgs.pojo.PaperQuestions;
import com.bgs.pojo.Yhy;
import com.bgs.service.YhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class YhyServiceImpl implements YhyService {

    @Resource
    private YhyMapper yhyMapper;

    @Override
    public List<Yhy> findKszx(Yhy yhy) {
        return yhyMapper.findKszx(yhy);
    }

    @Override
    public List<Yhy> findUser(Integer paperId) {
        List<Yhy> list=yhyMapper.findUser(paperId);
        return list;
    }

    @Override
    public int updChengji(Yhy yhy) {
        return yhyMapper.updChengji(yhy);
    }

    @Override
    public List<PaperQuestions> SJShow(int paperId) {
        return yhyMapper.SJShow(paperId);
    }


}
