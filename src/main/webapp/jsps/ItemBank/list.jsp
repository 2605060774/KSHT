<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/1/4
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试题库</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/vue/element/index.css">
<script src="${pageContext.request.contextPath}/vue/vue.js"></script>
<script src="${pageContext.request.contextPath}/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath}/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<body>
    <div id="app">
        <el-button style="margin-left: 30px;" @click="addQuestionsTianjia()" icon="el-icon-plus">添加试题</el-button>

        <span style="margin-left: 30px;"></span>
        试题搜索:
        <el-input
            style="margin-right: 100px;width: 300px"
            placeholder="请输入内容"
            v-model="dimList.questions"
            clearable>
        </el-input>
        试题类型:
        <el-select style="margin-right: 100px" v-model="dimList.type" placeholder="请选择">
            <el-option
                    key="0"
                    label="全部"
                    value="0">
            </el-option>
            <el-option
                    key="1"
                    label="单选题"
                    value="1">
            </el-option>
            <el-option
                    key="2"
                    label="多选题"
                    value="2">
            </el-option>
            <el-option
                    key="3"
                    label="判断题"
                    value="3">
            </el-option>
            <el-option
                    key="4"
                    label="填空题"
                    value="4">
            </el-option>
            <el-option
                    key="5"
                    label="简答题"
                    value="5">
            </el-option>
        </el-select>
        创建时间:
        <el-date-picker
            style="margin-right: 50px"
            v-model="value2"
            type="datetimerange"
            :picker-options="pickerOptions"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            align="right">
        </el-date-picker>
        <el-button @click="chaxun()" icon="el-icon-search">搜索</el-button>
        <el-tabs style="margin-top:12px;">
            <el-tab-pane label="我的题库">
                <el-button @click="tongbu()" icon="el-icon-upload">同步至共享库</el-button>
                <template>
                    <el-table
                            :data="myQuestions.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                            style="width: 100%; height: 79%"
                            @selection-change="mySelectionChange">
                        <el-table-column
                                :selectable="checkSelect"
                                type="selection">
                        </el-table-column>
                        <el-table-column
                                prop="questions"
                                label="试题内容"
                                style="width:600px">
                        </el-table-column>

                        <el-table-column
                                prop="type"
                                label="试题类型">
                            <template scope="scope">
                                <p v-if="scope.row.type=='1'">单选题</p>
                                <p v-if="scope.row.type=='2'">多选题</p>
                                <p v-if="scope.row.type=='3'">判断题</p>
                                <p v-if="scope.row.type=='4'">填空题</p>
                                <p v-if="scope.row.type=='5'">简答题</p>
                            </template>
                        </el-table-column>

                        <el-table-column
                                prop="totalScore"
                                label="标准答案">
                            <template scope="scope">
                                <p v-if="scope.row.type=='1'">
                            <span v-for="(ans,i) in scope.row.allAnswers">
                                <span v-if="scope.row.answer==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                            </span>
                                </p>
                                <p v-if="scope.row.type=='2'">
                            <span v-for="(answer,a) in scope.row.allAnswers">
                                <span v-for="item in scope.row.answerIds.split(',')">
                                    <span v-for="(ans,i) in scope.row.allAnswers">
                                        <span v-if="a==ans.answerIndex-1 && item==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                                    </span>
                                </span>
                            </span>
                                </p>
                                <p v-if="scope.row.type=='3'"><span v-if="scope.row.judgeAnswer==1">错</span><span v-if="scope.row.judgeAnswer==2">对</span></p>
                                <p v-if="scope.row.type=='4'"><span v-for="(item,i) in scope.row.allAnswers">{{item.content}}</span></p>
                                <p v-if="scope.row.type=='5'">{{scope.row.allAnswers[0].content}}</p>
                            </template>
                        </el-table-column>


                        <el-table-column label="操作">
                            <template slot-scope="scope">
                                <el-button
                                        size="mini"
                                        @click="chakan(scope.row)">查看</el-button>
                                <el-button
                                        size="mini"
                                        @click="startKao(scope.row)">编辑</el-button>
                                <el-button
                                        size="mini"
                                        @click="startKao(scope.row)">删除</el-button>

                            </template>
                        </el-table-column>

                    </el-table>
                    <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChange"
                            :page-sizes="[5, 10, 15]"
                            :page-size="pagesize"
                            :current-page="currentPage"
                            layout="total, sizes, prev, pager, next, jumper"
                            style="text-align:center"
                            :total="myQuestions.length">
                    </el-pagination>
                </template>
            </el-tab-pane>
            <el-tab-pane label="共享题库">
                <el-button style="" @click="xiazai()" icon="el-icon-download">添加到我的题库</el-button>
                <template>
                    <el-table
                            :data="shareQuestions.slice((currentPages-1)*pagesize,currentPages*pagesize)"
                            style="width: 100%; height: 79%"
                            @selection-change="shareSelectionChange">
                        <el-table-column
                                :selectable="shareCheckSelect"
                                type="selection">
                        </el-table-column>
                        <el-table-column
                                prop="questions"
                                label="试题内容"
                                style="width:600px">
                        </el-table-column>

                        <el-table-column
                                prop="type"
                                label="试题类型">
                            <template scope="scope">
                                <p v-if="scope.row.type=='1'">单选题</p>
                                <p v-if="scope.row.type=='2'">多选题</p>
                                <p v-if="scope.row.type=='3'">判断题</p>
                                <p v-if="scope.row.type=='4'">填空题</p>
                                <p v-if="scope.row.type=='5'">简答题</p>
                            </template>
                        </el-table-column>

                        <el-table-column
                                prop="totalScore"
                                label="标准答案">
                            <template scope="scope">
                                <p v-if="scope.row.type=='1'">
                            <span v-for="(ans,i) in scope.row.allAnswers">
                                <span v-if="scope.row.answer==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                            </span>
                                </p>
                                <p v-if="scope.row.type=='2'">
                            <span v-for="(answer,a) in scope.row.allAnswers">
                                <span v-for="item in scope.row.answerIds.split(',')">
                                    <span v-for="(ans,i) in scope.row.allAnswers">
                                        <span v-if="a==ans.answerIndex-1 && item==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                                    </span>
                                </span>
                            </span>
                                </p>
                                <p v-if="scope.row.type=='3'"><span v-if="scope.row.judgeAnswer==1">错</span><span v-if="scope.row.judgeAnswer==2">对</span></p>
                                <p v-if="scope.row.type=='4'"><span v-for="(item,i) in scope.row.allAnswers">{{item.content}}</span></p>
                                <p v-if="scope.row.type=='5'">{{scope.row.allAnswers[0].content}}</p>
                            </template>
                        </el-table-column>


                        <el-table-column label="操作">
                            <template slot-scope="scope">
                                <el-button
                                        size="mini"
                                        @click="chakan(scope.row)">查看</el-button>
                                <el-button
                                        size="mini"
                                        @click="startKao(scope.row)">编辑</el-button>
                                <el-button
                                        size="mini"
                                        @click="startKao(scope.row)">删除</el-button>

                            </template>
                        </el-table-column>

                    </el-table>
                    <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChanges"
                            :page-sizes="[5, 10, 15]"
                            :page-size="pagesize"
                            :current-page="currentPages"
                            layout="total, sizes, prev, pager, next, jumper"
                            style="text-align:center"
                            :total="shareQuestions.length">
                    </el-pagination>
                </template>
            </el-tab-pane>
        </el-tabs>


        <el-dialog
                title="提示"
                :visible.sync="chakanDrawer"
                width="30%"
                center>
            <%--<input @keyup="dongdong" v-model="input" placeholder="请输入内容">
            <span v-for="(ans,i) in aaa"><el-input placeholder="请输入内容"></el-input></span>
