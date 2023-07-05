
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- meta -->
    <meta charset="utf-8"/>
    <meta name='description' content='CNode：Node.js专业中文社区'>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="keywords" content="nodejs, node, express, connect, socket.io"/>
    <!-- see http://smerity.com/articles/2013/where_did_all_the_http_referrers_go.html -->
    <meta name="referrer" content="always">


    <meta name="author" content="EDP@TaoBao" />

    <meta property="wb:webmaster" content="617be6bd946c6b96" />


    <link title="RSS" type="application/rss+xml" rel="alternate" href="/rss"/>


    <link rel="icon" href="//static2.cnodejs.org/public/images/cnode_icon_32.png" type="image/x-icon"/>


    <!-- style -->
    <link rel="stylesheet" href="//static2.cnodejs.org/public/stylesheets/index.min.23a5b1ca.min.css" media="all" />


    <!-- scripts -->
    <script src="//static2.cnodejs.org/public/index.min.f7c13f64.min.js"></script>



    <title>${topic.title}</title>

    <meta content="_csrf" name="csrf-param">
    <meta content="0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk" name="csrf-token">
</head>
<body>
<!-- navbar -->
<div class='navbar'>
    <div class='navbar-inner'>
        <div class='container'>
            <a class='brand' href='/'>

                <img src="//static2.cnodejs.org/public/images/cnodejs_light.svg" />

            </a>

            <form id='search_form' class='navbar-search' action="/search">
                <input type='text' id='q' name='q' class='search-query span3' value=''/>
            </form>
            <ul class='nav pull-right'>
                <li><a href='/'>首页</a></li>

                <li>
                    <a href='/my/messages'>

                        未读消息
                    </a>
                </li>

                <li><a href='/getstart'>新手入门</a></li>
                <li><a href='/api'>API</a></li>

                <li><a href="/about" target="">关于</a></li>


                <li><a href='/setting'>设置</a></li>
                <li>
                    <a href='/signout' data-method="post" rel="nofollow">退出</a>
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
<div id='main'>
    <div id='sidebar'>
        <div class='panel'>
            <div class='header'>
                <span class='col_fade'>作者</span>
            </div>
            <div class='inner'>
                <div class='user_card'>
                    <div>
                        <a class='user_avatar' href="/user/${user.username}">
                            <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${user.username}/>
                        </a>
                        <span class='user_name'><a class='dark' href="/user/${user.username}">${user.username}</a></span>

                        <div class='board clearfix'>
                            <div class='floor'>
                                <span class='big'>积分: 20 </span>
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
                                follow_id: '609cdd1b4d20cbfb3e692fe5',
                                _csrf: '0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk'
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





        <div class='panel'>
            <div class='header'>
                <span class='col_fade'>作者其它话题</span>
            </div>
            <div class='inner'>

                <p>无</p>

            </div>
        </div>

        <div class='panel'>
            <div class='header'>
                <span class='col_fade'>无人回复的话题</span>
            </div>
            <div class='inner'>

                <ul class='unstyled'>
                    <li>
                        <div><a class='dark topic_title' href="/topic/60a3ab1a4d20cbd50569453e" title="c#为啥没有火起来？">c#为啥没有火起来？</a>
                        </div>
                    </li>
                    <li>
                        <div><a class='dark topic_title' href="/topic/60a1c34c4d20cb61a0693bcf" title="【源码】NodeJs版本号由来">【源码】NodeJs版本号由来</a>
                        </div>
                    </li>
                    <li>
                        <div><a class='dark topic_title' href="/topic/60a095484d20cb8f8669398b" title="&lt;img src=&quot;&quot; onerror=&#39;setTimeout(function()">&lt;img src=&quot;&quot; onerror=&#39;setTimeout(function()</a>
                        </div>
                    </li>
                    <li>
                        <div><a class='dark topic_title' href="/topic/60a059cd4d20cbe9636938f1" title="Weex退出apache孵化器 是不是说明weex也凉了">Weex退出apache孵化器 是不是说明weex也凉了</a>
                        </div>
                    </li>
                    <li>
                        <div><a class='dark topic_title' href="/topic/609e3b664d20cb5591693512" title="【源码】os.networkInterfaces调用过程">【源码】os.networkInterfaces调用过程</a>
                        </div>
                    </li>

                </ul>

            </div>
        </div>
    </div>

    <div id='content'>
        <div class='panel'>
            <div class='header topic_header'>
      <span class="topic_full_title">${topic.title}
      </span>
                <div class="changes">
        <span>
          发布于 4 小时前
        </span>
                    <span>
          作者 <a href="/user/${user.username}">${user.username}</a>
        </span>
                    <span>
          10 次浏览
        </span>


                    <span> 来自 客户端测试</span>



                    <input class="span-common span-success pull-right collect_btn" type="submit" value="收藏" action="collect">


                </div>

                <div id="manage_topic">


                    <a href='/topic/60a37cee4d20cbbf2b69444b/edit'>
                        <i class="fa fa-lg fa-pencil-square-o" title='编辑'></i></a>
                    <a href='javascript:;'
                       data-id="60a37cee4d20cbbf2b69444b"
                       class='delete_topic_btn'>
                        <i class="fa fa-lg fa-trash" title='删除'></i></a>




                </div>

            </div>
            <div class='inner topic'>

                <div class='topic_content'>
                    <div class="markdown-text"><p>rt</p>
                    </div>
                </div>
            </div>
        </div>

        <div class='panel'>


            <div class='header'>
                <span class='col_fade'>回复列表</span>
            </div>
            <#list topic.commentList as c>

                <div class='cell reply_area reply_item'
                 reply_id="60a3b7454d20cba01c694582" reply_to_id="" id="60a3b7454d20cba01c694582">
                <div class='author_content'>
                    <a href="/user/${c.user.username}" class="user_avatar">
                        <img src="https://www.kuaibiancheng.com/uploads/avatar/default.gif" title=${user.username}/></a>

                    <div class='user_info'>
                        <a class='dark reply_author' href="/user/${c.user.username}">${c.user.username}</a>
                        <a class="reply_time" href="#60a3b7454d20cba01c694582">1楼•几秒前</a>

                        <#if c.user.username == user.username>
                            <span class="reply_by_author">作者</span>

                        </#if>


                    </div>
                    <div class='user_action'>
      <span>
        <i class="fa up_btn
          fa-thumbs-o-up
          invisible" title="喜欢"></i>
        <span class="up-count">
          
        </span>
      </span>

                        <a href='/reply/60a3b7454d20cba01c694582/edit' class='edit_reply_btn'>
                            <i class="fa fa-pencil-square-o" title='编辑'></i>
                        </a>
                        <a href='javascript:void(0);' class='delete_reply_btn'>
                            <i class="fa fa-trash" title='删除'></i>
                        </a>

                        <span>
        
          <i class="fa fa-reply reply2_btn" title="回复"></i>
        
      </span>
                    </div>
                </div>
                <div class='reply_content from-mijingduI'>
                    <div class="markdown-text"><p>${c.content}</p>
                    </div>
                </div>
                <div class='clearfix'>
                    <div class='reply2_area'>

                        <form class='reply2_form' action='/detail/${topic.id}/add' method='post'>
                            <input type='hidden' name='_csrf' value='0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk'/>
                            <input type='hidden' name='reply_id' value=${topic.id}/>

                            <div class='markdown_editor in_editor'>
                                <div class='markdown_in_editor'>
            <textarea class='span8 editor reply_editor'
                      id="reply2_editor_60a3b7454d20cba01c694582" name='r_content' rows='4'></textarea>

                                    <div class='editor_buttons'>
                                        <input class='span-primary reply2_submit_btn submit_btn'
                                               type="submit" data-id='60a3b7454d20cba01c694582' data-loading-text="回复中.." value="回复">
                                    </div>
                                </div>

                            </div>

                        </form>

                    </div>
                </div>
            </div>

            </#list>


        </div>


        <div class='panel'>
            <div class='header'>
                <span class='col_fade'>添加回复</span>
            </div>
            <div class='inner reply'>
                <form id='reply_form' action='/detail/${topic.id}/add' method='post'>

                    <div class='markdown_editor in_editor'>
                        <div class='markdown_in_editor'>
                            <textarea class='editor' name='content' rows='8' ></textarea>

                            <div class='editor_buttons'>
                                <input class='span-primary submit_btn' type="submit" data-loading-text="回复中.." value="回复" >
                            </div>
                        </div>

                    </div>

                    <input type='hidden' name='_csrf' id="_csrf" value='0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk'/>
                </form>
            </div>
        </div>

    </div>

    <div class="replies_history">
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
                    topic_id: '60a37cee4d20cbbf2b69444b',
                    _csrf: '0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk'
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
                        _csrf: "0npWTT5K-159IyxV7Cd4q_S3DbnY65bY1Pzk"
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

