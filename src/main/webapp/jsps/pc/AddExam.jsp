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
    .layui-form-item .jqk {
        width: 50px;
    }
    .layui-form-item .danxuan {
        right: 50px;
    }
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
<form class="layui-form" lay-filter="form-filters">
<div class="layui-row" id="one">
        <div class="layui-col-xs12 layui-col-md11">
<div class="layui-inline">
    <label class="layui-form-label">考试时间</label>
    <div class="layui-input-inline">
        <input type="text" name="startTime" id="date1" lay-verify="date" placeholder="选择开始时间" autocomplete="off" class="layui-input">
    </div>

    <div class="layui-input-inline">-----</div>
    <div class="layui-input-inline">
        <input type="text" name="endTime" id="date2" lay-verify="date" placeholder="选择结束时间" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-inline">
    <label class="layui-form-label">进考场次数</label>
    <div class="layui-input-inline">
        <input type="tel" name="entries" autocomplete="off" class="layui-input">
    </div>
</div>
        </div>
</div>



    <div class="layui-row" id="tow">
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-inline">
                <label class="layui-form-label">试卷名称:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="paperName" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md11">
        <div class="layui-inline">
            <label class="layui-form-label">考试分类</label>
            <div class="layui-input-inline">
                <input type="tel" name="entries" autocomplete="off" class="layui-input">
            </div>
        </div>
        </div>
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-inline">
                <label class="layui-form-label">出题方式:</label>
                <div class="layui-input-inline">
                    <label class="layui-form-label">抽选试题</label>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <input lay-filter="switchTest" value="1" type="checkbox" name="like1[read]" lay-skin="primary">
            <label>单选题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>道</label>
            <label>每道题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>分</label>
        </div>
        <div class="layui-form-item">
            <input lay-filter="switchTest" value="2" type="checkbox" name="like1[read]" lay-skin="primary">
            <label>多选题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>道</label>
            <label>每道题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>分</label>
        </div>
        <div class="layui-form-item">
            <input lay-filter="switchTest" value="4" type="checkbox" name="like1[read]" lay-skin="primary">
            <label>填空题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>道</label>
            <label>每道题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>分</label>
        </div>
        <div class="layui-form-item">
            <input lay-filter="switchTest" value="3" type="checkbox" name="like1[read]" lay-skin="primary">
            <label>判断题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>道</label>
            <label>每道题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>分</label>
        </div>
        <div class="layui-form-item">
            <input lay-filter="switchTest" value="5" type="checkbox" name="like1[read]" lay-skin="primary">
            <label>简答题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>道</label>
            <label>每道题</label>
            <input type="tel" class="jqk" name="entries" autocomplete="off">
            <label>分</label>
        </div>
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-inline">
                <label class="layui-form-label">及格分数:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="passScore" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                <input type="tel" name="totalScore" value="满分 100分" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
            <button class="layui-btn site-demo-active" lay-submit lay-filter="btnSubmit" data-type="setPercent">提交</button>
        </div>
    </div>


    <div class="layui-row" id="three">
        <div class="layui-col-xs12 layui-col-md11">
            <div class="layui-inline">
                <label class="layui-form-label">试卷名称:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="headline" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出题方式</label>
                <div class="layui-input-inline">
                    <input type="tel" name="entries" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>





</form>
<div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
    <button class="layui-btn site-demo-active" id="xiayibu" onclick="openModak()" lay-filter="btnSubmit" data-type="setPercent">下一步</button>
</div>




<div id="motaikunag" style="display: none;">
    <div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
        <button class="layui-btn site-demo-active" onclick="chouti()" lay-filter="btnSubmit" data-type="setPercent">固定试卷 </button>
    </div>
    <div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
        <button class="layui-btn site-demo-active" onclick="guding()" lay-submit lay-filter="btnSubmit" data-type="setPercent">抽题试卷</button>
    </div>
    <br/>
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
        $("#tow").hide();
        $("#three").hide();
        //-----------------------------------------------------------
        //触发事件
        var active = {
            setPercent: function(){
                //设置50%进度
                element.progress('demo', '35%')

            },
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
        //----------------------------------------------------------------------
        var xuanzhong;
        form.on('checkbox(switchTest)', function (data) {
            console.log( data );　　//打印当前选择的信息
            if( data.elem.checked){　　　　　　//判断当前多选框是选中还是取消选中
                alert('当前选中');
            }
            var value = data.value;   //获取选中的value值
            xuanzhong=value;
        });
        //----------------------------------------------------------------------
        form.on('submit(btnSubmit)',function (data) {
            console.log(xuanzhong)
            console.log(data)
            $.ajax({
                url:"/pc/AddArticles",
                data:data.field,
                type:"post",
                success:function (data) {
                    if(data){
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        //修改成功后刷新父界面
                        window.parent.location.reload();
                    }else {
                        layer.msg("添加失败");
                    }
                }
            })
        })
    });
    //------------------------------------------------------------------------
    function openModak(){
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'],function () {
            var layer = layui.layer,$=layui.$;
            layer.open({
                type:1,//类型
                area:['400px','300px'],//定义宽和高
                title:'查看详细信息',//题目
                shadeClose:false,//点击遮罩层关闭
                content: $('#motaikunag')//打开的内容
            });
        })
    }
    //-----------------------------------------------------------------------
    function guding(){
        $("#one").hide();
        $("#tow").hide();
        $("#three").show();
        $("#xiayibu").hide();
        $("#motaikunag").hide();
    }
    function chouti(){
        $("#one").hide();
        $("#tow").show();
        $("#three").hide();
        $("#xiayinu").hide();
        $("#motaikunag").hide();
    }

</script>