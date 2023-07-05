<!DOCTYPE HTML>
<html>
<head>
    <title>Topic111</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


    <link rel="stylesheet" href="/index.css">
</head>
<body>
<form action="/topic/add" method="POST">
    <input type="text" name="title" placeholder="请输入 title">
    <br>
    <input type="text" name="content" placeholder="请输入 content">
    <br>
    <button type="submit">添加</button>
</form>

<div>

    <#list topicsByUserId as t>
<#--        <h3>${t.id} : ${t.title}</h3>-->
        <a href="/topic/detail/${t.id}">${t.id} : ${t.title?html}</a>
        <a href="/topic/edit?id=${t.id}">编辑</a>
        <br>
    </#list>

    <div id="main">
        <div id="sidebar">

            <div class="panel">

                <div class="header">
                    <span class="col_fade">个人信息</span>
                </div>
                <div class="inner">
                    <div class="user_card">
                        <div>
                            <a class="user_avatar" href="/topic">
                                <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${username}>
                            </a>
                            <span class="user_name"><a class="dark" href="/user/${username}">${username}</a></span>

                            <div class="board clearfix">
                                <div class="floor">
                                    <span class="big">积分: 50 </span>
                                </div>
                            </div>
                            <div class="space clearfix"></div>
                            <span class="signature">
        “

            这家伙很懒，什么个性签名都没有留下。

        ”
    </span>
                        </div>
                    </div>


                    <script>
                        $(document).ready(function () {
                            $('.follow_btn').click(function () {
                                var $me = $(this);
                                var action = $me.attr('action');
                                var params = {
                                    follow_id: '5a80f10e99ef9fac6b2e6922',
                                    _csrf: 'snWbm17u-ZyLt3t7TfVHk9R6bmaUrvDYKNuQ'
                                };
                                $.post('/user/' + action, params, function (data) {
                                    if (data.status === 'success') {
                                        var $btns = $('.follow_btn');
                                        if (action === 'follow') {
                                            $btns.html('取消关注');
                                            $btns.attr('action', 'un_follow');
                                        } else {
                                            $btns.html('加入关注');
                                            $btns.attr('action', 'follow');
                                        }
                                        $btns.toggleClass('btn-success');
                                    }
                                }, 'json');
                            });
                        });
                    </script>


                </div>

            </div>


            <div class="panel">
                <div class="inner">
                    <a href="/topic/create" id="create_topic_btn">
                        <span class="span-success">发布话题</span>
                    </a>
                </div>
            </div>



        </div>


        <div id="content">
            <div class="panel">
                <div class="header">
                    <ul class="breadcrumb">
                        <li><a href="/">主页</a><span class="divider">/</span></li>
                    </ul>
                </div>
                <div class="inner userinfo">
                    <div class="user_big_avatar">
                        <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" class="user_avatar" title=${username}>
                    </div>
                    <a class="dark">${username}</a>

                    <p class="col_fade">注册时间 3 年前</p>

                </div>
            </div>

            <div class="panel">
                <div class="header">
                    <span class="col_fade">最近创建的话题</span>
                </div>

                <div class="cell">
                    <#list topicsByUserId as t>

                    <a class="user_avatar pull-left" href="/topic">
                        <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${username}>
                    </a>

                    <span class="reply_count pull-left">
    <span class="count_of_replies" title="回复数">
      0
    </span>
    <span class="count_seperator">/</span>
    <span class="count_of_visits" title="点击数">
      184
    </span>
  </span>





                    <span class="last_time pull-right">
      <span class="last_active_time">

          <#assign ct = (.now?long-(t.commentList[0].createdTime*1000)?long)/1000 />
          <#if ct gte 31104000>${(ct/31104000)?int}年前
          <#t><#elseif ct gte 2592000>${(ct/2592000)?int}个月前
          <#t><#elseif ct gte 86400*2>${(ct/86400)?int}天前
          <#t><#elseif ct gte 86400>昨天
          <#t><#elseif ct gte 3600>${(ct/3600)?int}小时前
          <#t><#elseif ct gte 60>${(ct/60)?int}分钟前
          <#t><#elseif ct gt 0>${ct?int}秒前
          <#t><#else>刚刚
          </#if>

<#--          ${((currentTime - t.createdTime)/86400)?int} 天前-->
      </span>
    </span>


                    <div class="topic_title_wrapper">



<#--                        <#list topics as t>-->
                        <a class="topic_title" href="/topic/detail/${t.id}">${t.title?html}

                        </a>
                            <br>
<#--                        </#list>-->
                    </div>
                    </#list>
                </div>



            </div>

            <div class="panel">
                <div class="header">
                    <span class="col_fade">最近参与的话题</span>
                </div>

                <div class="cell">
                    <#list topicsByUserId as u>

                    <a class="user_avatar pull-left" href="/topic">
                        <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${username}>
                    </a>

                    <span class="reply_count pull-left">
    <span class="count_of_replies" title="回复数">
      23
    </span>
    <span class="count_seperator">/</span>
    <span class="count_of_visits" title="点击数">
      4390
    </span>
  </span>


                    <a class="last_time pull-right" href="/topic">
                        <img class="user_small_avatar" src="https://www.kuaibiancheng.com/uploads/avatar/default.gif">
                        <span class="last_active_time">
                            <#assign ct = (.now?long-(u.commentList[0].updatedTime*1000)?long)/1000 />
                            <#if ct gte 31104000>${(ct/31104000)?int}年前
                                <#t><#elseif ct gte 2592000>${(ct/2592000)?int}个月前
                                <#t><#elseif ct gte 86400*2>${(ct/86400)?int}天前
                                <#t><#elseif ct gte 86400>昨天
                                <#t><#elseif ct gte 3600>${(ct/3600)?int}小时前
                                <#t><#elseif ct gte 60>${(ct/60)?int}分钟前
                                <#t><#elseif ct gt 0>${ct?int}秒前
                                <#t><#else>刚刚
                            </#if>

<#--                            ${(currentTime - u.commentList[0].updatedTime)/86400} 天前-->
                        </span>
                    </a>



                    <div class="topic_title_wrapper">

<#--                        <#list topicsByUserId as t>-->
<#--                        &lt;#&ndash;        <h3>${t.id} : ${t.title}</h3>&ndash;&gt;-->
<#--                            <a href="/topic/detail/${t.id}">${t.id} : ${t.title?html}</a>-->
<#--                            <a href="/topic/edit?id=${t.id}">编辑</a>-->
<#--                            <a href="/topic/delete?id=${t.id}&token=${token}">删除</a>-->
<#--                            <br>-->
<#--                        </#list>-->


                        <a class="topic_title" href="/topic/detail/${u.id}">${u.title?html}
                        </a>
                    </div>
                    </#list>
                </div>


            </div>
        </div>


    </div>
</div>
</body>
</html>