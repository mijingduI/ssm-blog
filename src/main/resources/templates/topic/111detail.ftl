<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${topic.title}</title>
    <link rel="stylesheet" href="/index.css">
</head>

<body>
<!-- navbar -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="/">

                <img src="//static2.cnodejs.org/public/images/cnodejs_light.svg">

            </a>

            <form id="search_form" class="navbar-search" action="/search">
                <input type="text" id="q" name="q" class="search-query span3" value="">
            </form>
            <ul class="nav pull-right">
                <li><a href="/">首页</a></li>

                <li>
                    <a href="/my/messages">

                        未读消息
                    </a>
                </li>

                <li><a href="/getstart">新手入门</a></li>
                <li><a href="/api">API</a></li>

                <li><a href="/about" target="">关于</a></li>


                <li><a href="/setting">设置</a></li>
                <li>
                    <a href="/signout" data-method="post" rel="nofollow">退出</a>
                </li>

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
                <span class="col_fade">作者</span>
            </div>
            <div class="inner">
                <div class="user_card">
                    <div>
                        <a class="user_avatar" href="/topic">
                            <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title="username">
                        </a>
                        <span class="user_name"><a class="dark" href="/user/${user.username}">${user.username}</a></span>

                        <div class="board clearfix">
                            <div class="floor">
                                <span class="big">积分: 130 </span>
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
                                follow_id: '5d47c83b4f472f7fee152927',
                                _csrf: 'FkAvJEJN-JONChG5uz8zMzde6EF3KA_AfDDU'
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



    </div>

    <div id="content">
        <div class="panel">
            <div class="header topic_header">
      <span class="topic_full_title">${topic.title}
      </span>
                <div class="changes">
        <span>
          发布于 5 天前
        </span>
                    <span>
          作者 <a href="/user/${user.username}">${user.username}</a>
        </span>
                    <span>
          395 次浏览
        </span>


                    <span> 来自 问答</span>



                    <input class="span-common span-success pull-right collect_btn" type="submit" value="收藏" action="collect">


                </div>

                <div id="manage_topic">





                </div>

            </div>
            <div class="inner topic">

                <div class="topic_content">
                    <div class="markdown-text"><p>${topic.content}</p>
                    </div>
                </div>
            </div>
        </div>





    </div>

    <div class="replies_history" style="display: none;">
        <div class="inner_content"></div>
        <div class="anchor"></div>
    </div>

    <!-- 预览模态对话框 -->
    <div class="modal fade" id="preview-modal">
        <div class="modal-body" style="max-height: initial;">
            <img src="" alt="点击内容或者外部自动关闭图片预览" id="preview-image">
        </div>
    </div>



    <!-- markdown editor -->
    <script src="//static2.cnodejs.org/public/editor.min.1a456564.min.js"></script>


    <script>
        $(document).ready(function () {
            // 获取所有回复者name
            var allNames = $('.reply_author').map(function (idx, ele) {
                return $(ele).text().trim();
            }).toArray();
            allNames.push($('.user_card .user_name').text())
            allNames = _.uniq(allNames);
            // END 获取所有回复者name

            // 编辑器相关
            $('textarea.editor').each(function(){
                var editor = new Editor({
                    status: []
                });
                var $el = $(this);

                editor.render(this);
                //绑定editor
                $(this).data('editor', editor);

                var $input = $(editor.codemirror.display.input);
                $input.keydown(function(event){
                    if (event.keyCode === 13 && (event.ctrlKey || event.metaKey)) {
                        event.preventDefault();
                        $el.closest('form').submit();
                    }
                });

                // at.js 配置
                var codeMirrorGoLineUp = CodeMirror.commands.goLineUp;
                var codeMirrorGoLineDown = CodeMirror.commands.goLineDown;
                var codeMirrorNewlineAndIndent = CodeMirror.commands.newlineAndIndent;
                $input.atwho({
                    at: '@',
                    data: allNames
                })
                    .on('shown.atwho', function () {
                        CodeMirror.commands.goLineUp = _.noop;
                        CodeMirror.commands.goLineDown = _.noop;
                        CodeMirror.commands.newlineAndIndent = _.noop;
                    })
                    .on('hidden.atwho', function () {
                        CodeMirror.commands.goLineUp = codeMirrorGoLineUp;
                        CodeMirror.commands.goLineDown = codeMirrorGoLineDown;
                        CodeMirror.commands.newlineAndIndent = codeMirrorNewlineAndIndent;
                    });
                // END at.js 配置

            });
            // END 编辑器相关

            // 评论回复
            $('#content').on('click', '.reply2_btn', function (event) {
                var $btn = $(event.currentTarget);
                var parent = $btn.closest('.reply_area');
                var editorWrap = parent.find('.reply2_form');
                parent.find('.reply2_area').prepend(editorWrap);
                var textarea = editorWrap.find('textarea.editor');
                var user = $btn.closest('.author_content').find('.reply_author').text().trim();
                var editor = textarea.data('editor');
                editorWrap.show('fast', function () {
                    var cm = editor.codemirror;
                    cm.focus();
                    if(cm.getValue().indexOf('@' + user) < 0){
                        editor.push('@' + user + ' ');
                    }
                });
            });

            $('#content').on('click', '.reply2_at_btn', function (event) {
                var $btn = $(event.currentTarget);
                var editorWrap = $btn.closest('.reply2_area').find('.reply2_form');
                $btn.closest('.reply2_item').after(editorWrap);
                var textarea = editorWrap.find('textarea.editor');
                var user = $btn.closest('.reply2_item').find('.reply_author').text().trim();
                var editor = textarea.data('editor');
                editorWrap.show('fast', function () {
                    var cm = editor.codemirror;
                    cm.focus();
                    if(cm.getValue().indexOf('@' + user) < 0){
                        editor.push('@' + user + ' ');
                    }
                });
            });
            // END 评论回复

            // 加入收藏
            $('.collect_btn').click(function () {
                var $me = $(this);
                var action = $me.attr('action');
                var data = {
                    topic_id: '6099dc3b4d20cb309b6921d8',
                    _csrf: 'FkAvJEJN-JONChG5uz8zMzde6EF3KA_AfDDU'
                };
                var $countSpan = $('.collect-topic-count');
                $.post('/topic/' + action, data, function (data) {
                    if (data.status === 'success') {
                        if (action == 'collect') {
                            $me.val('取消收藏');
                            $me.attr('action', 'de_collect');
                        } else {
                            $me.val('收藏');
                            $me.attr('action', 'collect');
                        }
                        $me.toggleClass('span-success');
                    }
                }, 'json');
            });
            // END 加入收藏

            // 删除回复
            $('#content').on('click', '.delete_reply_btn, .delete_reply2_btn', function (event) {
                var $me = $(event.currentTarget);
                if (confirm('确定要删除此回复吗？')) {
                    var reply_id = null;
                    if ($me.hasClass('delete_reply_btn')) {
                        reply_id = $me.closest('.reply_item').attr('reply_id');
                    }
                    if ($me.hasClass('delete_reply2_btn')) {
                        reply_id = $me.closest('.reply2_item').attr('reply_id');
                    }
                    var data = {
                        reply_id: reply_id,
                        _csrf: "FkAvJEJN-JONChG5uz8zMzde6EF3KA_AfDDU"
                    };
                    $.post('/reply/' + reply_id + '/delete', data, function (data) {
                        if (data.status === 'success') {
                            if ($me.hasClass('delete_reply_btn')) {
                                $me.closest('.reply_item').remove();
                            }
                            if ($me.hasClass('delete_reply2_btn')) {
                                $me.closest('.reply2_item').remove();
                            }
                        }
                    }, 'json');
                }
                return false;
            });
            // END 删除回复

            // 删除话题
            $('.delete_topic_btn').click(function () {
                var topicId = $(this).data('id');
                if (topicId && confirm('确定要删除此话题吗？')) {
                    $.post('/topic/' + topicId + '/delete', { _csrf: $('#_csrf').val() }, function (result) {
                        if (!result.success) {
                            alert(result.message);
                        } else {
                            location.href = '/';
                        }
                    });
                }
                return false;
            });
            // END 删除话题

            // 用户 hover 在回复框时才显示点赞按钮
            $('.reply_area').hover(
                function () {
                    $(this).find('.up_btn').removeClass('invisible');
                },
                function () {
                    var $this = $(this);
                    if ($this.find('.up-count').text().trim() === '') {
                        $this.find('.up_btn').addClass('invisible');
                    }
                });
            // END 用户 hover 在回复框时才显示点赞按钮


        });

    </script>


    <script type="text/javascript">
        (function(){
            var timer = null; //对话框延时定时器
            // 初始化 $('.replies_history')
            var $repliesHistory = $('.replies_history');
            var $repliesHistoryContent = $repliesHistory.find('.inner_content');
            $repliesHistory.hide();
            // END
            // 鼠标移入对话框清除隐藏定时器；移出时隐藏对话框
            $repliesHistory.on('mouseenter', function(){
                clearTimeout(timer);
            }).on('mouseleave', function(){
                $repliesHistory.fadeOut('fast');
            });
            // 显示被 at 用户的本页评论
            if ($('.reply2_item').length === 0) {
                // 只在流式评论布局中使用

                $('#content').on('mouseenter', '.reply_content a', function (e) {
                    clearTimeout(timer);
                    var $this = $(this);
                    if ($this.text()[0] === '@') {
                        var thisText = $this.text().trim();
                        var loginname = thisText.slice(1);
                        var offset = $this.offset();
                        var width = $this.width();
                        var mainOffset = $('#main').offset();
                        $repliesHistory.css('left', offset.left-mainOffset.left+width+10); // magic number
                        $repliesHistory.css('top', offset.top-mainOffset.top-10); // magic number
                        $repliesHistory.css({
                            'z-index': 1,
                        });
                        $repliesHistoryContent.empty();
                        var chats = [];
                        var replyToId = $this.closest('.reply_item').attr('reply_to_id');
                        while (replyToId) {
                            var $replyItem = $('.reply_item[reply_id=' + replyToId + ']');
                            var replyContent = $replyItem.find('.reply_content').text().trim();
                            if (replyContent.length > 0) {
                                chats.push([
                                    $($replyItem.find('.user_avatar').html()).attr({
                                        height: '30px',
                                        width: '30px',
                                    }), // avatar
                                    (replyContent.length>300?replyContent.substr(0,300)+'...':replyContent), // reply content
                                    '<a href="#'+replyToId+'" class="scroll_to_original" title="查看原文">↑</a>'
                                ]);
                            }
                            replyToId = $replyItem.attr('reply_to_id');
                        }
                        if(chats.length > 0) {
                            chats.reverse();

                            $repliesHistoryContent.append('<div class="title">查看对话</div>');
                            chats.forEach(function (pair, idx) {
                                var $chat = $repliesHistoryContent.append('<div class="item"></div>');
                                $chat.append(pair[0]); // 头像
                                $chat.append($('<span>').text(pair[1])); // 内容
                                $chat.append(pair[2]); // 查看原文 anchor
                            });
                            $repliesHistory.fadeIn('fast');
                        }else{
                            $repliesHistory.hide();
                        }
                    }
                }).on('mouseleave', '.reply_content a', function (e) {
                    timer = setTimeout(function(){
                        $repliesHistory.fadeOut('fast');
                    }, 500);
                });
            }
            // END 显示被 at 用户的本页评论
        })();

        // 点赞
        $('.up_btn').click(function (e) {
            var $this = $(this);
            var replyId = $this.closest('.reply_area').attr('reply_id');
            $.ajax({
                url: '/reply/' + replyId + '/up',
                method: 'POST',
            }).done(function (data) {
                if (data.success) {
                    $this.removeClass('invisible');
                    var currentCount = Number($this.next('.up-count').text().trim()) || 0;
                    if (data.action === 'up') {
                        $this.next('.up-count').text(currentCount + 1);
                        $this.addClass('uped');
                    } else {
                        if (data.action === 'down') {
                            $this.next('.up-count').text(currentCount - 1);
                            $this.removeClass('uped');
                        }
                    }
                } else {
                    alert(data.message);
                }
            }).fail(function (xhr) {
                if (xhr.status === 403) {
                    alert('请先登录，登陆后即可点赞。');
                }
            });
        });
        // END 点赞
        // 图片预览
        (function(){
            var $previewModal = $('#preview-modal');
            var $previewImage = $('#preview-image');
            var $body = $('body'); // cache

            $(document).on('click', '.markdown-text img', function(e) {
                var $img = $(this);
                // 图片被a标签包裹时，不显示弹层
                if ($img.parent('a').length > 0) {
                    return;
                }
                showModal($img.attr('src'));
            });

            $previewModal.on('click', hideModal);

            $previewModal.on('hidden.bs.modal', function() {
                // 在预览框消失之后恢复 body 的滚动能力
                $body.css('overflow-y', 'scroll');
            })

            $previewModal.on('shown.bs.modal', function() {
                // 修复上次滚动留下的痕迹,可能会导致短暂的闪烁，不过可以接受
                // TODO: to be promote
                $previewModal.scrollTop(0);
            })

            function showModal(src) {
                $previewImage.attr('src', src);
                $previewModal.modal('show');
                // 禁止 body 滚动
                $body.css('overflow-y', 'hidden');
            }

            function hideModal() {
                $previewModal.modal('hide');
            }

        })()
        // END 图片预览
    </script>

