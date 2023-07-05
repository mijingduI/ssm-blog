<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>

    <link rel="stylesheet" href="index.css">
</head>
<body>
    <div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="/static">

                <img src="//static2.cnodejs.org/public/images/cnodejs_light.svg">

            </a>

            <form id="search_form" class="navbar-search" action="/search">
                <input type="text" id="q" name="q" class="search-query span3" value="">
            </form>
            <ul class="nav pull-right">
                <li><a href="/static">主页</a></li>

                <li><a href="/register">注册</a></li>
                <li><a href="/login">登陆</a></li>

                <li><a href="/todo">TODO</a></li>

            </ul>
            <a class="btn btn-navbar" id="responsive-sidebar-trigger">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
        </div>
    </div>
</div>

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
                                <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif">
                            </a>
                            <span class="user_name"><a class="dark" href="/user/${username}">${username}</a></span>

                            <div class="board clearfix">
                                <div class="floor">
                                    <span class="big">积分: 0 </span>
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

                    <a href="/" class="topic-tab current-tab">全部</a>

                    <a href="/good" class="topic-tab ">精华</a>

                    <a href="/share" class="topic-tab ">分享</a>

                    <a href="/ask" class="topic-tab ">问答</a>


                </div>

                <div class="inner no-padding">
                    <div id="topic_list">
                        <#list topicsAll as t>
                        <div class="cell">

                            <a class="user_avatar pull-left" href="/user/${username}">
                                <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${username}>
                            </a>

                            <span class="reply_count pull-left">
    <span class="count_of_replies" title="回复数">
      6
    </span>
    <span class="count_seperator">/</span>
    <span class="count_of_visits" title="点击数">
      394
    </span>
  </span>


                            <a class="last_time pull-right" href="/topic/6099dc3b4d20cb309b6921d8#609f57594d20cbd6ed693785">
                                <img class="user_small_avatar" src="https://www.kuaibiancheng.com/uploads/avatar/default.gif">
                                <span class="last_active_time">10 小时前</span>
                            </a>



                            <div class="topic_title_wrapper">





                                <a class="topic_title" href="/topic/detail/${t.id}">${t.title?html}
                                </a>
                            </div>
                        </div>
                        </#list>



                    </div>
                    <div class="pagination" current_page="1">
                        <ul>


                            <li class="disabled"><a>«</a></li>








                            <li class="disabled active"><a>1</a></li>



                            <li><a href="/static?tab=all&amp;page=2">2</a></li>



                            <li><a href="/static?tab=all&amp;page=3">3</a></li>



                            <li><a href="/static?tab=all&amp;page=4">4</a></li>



                            <li><a href="/static?tab=all&amp;page=5">5</a></li>




                            <li><a>...</a></li>



                            <li><a href="/?tab=all&amp;page=17">»</a></li>

                        </ul>
                    </div>
                    <script>
                        $(document).ready(function () {
                            var $nav = $('.pagination');
                            var current_page = $nav.attr('current_page');
                            if (current_page) {
                                $nav.find('li').each(function () {
                                    var $li = $(this);
                                    var $a = $li.find('a');
                                    if ($a.html() == current_page) {
                                        $li.addClass('active');
                                        $a.removeAttr('href');
                                    }
                                });
                            }
                        });
                    </script>

                </div>

            </div>
        </div>

    </div>





</body>
</html>