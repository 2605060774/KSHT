<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2021/1/6
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增考试</title>
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
    <script src="../../layuiadmin/layui/layui.js"></script>
    <script src="../../js/jquery-3.4.1.min.js"></script>
</head>
<style>
    input.qaz{text-align:center;padding:10px 20px;width:230px;background:darkcyan;color: #FFEEE9EC;}
</style>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <input width="100%" value="设置考试基本信息" class="qaz">
    <input width="100%" value="设计试卷" class="qaz">
    <input width="100%" style="text-left:30px" value="完成发布" class="qaz">
</fieldset>
<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
    <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
</div>
<div class="layui-row">
    <form class="layui-form" lay-filter="form-filters">
        <div class="layui-col-xs12 layui-col-md11">
<div class="layui-inline">
    <label class="layui-form-label">考试时间</label>
    <div class="layui-input-inline">
        <input type="text" name="startTime" id="date1" lay-verify="date" placeholder="选择开始时间" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid">-----</div>
    <div class="layui-input-inline">
        <input type="text" name="endTime" id="date2" lay-verify="date" placeholder="选择结束时间" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-inline">
    <label class="layui-form-label">参考人员</label>
    <div class="layui-input-inline">
        <input type="tel" name="headline" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-inline">
    <label class="layui-form-label">进考场次数</label>
    <div class="layui-input-inline">
        <input type="tel" name="entries" autocomplete="off" class="layui-input">
    </div>
</div>
        </div>
    </form>
</div>
<div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
    <button class="layui-btn site-demo-active" data-type="setPercent">下一步</button>
    <button class="layui-btn site-demo-active" data-type="loading">模拟 loading</button>
</div>
</body>
</html>
<script>
    layui.config({
        base: '../../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table','layer','form', 'layedit', 'laydate','element'], function(){
        var admin = layui.admin
            ,table = layui.table,
            layer = layui.layer;
        var form=layui.form.render()
            ,laydate = layui.laydate
        var $ = layui.jquery
            ,element = layui.element;
        //-----------------------------------------------------------
        //触发事件
        var active = {
            setPercent: function(){
                //设置50%进度
                element.progress('demo', '50%')
            }
            ,loading: function(othis){
                var DISABLED = 'layui-btn-disabled';
                if(othis.hasClass(DISABLED)) return;

                //模拟loading
                var n = 0, timer = setInterval(function(){
                    n = n + Math.random()*10|0;
                    if(n>100){
                        n = 100;
                        clearInterval(timer);
                        othis.removeClass(DISABLED);
                    }
                    element.progress('demo', n+'%');
                }, 300+Math.random()*1000);

                othis.addClass(DISABLED);
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = $(this).data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
        //-----------------------------------------------------------
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#date2'
        });
        //获取路径中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]);
            return null; //返回参数值
            //customId就是路径中的参数
            var id = getUrlParam("id");
        }
    });
    //-----------------------------------------------------------

</script>