--%>
            <div style="margin-left: 20px">
                <div>
                    <div style="vertical-align: top;display:inline-block;">试题内容:</div>

                    <div style="vertical-align: top;display:inline-block;margin-left:10px;">
                        {{myQuestionsId.questions}}
                        <div style="margin-top: 15px" v-if="myQuestionsId.type==1 || myQuestionsId.type==2" v-for="(item,index) in myQuestionsId.allAnswers">{{biaoshi[item.answerIndex-1]}}、{{item.content}}</div>
                    </div>
                </div>
                <div style="margin-top: 10px;">
                    <span style="margin-right: 10px">正确答案:</span>
                    <span v-if="myQuestionsId.type=='1'">
                            <span v-for="(ans,i) in myQuestionsId.allAnswers">
                                <span v-if="myQuestionsId.answer==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                            </span>
                    </span>
                    <span v-if="myQuestionsId.type=='2'">
                        <span v-for="(answer,a) in myQuestionsId.allAnswers">
                            <span v-for="item in myQuestionsId.answerIds.split(',')">
                                <span v-for="(ans,i) in myQuestionsId.allAnswers">
                                    <span v-if="a==ans.answerIndex-1 && item==ans.answerId">{{biaoshi[ans.answerIndex-1]}}</span>
                                </span>
                            </span>
                        </span>
                    </span>
                    <span v-if="myQuestionsId.type=='3'"><span v-if="myQuestionsId.judgeAnswer==1">错</span><span v-if="myQuestionsId.judgeAnswer==2">对</span></span>
                    <span v-if="myQuestionsId.type=='4'"><span v-for="(item,i) in myQuestionsId.allAnswers">{{item.content}}</span></span>
                    <span v-if="myQuestionsId.type=='5'">{{myQuestionsId.allAnswers[0].content}}</span>
                </div>
                <div style="margin-top: 10px;">
                    <span style="margin-right: 10px">试题类型:</span>
                    <span v-if="myQuestionsId.type=='1'">单选题</span>
                    <span v-if="myQuestionsId.type=='2'">多选题</span>
                    <span v-if="myQuestionsId.type=='3'">判断题</span>
                    <span v-if="myQuestionsId.type=='4'">填空题</span>
                    <span v-if="myQuestionsId.type=='5'">简答题</span>
                </div>
                <div style="margin-top: 10px;">
                    <span style="margin-right: 10px">创建时间:</span>
                    <span>{{myQuestionsId.createTime}}</span>
                </div>
            </div>
            <span slot="footer" class="dialog-footer">
    <el-button @click="chakanDrawer = false">取 消</el-button>
    <el-button type="primary" @click="chakanDrawer = false">确 定</el-button>
  </span>
        </el-dialog>




        <el-dialog
                title="新增试题"
                :visible.sync="addQuestionsDialog"
                width="30%"
                center>
            <%--<input @keyup="dongdong" v-model="input" placeholder="请输入内容">
            <span v-for="(ans,i) in aaa"><el-input placeholder="请输入内容"></el-input></span>
