package com.bgs.service.impl;

import com.bgs.mapper.PcMapper;
import com.bgs.pojo.LayuiUtil;
import com.bgs.pojo.TestPaper;
import com.bgs.service.PcService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PcServiceImpl implements PcService {

    @Resource
    private PcMapper pcMapper;

    @Override
    public LayuiUtil<List<TestPaper>> AllTestPaper(Integer page, Integer limit) {
        LayuiUtil layuiUtil=new LayuiUtil();
        try{
            //帮我们生成分页语句,底层帮我们修改sql语句
            PageHelper.startPage(page, limit);
            List<TestPaper> list =pcMapper.AllTestPaper();
            //返回给客户端展示的数据
            PageInfo<TestPaper> pageInfo=new PageInfo<>(list);
            System.out.println("listSharingArticle"+pageInfo);
            layuiUtil.setMsg("获取成功");
            layuiUtil.setData(pageInfo.getList());
            layuiUtil.setCount(Integer.parseInt(pageInfo.getTotal()+""));
            layuiUtil.setCode(0);
        }catch (Exception e){
            return new LayuiUtil<>(200,e.getMessage(),0,null);
        }
        return layuiUtil;
    }
}