</div><div class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editorToolImageTitle" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="editorToolImageTitle">图片</h3></div><div class="modal-body"><div class="upload-img" style="height: 50px; padding: 60px 0px; text-align: center; border: 4px dashed rgb(221, 221, 221);"><div class="button webuploader-container" style="width: 86px; height: 40px; margin: 0px auto;"><div class="webuploader-pick">上传图片</div><div id="rt_rt_1f5ocpfr51alr1pf312s6l144f1" style="position: absolute; overflow: hidden; inset: 0px auto auto 0px; width: 86px; height: 40px;"><input type="file" name="file" class="webuploader-element-invisible" accept="image/*"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label></div></div><span class="tip" style="display: none;"></span><div class="alert alert-error hide"></div></div></div></div><div class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editorToolImageTitle" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="editorToolImageTitle">添加链接</h3></div><div class="modal-body"><form class="form-horizontal"><div class="control-group"><label class="control-label">标题</label><div class="controls"><input type="text" name="title" placeholder="Title"></div></div><div class="control-group"><label class="control-label">链接</label><div class="controls"><input type="text" name="link" value="http://" placeholder="Link"></div></div></form></div><div class="modal-footer"><button class="btn btn-primary" role="save">确定</button></div></div>
<div id="backtotop" style="display: none; top: 689px; right: 0px;">回到顶部</div>

<div id="sidebar-mask"></div>


<script>
    // google analytics
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script', "https://www.google-analytics.com/analytics.js",'ga');

    ga('create', 'UA-41753901-5', 'auto');
    ga('send', 'pageview');
</script>



<div style="display:none;">
    <script src="//s95.cnzz.com/z_stat.php?id=1254020586&amp;web_id=1254020586" language="JavaScript"></script><script src="https://c.cnzz.com/core.php?web_id=1254020586&amp;t=z" charset="utf-8" type="text/javascript"></script><a href="https://www.cnzz.com/stat/website.php?web_id=1254020586" target="_blank" title="站长统计">站长统计</a>
</div>




<div id="atwho-container"><div id="atwho-ground-50a7f7181621095137160"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-ffcfee591621095137163"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-b37464381621095137165"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-3d6bd2e31621095137166"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-2a47e9481621095137167"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-5b5ae6981621095137168"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-a0f4b7a31621095137174"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div></div><div class="xl-chrome-ext-bar" id="xl_chrome_ext_{4DB361DE-01F7-4376-B494-639E489D19ED}" style="display: none;">
    <div class="xl-chrome-ext-bar__logo"></div>

    <a id="xl_chrome_ext_download" href="javascript:;" class="xl-chrome-ext-bar__option">下载视频</a>
    <a id="xl_chrome_ext_close" href="javascript:;" class="xl-chrome-ext-bar__close"></a>
</div>









<h1>${topic.title}</h1>
<p>
    ${topic.content}
</p>
<form action="/detail/${topic.id}/add" method="POST">
    <input name="id" placeholder="id" value="${topic.id}">
    <input type="text" name="content" placeholder="请输入 评论">
    <br>
    <button type="submit">评论</button>
</form>

<div>
    <#list topic.commentList as c>
    <#--        <h3>${t.id} : ${t.title}</h3>-->
        ${c.id} ${c.user.username}: ${c.content}
        <a href="/detail/edit?id=${c.id}">编辑</a>
        <a href="/detail/delete?id=${c.id}">删除</a>
        <br>
    </#list>
</div>

</body>




</html>