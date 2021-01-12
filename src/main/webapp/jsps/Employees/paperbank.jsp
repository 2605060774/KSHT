<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷库</title>
    <%--<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap/table/bootstrap-table.js"></script>
    <script src="/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href=/bootstrap/css/bootstrap-tab.css">--%>
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap/table/bootstrap-table.js"></script>
    <script src="/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-tab.css">
    <meta http-equiv="Content-Type" content="application/msword; charset=gb2312"/>
</head>
<body>
<div id="fff">
<%--<input type="hidden" class="form-control" id="userId" name="userId" value="">--%>
<input type="hidden" class="form-control" id="username" name="username" value="">

<div   class="container">
    <div class="row">
        <div class="col-xs-6 col-sm-12">
            共享时间：<input type="date" id="startTime" name="startTime">——<input type="date"
                                                                             id="endTime" name="endTime">
        </div>
        <br>
        <br>
        <div class="col-xs-6 col-sm-6">
            试卷名称：<input type="text" id="paperName" name="paperName" placeholder="试卷名称">
        </div>
        <div class="col-xs-6 col-sm-2">
            内容
            <select id="collectionstates" name="collectionstates">
                <option value="0">全部</option>
                <option value="1">我的收藏</option>
            </select>
        </div>
        <div class="col-xs-6 col-sm-4">
            <input type="button" id="selbysome" value="查询"><input type="button" id="daochu" value="导出"><input type="button" id="clean" value="重置">
        </div>
    </div>
</div>

<table id="selectAllQuestionBankBySome"></table>

<div class="modal fade" id="selectOneQuestionCountOfQuestionBankByPaperID" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">项目信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="SelOneModalForm" novalidate="novalidate">
                    <input type="hidden" id="formpaperoid">
                    <div class="form-group">
                        <div class="col-sm-12" >
                            <table class="table">
                                <caption>
                                    试卷名称：<span id="tabpaperName"></span>&nbsp;&nbsp;&nbsp;创建者：<span id="tabusername"></span>
                                </caption>
                                <thead>
                                <tr>
                                    <th>单选题</th>
                                    <th>多选题</th>
                                    <th>判断</th>
                                    <th>填空</th>
                                    <th>简答</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td id="tabdanxuan"></td>
                                    <td id="tabduoxuan"></td>
                                    <td id="tabpanduan"></td>
                                    <td id="tabtiankong"></td>
                                    <td id="tabjianda"></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="selpaperquestion">查看详情</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>
