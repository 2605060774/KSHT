
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试中心</title>
    <script src="/vue/vue.js"></script>
    <script src="/vue/element/index.js"></script>
    <script src="/vue/axios.js"></script>
    <script src="/vue/qs.js"></script>
    <script src="/js/jquery.js"></script>
    <link rel="stylesheet" href="/vue/element/index.css">
</head>
<body>
<div id="app">

    <el-form :model="form">考试日期：<input type="date" value="开始日期" v-model="form.startTime">——<input type="date" value="结束日期" v-model="form.endTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;试卷名称： <input type="text" v-model="form.paperName"></el-form></br>
    <el-button @click="searchfind"size="medium" type="primary">查询</el-button>
    <el-divider></el-divider>

    <%--考试详情--%>
    <el-dialog title="" :visible.sync="search">
        <el-form :v-model="cj">
            <el-input type="hidden" v-model="cj.paperId"></el-input>
        <el-button @click="updChengji" type="primary" size="medium" style="margin-left: 800px">发布成绩</el-button><br><br>

        <el-table
                :data="tableData3"
                border
                style="width: 100%;">
            <el-table-column
                    align="center"
                    property="paperName"
                    label="试卷名称">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="startTime"
                    label="考试开始时间">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="endTime"
                    label="考试结束时间">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="totalScore"
                    label="总分">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="passScore"
                    label="及格分">
            </el-table-column>
        </el-table>
<br><br>
       <h1>人员列表</h1>
        <el-table
                :data="tableData2"
                border
                style="width: 100%;">
            <el-table-column
                    align="center"
                    property="userName"
                    label="姓名">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="id"
                    label="工号">
            </el-table-column>
            <el-table-column
                    align="center"
                    property="chengji"
                    label="成绩">
            </el-table-column>
            <el-table-column
                    align="center"
                    label="判卷状态">
                <template slot-scope="scope">
                    <p v-if="scope.row.paperStatus==1">未判卷</p>
                    <p v-if="scope.row.paperStatus==2">已判卷</p>
                </template>
            </el-table-column>
            <el-table-column
                    align="center"
                    label="操作">
                <template slot-scope="scope" style="align-content: center">
                    <el-link @click="panjuan(scope.row)" size="small" type="primary"  :disabled="scope.row.paperStatus == 2">去判卷</el-link>
                </template>
            </el-table-column>
        </el-table>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="search = false">关 闭</el-button>
        </div>
    </el-dialog>


    <%--考试中心表格--%>
    <el-table
            :data="tableData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
            border
            style="width: 100%;">
        <el-table-column
                align="center"
                prop="paperId"
                label="序号">
        </el-table-column>
        <el-table-column
                align="center"
                prop="paperName"
                label="试卷名称">
        </el-table-column>
        <el-table-column
                align="center"
                prop="totalScore"
                label="总分">
        </el-table-column>
        <el-table-column
                align="center"
                prop="passScore"
                label="及格分">
        </el-table-column>
        <el-table-column
                align="center"
                prop="startTime"
                label="考试开始时间">
        </el-table-column>
        <el-table-column
                align="center"
                prop="endTime"
                label="考试结束时间">
        </el-table-column>
        <el-table-column
                align="center"
                label="操作">
            <template slot-scope="scope" style="align-content: center">
                <el-link @click="findById(scope.row)" size="small" type="primary">考试详情</el-link>
                <el-link @click=""size="small" type="primary" round>导出试卷</el-link>
            </template>
        </el-table-column>
    </el-table>
    <br>
    <%--分页--%>
    <el-pagination
            background
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[5, 10, 20, 40]"
            :page-size="pagesize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="tableData.length">
    </el-pagination>
</div>
</body>
<script type="text/javascript">
    new Vue({
        el: '#app',
        mounted() {
            var _this=this;
            axios.post('/yhy/findKszx',{
            }).then(function (res)  {
                _this.tableData=res.data;
            }).catch(function (error) {
            });

        },

        data (){
            return{
                currentPage:1, //初始页
                pagesize:5,
                tableData: [],
                tableData2: [],
                tableData3: [],
                handleClick:false,
                dialogTableVisible: false,
                form: {
                    paperName:'',
                    startTime:'',
                    endTime:''
                },
                cj:{
                    paperId:'',
                    paperStatus:''
                },
                search:false,
                openIsDisabled:true
            }
        },
        methods : {
            // 初始页currentPage、初始每页数据数pagesize和数据data
            handleSizeChange: function (size) {
                this.pagesize = size;
                console.log(this.pagesize)  //每页下拉显示数据
            },
            handleCurrentChange: function (currentPage) {
                this.currentPage = currentPage;
                console.log(this.currentPage)  //点击第几页
            },

            //模糊查询
            searchfind: function () {
                var _this = this;
                var paperName = _this.form.paperName;
                var startTime = _this.form.startTime;
                var endTime = _this.form.endTime;
                axios.post('/yhy/findKszx', {
                    paperName: paperName,
                    startTime: startTime,
                    endTime: endTime
                }).then(function (res) {
                    _this.tableData = res.data;
                }).catch(function (error) {
                });
            },

            //考试详情
            findById:function (row) {
                var _this=this;
               this.search=true;
               this.cj=row;
               var paperId=row.paperId;
                axios.post('/yhy/findUser?paperId='+paperId,{
                }).then(function (res)  {
                    _this.tableData3=[];
                    _this.tableData2=res.data;
                    for (var i = 0; i < 1; i++){
                       _this.tableData3.push(res.data[i])
                    }
                }).catch(function (error) {
                });
            },

            //发布成绩
            updChengji:function () {
                  var _this=this;
                 var data=_this.cj
                axios.post('/yhy/updChengji',data, {
                }).then(function (res) {
                    alert("发布成功！")
                    location.reload();
                }).catch(function (error) {
                });
            },


            panjuan:function (row) {
                var _this=this;
                var paperId=row.paperId;
               window.open("${pageContext.request.contextPath}/jsps/yhy/SJShow.jsp?pa="+paperId)

            }

        }
    });
</script>
</html>
