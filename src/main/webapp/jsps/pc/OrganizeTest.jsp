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
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script></head>
<body>
<div class="layui-row">
    <form class="layui-form" lay-filter="form-filters">
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">发布时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startTime" id="date1" lay-verify="date" placeholder="开始时间" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-----</div>
                    <div class="layui-input-inline">
                        <input type="text" name="endTime" id="date2" lay-verify="date" placeholder="结束时间" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">试卷名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="paperName" autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <div class="layui-inline">
                        <label class="layui-form-label">考试状态</label>
                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">全部</option>
                                <option value="0">未开始</option>
                                <option value="1">进行中</option>
                                <option value="2">已结束</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md7">
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
        var admin = layui.admin
            ,table = layui.table,
            layer = layui.layer;
        var form=layui.form.render()
            ,laydate = layui.laydate
            ,element = layui.element;
        //-------------------------------------------------------
        table.render({
            elem: '#test-table-autowidth1'
            ,url: '/pc/AllTestPaper'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']
            ,groups: 1 //只显示 1 个连续页码
            ,first: false //不显示首页
            ,last: false //不显示尾页
            ,cols: [[
                {field:'paperId', width:211, title: '序号', sort: true,align:'center'}
                ,{field:'paperName', width:211, title: '试卷名称',align:'center',sort: true}
                ,{field:'startTime', width:211, title: '考试开始日期', sort: true,align:'center'}
                ,{field:'endTime', width:211, title: '考试结束时间', sort: true,align:'center'}
                ,{field:'status', width:211, title: '状态', sort: true,align:'center',templet:function (data) {
                       if(data.status==0){
                          return "未开始";
                       }else if(data.status==1){
                           return "考试中";
                       }else if(data.status==2){
                           return "已结束";
                       }else if(data.status==3){
                           return "已删除";
                       }
                    }}
                ,{field:'city', width:211, title: '操作',toolbar:'#cz',align:'center'}
            ]]
            ,page: true,
            id:'table1'
        });
        admin.popup({
            content: '演示数据均为静态模拟数据，因此【切换分页和条数时】发现数据未变并非 BUG。实际使用时改成真实接口即可。'
            ,area: '300px'
            ,offset: '15px'
            ,shade: false
            ,id: 'one'
        });
        //监听工具条
        table.on('tool(cha)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'OneArticles'){ //查看
                var id =data.id;
                layer.open({
                    area: ['800px', '800px'],
                    type: 2,
                    content: './OneArticles.jsp?id='+data.id //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            } else if(layEvent === 'compile'){ //编辑

                //同步更新缓存对应的值
                layer.open({
                    area: ['800px', '800px'],
                    type: 2,
                    content: "./compile.jsp?id="+data.id
                });
            }else if(layEvent === 'deleteArticles'){ //删除

                //同步更新缓存对应的值
                layer.open({
                    area: ['800px', '800px'],
                    type: 2,
                    content: "./deleteArticles.jsp?id="+data.id
                });
            }
        });

        //-------------------------------------------------------
    laydate.render({
        elem: '#date1'
    });
    laydate.render({
        elem: '#date2'
    });
    //-------------------------------------------------------------
        tianjia=function() {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 2,//类型
                area: ['' +
                '700px', '700px'],//定义宽和高
                title: '新增文章',//题目
                shadeClose: false,//点击遮罩层关闭
                content: 'AddExam.jsp',//打开的内容  "{:url('addarticle')}"
            });
        }
    });
</script>
<script type="text/html" id="cz">
    <a class="layui-btn layui-btn-xs" lay-event="OneArticles">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="compile">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="deleteArticles">删除</a>
</script>