<script>




    $(function () {
        $.ajax({
            url: "/Employees/insertAssistcollection",
            data: {
            },
            type: "post",
            async:false,
            dataType: "json",
            success: function (data) {
            }
        });
        bootstrapselectAllQuestionAll()
    })

    //全查
    function bootstrapselectAllQuestionAll() {
        var username = $("#username").val()
        $("#selectAllQuestionBankBySome").bootstrapTable({
            url: '/Employees/countType',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            search: true,
            async:false,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return {
                    username: username
                }
            },
            columns: [
                {
                    field: 'checked',
                    checkbox: true,
                    align: 'center',
                }, {
                    field: 'paperName',
                    title: '试卷名称'
                }, {
                    field: 'username',
                    title: '创建者',
                }, {
                    field: 'createTime',
                    title: '共享时间'
                }, {
                    field: 'paperId',
                    title: '试卷ID',
                },{
                    field: 'userId',
                    title: '点赞人',
                },{
                    field: 'assiststates',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperId  +"," + row.userId + ") '>未点赞</a>";
                        } else if (value == 1) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperId+","+ row.userId + ") '>已点赞</a>";
                        }
                    }
                }, {
                    field: 'collectionstates',
                    title: '收藏',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperId + ","+ row.userId +")' >未收藏</a>";
                        } else if (value == 1) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperId + ","+ row.userId + ")' >已收藏</a>";
                        }
                    }
                }, {
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        return "<a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.paperId  +")' >操作</a>";//通过值判断男女
                    }
                }
            ]
        });
    }






    //点赞
    function updateAssistStatus(paperId,userId) {

        $.ajax({
            url: "/Employees/updateAssistStatus",
            data: {
                paperId: paperId,
                userId: userId
            },
            type: "post",
            dataType: "json",
            success: function (data) {

                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {

                    alert("修改失败！")
                }
            }
        });
    }

    //点赞
    function updateAssistStatus(paperId,userId){
        $.ajax({
            url: "/Employees/updateAssistStatus",
            data: {
                paperId: paperId,
                userId: userId
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {
                    alert("修改失败！")
                }
            }
        });
    }

    //收藏
    function updateCollectionStatus(paperId,userId) {

        $.ajax({
            url: "/Employees/updateCollectionStatus",
            data: {
                paperId: paperId,
                userId: userId
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {
                    alert("修改失败！")
                }
            }
        });
    }

    //重置
    $("#clean").click(function () {
        $("#startTime").val("")
        $("#endTime").val("")
        $("#paperName").val("")
        bootstrapselectAllQuestionAll()
    })

    //查询
    $("#selbysome").click(function () {
        $("#selectAllQuestionBankBySome").bootstrapTable("destroy")
        var username = $("#username").val()
        var collectionstates = $("#collectionstates").val()
        var paperName = $("#paperName").val()
        var startTime = $("#startTime").val()
        var endTime = $("#endTime").val()

        //查询
        $("#selectAllQuestionBankBySome").bootstrapTable({
            url: '/Employees/countType',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return {
                    username: username,
                    collectionstates: collectionstates,
                    paperName: paperName,
                    startTime: startTime,
                    endTime: endTime
                }
            },
            columns: [
                {
                    field: 'checked',
                    checkbox: true,
                    align: 'center',
                }, {
                    field: 'paperName',
                    title: '试卷名称'
                }, {
                    field: 'username',
                    title: '创建者',
                }, {
                    field: 'createTime',
                    title: '分享时间'
                }, {
                    field: 'assiststates',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperId  +"," + row.userId + ")' >未点赞</a>";
                        } else if (value == 1) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperId  +"," + row.userId + ")' >已点赞</a>";
                        }
                    }
                }, {
                    field: 'collectionstates',
                    title: '收藏',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperId  +"," + row.userId + ")' >未收藏</a>";
                        } else if (value == 1) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperId  +"," + row.userId + ") '>已收藏</a>";
                        }
                    }
                }, {
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        return "<a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.paperId  +")' >操作</a>";
                    }
                }
            ]
        });
    })

    function selectOneQuestionCountOfQuestionBankByPaperID(paperId) {
        $("#formpaperoid").val(paperId)
        $.ajax({
            url: "/Employees/selectOneQuestionCountOfQuestionBankByPaperID",
            data: {
                paperId: paperId
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    $("#tabusername").html(data.username);
                    $("#tabpaperName").html(data.paperName);
                    $("#tabdanxuan").html(data.danxuan);
                    $("#tabduoxuan").html(data.duoxuan);
                    $("#tabpanduan").html(data.panduan);
                    $("#tabtiankong").html(data.tiankong);
                    $("#tabjianda").html(data.jianda);
                    $("#selectOneQuestionCountOfQuestionBankByPaperID").modal('show');
                }
            }
        });
    }

    $("#selpaperquestion").click(function () {
        var paperId = $("#formpaperoid").val()
        window.location.href = "http://localhost:8080/jsps/Employees/infoShow.jsp?pa="+paperId
    })


    $("#daochu").click(function () {


        var pdf = new jsPDF('', 'pt', 'a4');
        console.log("1")
        pdf.internal.scaleFactor = 2; //调节打印大小，数字越大打印越小
        console.log("2")
        var options = {
            pagesplit: true //设置是否自动分页
        };
        console.log("3")
        $('#fff').css("background", "#fff")//如果导出的pdf为黑色背景，需要将导出的html模块内容背景 设置成白色。
        console.log("4")
        var printHtml = $('#fff').get(0);   // 通过id获取div内容
        console.log(printHtml)
        pdf.addHTML(printHtml, 15, 15, options, function () {
            pdf.save('123.pdf');
        });


    })
</script>
</body>
</html>