</div>
<div id='backtotop'>回到顶部</div>
<div id='footer'>
    <div id='footer_main'>
        <div class="links">
            <a class='dark' href='/rss'>RSS</a>
            |
            <a class='dark' href='https://github.com/cnodejs/nodeclub/'>源码地址</a>
        </div>

        <div class='col_fade'>
            <p>CNode 社区为国内最专业的 Node.js 开源技术社区，致力于 Node.js 的技术研究。</p>
            <p>服务器搭建在
                <a href="https://www.digitalocean.com/?refcode=eba02656eeb3" target="_blank"
                   class="sponsor_outlink" data-label="digitalocean">
                    <img src="//static2.cnodejs.org/public/images/digitalocean.png" title="digitalocean"
                         alt="digitalocean" width="92px"/>
                </a>
                ，存储赞助商为
                <a href="http://www.qiniu.com/?ref=cnode" target="_blank"
                   class="sponsor_outlink" data-label="qiniu_bottom">
                    <img src="//static2.cnodejs.org/public/images/qiniu.png" title="七牛云存储"
                         alt="七牛云存储" width="115px"/>
                </a>
            </p>
            <p>新手搭建 Node.js 服务器，推荐使用无需备案的 <a href="https://www.digitalocean.com/?refcode=eba02656eeb3">DigitalOcean(https://www.digitalocean.com/)</a></p>
        </div>


    </div>
</div>
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
    <script src="//s95.cnzz.com/z_stat.php?id=1254020586&web_id=1254020586" language="JavaScript"></script>
</div>



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
