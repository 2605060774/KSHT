<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2020/12/28
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/kao/main.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/kao/test.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vue/element/index.css">
    <script src="${pageContext.request.contextPath}/vue/vue.js"></script>
    <script src="${pageContext.request.contextPath}/vue/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/taizhou/bidhall/resource/commonBaseResource/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/kao/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/kao/jquery.easy-pie-chart.js"></script>
    <!--时间js-->
    <script src="${pageContext.request.contextPath}/kao/time/jquery.countdown.js"></script>
    <title>试卷详情</title>

    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color: #fff;
        }

        .reading h2 {
            width: 100%;
            margin: 20px 0 70px;
            text-align: center;
            line-height: 2;
            font-size: 20px;
            color: #59595b;
        }

        .reading h2 a {
            text-decoration: none;
            color: #59595b;
            font-size: 20px;
        }

        .reading h2 a:hover {
            color: #2183f1;
        }
    </style>
</head>
<body>
    <div id="app" class="main">
        <div class="test_main">
            <div class="nr_left">
                <div class="test">
                    <form action="" method="post">

                        <div class="test_content" v-if="MultipleChoiceLength > 0">
                            <div class="test_content_title">
                                <h2>单选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">{{MultipleChoiceLength}}</i><span>题，</span><span>合计</span><i class="content_fs">{{MultipleChoiceLength*MultipleChoice[0].questionsScore}}</i><span>分</span>
                                </p>
                            </div>
                            <div class="test_content_nr">
                                <ul>
                                    <li :id="item.index" v-for="(item,i) in MultipleChoice">
                                        <%--<input type="hidden" :value="item.questionsScore">
                                        <input type="hidden" :value="item.allQuestions.answer">--%>
                                        <div class="test_content_nr_tt">
                                            <i>{{i+1}}</i><span>({{item.questionsScore}}分)</span><font>{{item.allQuestions.questions}}</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul>

                                                <li class="option" v-for="(answer,a) in item.allQuestions.allAnswers">

                                                    <input type="radio" :value="answer.answerId" class="radioOrCheck" :name="answer.questionsId"
                                                           :id="answer.answerId" disabled="disabled"  v-model="checked"/>


                                                    <label :for="answer.answerId">
                                                        {{biaoshi[a]}}、
                                                        <p class="ue" style="display: inline;">{{answer.content}}</p>
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>


                        <div class="test_content" v-if="MultiSelectLength > 0">
                            <div class="test_content_title">
                                <h2>多选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">{{MultiSelectLength}}</i><span>题，</span><span>合计</span><i class="content_fs">{{MultiSelectLength*MultiSelect[0].questionsScore}}</i><span>分</span>
                                </p>
                            </div>
                            <div class="test_content_nr">
                                <ul>
                                    <li :id="item.index" v-for="(item,i) in MultiSelect">
                                        <input type="hidden" :value="item.questionsScore">
                                        <input type="hidden" :value="item.allQuestions.answer">
                                        <div class="test_content_nr_tt">
                                            <i>{{i+1}}</i><span>({{item.questionsScore}}分)</span><font>{{item.allQuestions.questions}}</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul>

                                                <li class="option" v-for="(answer,a) in item.allQuestions.allAnswers">

                                                    <input type="checkbox" :value="answer.answerId" class="radioOrCheck" :name="answer.questionsId"
                                                           :id="answer.answerId" disabled="disabled"/>


                                                    <label :for="answer.answerId">
                                                        {{biaoshi[a]}}、
                                                        <p class="ue" style="display: inline;">{{answer.content}}</p>
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>


                        <div class="test_content" v-if="estimateLength > 0">
                            <div class="test_content_title">
                                <h2>判断题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">{{estimateLength}}</i><span>题，</span><span>合计</span><i class="content_fs">{{estimateLength*estimate[0].questionsScore}}</i><span>分</span>
                                </p>
                            </div>
                            <div class="test_content_nr">
                                <ul>
                                    <li :id="item.index" v-for="(item,i) in estimate">
                                        <input type="hidden" :value="item.questionsScore">
                                        <input type="hidden" :value="item.allQuestions.answer">
                                        <div class="test_content_nr_tt">
                                            <i>{{i+1}}</i><span>({{item.questionsScore}}分)</span><font>{{item.allQuestions.questions}}</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul>

                                                <li class="option">

                                                    <input type="radio" value="2" class="radioOrCheck" :name="item.questionsId"
                                                    :id="item.allQuestions.allAnswers[0]" disabled="disabled" v-model="checked3"/>


                                                    <label :for="item.allQuestions.allAnswers[0]">
                                                        <p class="ue" style="display: inline;">对</p>
                                                    </label>
                                                </li>

                                                <li class="option">

                                                    <input type="radio" value="1" class="radioOrCheck" :name="item.questionsId"
                                                     :id="item.allQuestions.allAnswers[1]" disabled="disabled" v-model="checked3"/>


                                                    <label :for="item.allQuestions.allAnswers[1]">
                                                        <p class="ue" style="display: inline;">错</p>
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>


                        <div class="test_content" v-if="GapFillingLength > 0">
                            <div class="test_content_title">
                                <h2>填空题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">{{GapFillingLength}}</i><span>题，</span><span>合计</span><i class="content_fs">{{GapFillingLength*GapFilling[0].questionsScore}}</i><span>分</span>
                                </p>
                            </div>
                            <div class="test_content_nr">
                                <ul>
                                    <li :id="item.index" v-for="(item,i) in GapFilling">
                                        <input type="hidden" :value="item.questionsScore">
                                        <input type="hidden" :value="item.allQuestions.answer">
                                        <div class="test_content_nr_tt">
                                            <i>{{i+1}}</i><span>({{item.questionsScore}}分)</span><font>{{item.allQuestions.questions}}</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul<%-- @click="huoqu($event,i+1)"--%>>

                                                <li style="line-height: 35px" v-for="(answer,a) in item.allQuestions.quantity">

                                                    <label>
                                                        {{a+1}}、
                                                        <input   type="text" :name="item.questionsId"
                                                               style="border-bottom: 1px solid #000;border-top: 0px;border-left: 0px;border-right: 0px;outline: none" disabled="disabled" v-model="checked4[a]"/>

                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>


                        <div class="test_content" v-if="ShortAnswerLength > 0">
                            <div class="test_content_title">
                                <h2>简答题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">{{ShortAnswerLength}}</i><span>题，</span><span>合计</span><i class="content_fs">{{ShortAnswerLength*ShortAnswer[0].questionsScore}}</i><span>分</span>
                                </p>
                            </div>
                            <div class="test_content_nr">
                                <ul>
                                    <li :id="item.index" v-for="(item,i) in ShortAnswer">
                                        <input type="hidden" :value="item.questionsScore">
                                        <input type="hidden" :value="item.allQuestions.answer">
                                        <div class="test_content_nr_tt">
                                            <i>{{i+1}}</i><span>({{item.questionsScore}}分)</span><font>{{item.allQuestions.questions}}</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul>

                                                <li class="option" v-for="(answer,a) in item.allQuestions.allAnswers">
                                                    <el-input
                                                            type="textarea"
                                                            autosize
                                                            placeholder="请输入内容"
                                                            v-model="checked5" disabled="disabled">
                                                    </el-input>

                                                    <%--<input type="radio" :value="answer.answerId" class="radioOrCheck" :name="answer.questionsId"
                                                           :id="answer.answerId" />--%>


                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    new Vue({
        el:"#app",
        data(){
            return{
                allQuestions:[],//总题目
                MultipleChoice:[],//单选
                MultipleChoiceLength:'',//单选数量
                MultiSelectLength:'',//多选数量
                estimateLength:'',//判断数量
                GapFillingLength:'',//填空数量
                ShortAnswerLength:'',//简答数量
                MultiSelect:[], //多选
                estimate:[],//判断
                GapFilling:[],//填空
                ShortAnswer:[],//简答
                biaoshi:["A","B","C","D","E","F","G"],//标识
                userPaper: [],//提交给后台的真题数据
                paper:'',
                d:'',
                h:'',
                m:'',
                s:'',
                endt:Date.parse(new Date())+7200000,
                checked:'',
                checked2:'',
                checked3:'',
                checked4:[],
                checked5:''
            }
        },
        methods:{
            getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            },

            PaperQuestions(id){
                var _this=this;
                axios.post('/yhy/SJShow',
                    {
                        "paperId":id,
                    }
                )
                    .then(function (response) {
                        _this.allQuestions=response.data;
                        console.log(response.data);
                        for (var i=0;i<_this.allQuestions.length;i++){
                            response.data[i].index="qu_"+i;
                            response.data[i].href="#"+"qu_"+i;
                            if(response.data[i].allQuestions.type==1){
                                _this.MultipleChoice[_this.MultipleChoice.length]=response.data[i];
                                    _this.checked=response.data[i].userQuestions.choiceAnswerIds;
                            }else if(response.data[i].allQuestions.type==2){
                                _this.MultiSelect[_this.MultiSelect.length]=response.data[i]
                                _this.checked2=response.data[i].userQuestions.choiceAnswerIds
                                console.log(response.data[i].userQuestions.choiceAnswerIds);
                            }else if(response.data[i].allQuestions.type==3){
                                response.data[i].allQuestions.allAnswers[0]="ju_"+i+"0";
                                response.data[i].allQuestions.allAnswers[1]="ju_"+i+"1";
                                _this.estimate[_this.estimate.length]=response.data[i];
                                _this.checked3=response.data[i].userQuestions.judgeAnswer
                                console.log(response.data[i].userQuestions.judgeAnswer);
                              /*  console.log(response.data[i].allQuestions.allAnswers[0]);*/
                            }else if(response.data[i].allQuestions.type==4){
                                response.data[i].allQuestions.quantity=response.data[i].allQuestions.allAnswers[0].content.split(",");
                                _this.GapFilling[_this.GapFilling.length]=response.data[i];
                                 _this.checked4=response.data[i].userQuestions.fillAnswers.split(",")
                                console.log(_this.checked4);
                            }else if(response.data[i].allQuestions.type==5){
                                _this.ShortAnswer[_this.ShortAnswer.length]=response.data[i]
                                _this.checked5=response.data[i].userQuestions.shortAnswer
                                console.log(response.data[i].userQuestions.shortAnswer);
                            }
                            _this.userPaper[i]={paperId: response.data[i].paperId,questionsId:response.data[i].allQuestions.questionsId,choiceAnswerIds:[],choiceBiaoshi:[],fillAnswers:[],shortAnswer:'',judgeAnswer:'',score:0};
                        }
                        console.log(_this.userPaper);
                        _this.MultipleChoiceLength=_this.MultipleChoice.length;
                        _this.MultiSelectLength=_this.MultiSelect.length;
                        _this.estimateLength=_this.estimate.length;
                        _this.GapFillingLength=_this.GapFilling.length;
                        _this.ShortAnswerLength=_this.ShortAnswer.length;
                        setTimeout(function () {
                            for (var i=0;i<_this.MultipleChoice.length;i++){
                                document.getElementById(_this.MultipleChoice[i].userQuestions.choiceAnswerIds).checked=true;
                            }
                            for (var i=0;i<_this.MultiSelect.length;i++){
                                var chk=_this.MultiSelect[i].userQuestions.choiceAnswerIds.split(',');
                                for (let a = 0; a < chk.length; a++) {
                                    document.getElementById(chk[a]).checked=true;
                                }
                            }
                        }, 20)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },



        },
        mounted(){
            var paper=this.getQueryString("pa");
            if(paper!=null && paper!=''){
                this.paper=paper;
                this.PaperQuestions(paper);

            }else{
                // window.location.href = "http://localhost:8080/jsps/JingJiaDaTing/DaTing.jsp"
            }

        }


    })
</script>
</html>
