package com.bgs.controller;

import com.bgs.pojo.AccessTokenDto;
import com.bgs.pojo.AllQuestions;
import com.bgs.pojo.AllQuestionsVue;
import com.bgs.pojo.User;
import com.bgs.service.DongService;
import com.bgs.util.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/dong")
public class DongController {
    @Autowired
    private DongService dongService;

    //登录__生成图片验证码
    @RequestMapping("/autoImage")
    public void autoImage(String image, HttpServletResponse response, HttpSession session) throws IOException {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        //生成随机字符串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        //存入会话session
        //删除以前的
        session.removeAttribute("verCode");
        session.setAttribute("verCode", verifyCode.toLowerCase());
        //生成图片
        int w = 100, h = 38;
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
    }


    //登录__验证图片验证码
    @ResponseBody
    @RequestMapping("/checkCodestext")
    public String checkCodestext(HttpSession session) {
        String verCode = (String) session.getAttribute("verCode");
        return verCode;
    }


    @ResponseBody
    @RequestMapping("/login")
    public List<String> login(@RequestBody User user) throws Exception  {
        List<String> list= dongService.authUserAndCreateToken(user);
        return list;
    }


    @ResponseBody
    @RequestMapping("/listQuestions")
    public List<AllQuestions> listAllQuestions(@RequestBody AllQuestions questions) throws Exception  {
        AccessTokenDto token = dongService.parseAccessToken(questions.getToken());
        questions.setUserId(token.getUserId());
        List<AllQuestions> list= dongService.listAllQuestions(questions);
        return list;
    }

    @ResponseBody
    @RequestMapping("/shareListQuestions")
    public List<AllQuestions> shareListQuestions(@RequestBody AllQuestions questions) throws Exception  {
        AccessTokenDto token = dongService.parseAccessToken(questions.getToken());
        questions.setUserId(token.getUserId());
        List<AllQuestions> list= dongService.shareListQuestions(questions);
        return list;
    }


    @ResponseBody
    @RequestMapping("/addQuestions")
    public Boolean addQuestions(@RequestBody AllQuestionsVue questions) throws Exception  {
        if(questions.getType()==4){
            questions.getAllAnswers().get(0).setContent(questions.getAllAnswers().get(0).getCompletion());
        }
        AccessTokenDto token = dongService.parseAccessToken(questions.getToken());
        questions.setUserId(token.getUserId());
        Boolean flag= dongService.addQuestions(questions);
        return flag;
    }

}