--%>
                <el-form
                        :model="addQuestions"
                        ref="addQuestions"
                        label-width="80px"
                >
                    <el-form-item
                            label="试题类型">
                        <el-select style="margin-right: 100px" @change="addQuestionsType()" v-model="addQuestions.type" placeholder="请选择">
                            <el-option
                                    key="0"
                                    label="请选择"
                                    value="0">
                            </el-option>
                            <el-option
                                    key="1"
                                    label="单选题"
                                    value="1">
                            </el-option>
                            <el-option
                                    key="2"
                                    label="多选题"
                                    value="2">
                            </el-option>
                            <el-option
                                    key="3"
                                    label="判断题"
                                    value="3">
                            </el-option>
                            <el-option
                                    key="4"
                                    label="填空题"
                                    value="4">
                            </el-option>
                            <el-option
                                    key="5"
                                    label="简答题"
                                    value="5">
                            </el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item
                            label="试题内容">
                        <el-input type="textarea" v-model="addQuestions.questions"></el-input>
                    </el-form-item>

                    <el-form-item
                            label="答案选项"
                            v-if="addQuestions.type=='1'"
                            >
                        <div style="margin-top: 10px" v-for="item in addQuestions.allAnswers">
                            <el-radio v-model="addQuestions.answer" :label="item.answerId" border>{{biaoshi[item.answerIndex-1]}}</el-radio>
                            <el-input style="width: 300px" v-model="item.content"></el-input>
                        </div>

                    </el-form-item>

                    <el-form-item
                            label="答案选项"
                            v-if="addQuestions.type=='2'">
                        <el-button style="margin-left: 270px" @click="addQuestionsCheckbox()" type="primary">添加选项</el-button>
                        <div style="margin-top: 10px" v-for="(item,i) in addQuestions.allAnswers">
                            <el-checkbox v-model="addQuestions.answerIds" :label="item.answerId" border>{{biaoshi[item.answerIndex-1]}}</el-checkbox >
                            <el-input style="width: 300px" v-model="item.content"></el-input>
                            <el-button type="danger" icon="el-icon-delete" @click="addQuestionsCheckboxDel(i)" circle></el-button>
                        </div>
                    </el-form-item>

                    <el-form-item
                            label="答案选项"
                            v-if="addQuestions.type=='3'">
                        <el-radio v-model="addQuestions.judgeAnswer" label="1" border>错</el-radio>
                        <el-radio v-model="addQuestions.judgeAnswer" label="2" border>对</el-radio>

                    </el-form-item>

                    <el-form-item
                            label="答案"
                            v-if="addQuestions.type=='4'">
                        <el-button style="margin-left: 280px" @click="addQuestionsCheckbox()" type="primary">添加选项</el-button>
                        <div style="margin-top: 10px" v-for="(item,i) in addQuestions.allAnswers[0].completion">
                            <span>填空题{{i+1}}答案</span>
                            <el-input style="width: 300px" v-model="addQuestions.allAnswers[0].completion[i]"></el-input>
                            <el-button type="danger" icon="el-icon-delete" @click="addQuestionsCheckboxDel(i)" circle></el-button>
                        </div>
                    </el-form-item>

                    <el-form-item
                            label="答案"
                            v-if="addQuestions.type=='5'">
                        <el-input type="textarea" style="width: 300px" v-model="addQuestions.allAnswers[0].content" autosize></el-input>
                    </el-form-item>

                    <el-form-item
                            label="是否共享">
                        <el-switch
                                v-model="addQuestions.isShare"
                                style="margin-top: 13px"
                                active-text="共享"
                                inactive-text="不共享"
                                active-value="1"
                                inactive-value="0">
                        </el-switch>
                    </el-form-item>
                </el-form>

            <span slot="footer" class="dialog-footer">
                <el-button @click="addQuestionsDialog = false">取 消</el-button>
                <el-button type="primary" @click="addQuestionsTian()">确 定</el-button>
            </span>
        </el-dialog>


    </div>
