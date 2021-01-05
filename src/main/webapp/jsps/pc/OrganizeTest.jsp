<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2021/1/5
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织考试</title>
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
    <script src="../../layuiadmin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/taizhou/bidhall/resource/commonBaseResource/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="layui-row">
    <form class="layui-form" lay-filter="form-filters">
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">发布时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startDate" id="date1" lay-verify="date" placeholder="开始时间" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-----</div>
                    <div class="layui-input-inline">
                        <input type="text" name="finish" id="date2" lay-verify="date" placeholder="结束时间" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">试卷名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="headline" autocomplete="off" class="layui-input">
                        <input type="hidden" name="indexs" autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
            <div class="layui-inline">
                <label class="layui-form-label">考试状态</label>
                <div class="layui-input-inline">
                    <input type="tel" name="headline" autocomplete="off" class="layui-input">
                    <input type="hidden" name="indexs" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md5">
            <div>
                <button type="button" lay-filter="btnSubmit1" ONCLICK="tianjia()" class="layui-btn layui-btn-normal">新增考试</button>
                <button type="button" lay-filter="btnSubmit" class="layui-btn layui-btn-normal" lay-submit>查询</button>
                <button type="button3" class="layui-btn">重置</button>
            </div>
        </div>
    </form>
</div>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table class="layui-hide" lay-data="{id:'one'}" id="test-table-autowidth1" lay-filter="cha"></table>
        </div>
    </div>
</body>
</html>
<script>
    layui.config({
        base: '../../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table','layer','form', 'layedit', 'laydate','element','element'], function(){
    laydate.render({
        elem: '#date1'
    });
    laydate.render({
        elem: '#date2'
    });
    });
</script>