</body>
<script>
    new Vue({
        el:'#app',
        data(){
            return{
                dimList:{
                    questions:'',
                    type:'0',
                    startTime:'',
                    token:'',
                    endTime:''
                },
                input:'0',
                userId:0,
                myQuestions:[],
                shareQuestions:[],
                myQuestionsShang:[],
                shareQuestionsXia:[],
                aaa:[],
                addQuestions:{
                    questionsId:'',
                    questions:'',
                    token:'',
                    answer:'',
                    type:'',
                    judgeAnswer:'',
                    answerIds:[],
                    difficulty:'',
                    isShare:'',
                    userId:'',
                    allAnswers:[]
                },
                allAnswersDuiXiang:{
                    answerId:'',
                    content:'',
                    answerIndex:'',
                    questionsId:'',
                    userId:''
                },
                myQuestionsId:{

                },
                biaoshi:['A','B','C','D','E','F','G'],
                pagesize: 5,
                chakanDrawer: false,
                addQuestionsDialog: false,
                currentPage: 1,
                currentPages: 1,
                pickerOptions: {
                    shortcuts: [{
                        text: '最近一周',
                        onClick(picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近一个月',
                        onClick(picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近三个月',
                        onClick(picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            picker.$emit('pick', [start, end]);
                        }
                    }]
                },
                value1: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
                value2: ''
            }
        },
        methods:{
            handleClick(tab, event) {
                console.log(tab, event);
            },

            mySelectionChange(val) {
                this.myQuestionsShang=val;
            },

            shareSelectionChange(val) {
                this.shareQuestionsXia=val;
            },
            tongbu(){
                var _this=this;
                axios.post('/dong/myQuestionsShang',{
                    questions:JSON.stringify(_this.myQuestionsShang)
                })
                    .then(function (response) {
                        _this.list();
                        _this.shareList();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            xiazai(){
                var _this=this;
                axios.post('/dong/shareQuestionsXia',{
                    questions:JSON.stringify(_this.shareQuestionsXia),
                    token:sessionStorage.getItem("Token")
                })
                    .then(function (response) {
                        _this.list();
                        _this.shareList();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            /*dongdong:function(){
                var _this=this;
                _this.aaa=[];
                for (let i = 0; i < _this.input.split('()').length - 1; i++) {
                    _this.aaa.push("11");
                }
                console.log("ad");
                console.log("ad");
            },*/
            /**
             * row：当前行数据
             * index：当前第几位
             */
            checkSelect (row,index) {
                let isChecked = true;
                if (row.isShare == 0) { // 判断里面是否存在某个参数
                    isChecked = true
                } else {
                    isChecked = false
                }
                return isChecked
            },

            shareCheckSelect (row,index) {
                let isChecked = true;
                var _this=this;
                /*for (let i = 0; i <_this.myQuestions.length; i++) {
                    if(row.questionsId=='68de_1610005374409_81428' && _this.myQuestions[i].questionsId=='68de_1610005374409_81428'){
                        console.log(_this.myQuestions[i].questionsId);
                        console.log(row.questionsId);
                    }
                    if (_this.myQuestions[i].questionsId==row.questionsId && _this.userId==row.userId) { // 判断里面是否存在某个参数
                        isChecked = true
                    } else {
                        isChecked = false
                    }
                }*/
                return isChecked
            },
            addQuestionsCheckboxDel(i){
                var _this=this;
                if(_this.addQuestions.type==2){
                    if(_this.addQuestions.allAnswers.length<=3){
                        _this.$message({
                            showClose: true,
                            message: '多选题最少三个选项',
                            type: 'error'
                        });
                    }else{
                        _this.addQuestions.allAnswers.splice(i,1);
                        for (let i = 0; i < _this.addQuestions.allAnswers.length; i++) {
                            _this.addQuestions.allAnswers[i].answerIndex=i+1
                        }
                    }
                }else if(_this.addQuestions.type==4){
                    if(_this.addQuestions.allAnswers[0].completion.length<=1){
                        _this.$message({
                            showClose: true,
                            message: '填空题最少一个空',
                            type: 'error'
                        });
                    }else{
                        _this.addQuestions.allAnswers[0].completion.splice(i,1);
                        for (let i = 0; i < _this.addQuestions.allAnswers.length; i++) {
                            _this.addQuestions.allAnswers[i].answerIndex=i+1
                        }
                    }
                }

            },
            addQuestionsCheckbox(){
                var _this=this;
                if(_this.addQuestions.type==4){
                    _this.addQuestions.allAnswers[0].completion.push("");
                    console.log(_this.addQuestions.allAnswers[0].completion)
                }else{
                    _this.addQuestions.allAnswers.push({answerId:_this.suiji(),answerIndex:_this.addQuestions.allAnswers.length+1,content:'',questionsId:_this.addQuestions.questionsId});
                }
            },
            addQuestionsTian(){
                var _this=this;
                axios.post('/dong/addQuestions',_this.addQuestions)
                    .then(function (response) {
                        _this.list();
                        _this.shareList();
                        _this.addQuestionsDialog=false;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            suiji(){
                return (Math.random() * 10000000).toString(16).substr(0, 4) + '_' + (new Date()).getTime() + '_' + Math.random().toString().substr(2, 5);
            },
            addQuestionsType(){
                var _this=this;
                _this.addQuestions.allAnswers=[];
                console.log(_this.addQuestions.questionsId);
                if(_this.addQuestions.type==1){
                    for (let i = 0; i < 4; i++) {
                        setTimeout(() => {
                            console.log(_this.suiji());
                        },100);
                        _this.addQuestions.allAnswers.push({answerId:_this.suiji(),answerIndex:i+1,content:'',questionsId:_this.addQuestions.questionsId});
                    }
                }else if(_this.addQuestions.type==2){
                    for (let i = 0; i < 3; i++) {
                        setTimeout(() => {
                            console.log(_this.suiji());
                        },100);
                        _this.addQuestions.allAnswers.push({answerId:_this.suiji(),answerIndex:i+1,content:'',questionsId:_this.addQuestions.questionsId});
                    }
                }else if(_this.addQuestions.type==4){
                    var anId=_this.suiji();
                    _this.addQuestions.answer=anId;
                    _this.addQuestions.allAnswers.push({answerId:anId,answerIndex:1,content:'',completion:[],questionsId:_this.addQuestions.questionsId});
                    _this.addQuestions.allAnswers[0].completion.push("")
                }else if(_this.addQuestions.type==5){
                    _this.addQuestions.answer=_this.suiji();
                    _this.addQuestions.allAnswers.push({answerId:_this.addQuestions.answer,answerIndex:1,content:'',questionsId:_this.addQuestions.questionsId});
                }

              console.log(_this.addQuestions.allAnswers);
            },
            addQuestionsTianjia(){
                var _this=this;
                _this.addQuestions.questionsId=_this.suiji();
                _this.addQuestions.token=sessionStorage.getItem("Token");
                console.log(_this.addQuestions.questionsId);
                _this.addQuestionsDialog=true;
            },
            chakan(row){
                var _this=this;
                _this.myQuestionsId=row;
                console.log(row);
                _this.chakanDrawer=true;
            },
            list(){
                var _this=this;
                _this.dimList.token=sessionStorage.getItem("Token");
                axios.post('/dong/listQuestions',_this.dimList)
                    .then(function (response) {
                        _this.myQuestions=response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            shareList(){
                var _this=this;
                _this.dimList.token=sessionStorage.getItem("Token");
                axios.post('/dong/shareListQuestions',_this.dimList)
                    .then(function (response) {
                        console.log(response.data);
                        _this.shareQuestions=response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            dateToString(date) {
                const year = date.getFullYear();
                let month = date.getMonth() + 1;
                let day = date.getDate();
                let hour = date.getHours();
                let minute = date.getMinutes();
                let second = date.getSeconds();
                month = month > 9 ? month : ('0' + month);
                day = day > 9 ? day : ('0' + day);
                hour = hour > 9 ? hour : ('0' + hour);
                minute = minute > 9 ? minute : ('0' + minute);
                second = second > 9 ? second : ('0' + second);
                const dateTime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
                return dateTime;
            },
            chaxun(){
                var _this=this;
                if(this.value2.length>0){
                    _this.dimList.startTime=this.dateToString(this.value2[0]);
                    _this.dimList.endTime=this.dateToString(this.value2[1]);
                }
                _this.currentPage=1;
                _this.currentPages=1;
                _this.list();
                _this.shareList();
            },
            handleCurrentChange(cpage) {
                this.currentPage = cpage;
            },
            handleCurrentChanges(cpage) {
                this.currentPages = cpage;
            },
            handleSizeChange(psize) {
                this.pagesize = psize;
            },
        },
        mounted(){
            this.list();
            this.shareList();
            var _this=this;
            axios.post('/dong/parseAccessToken',{
                token:sessionStorage.getItem("Token")
            })
                .then(function (response) {
                    _this.userId=response.data;
                    console.log(response.data)
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</html>
