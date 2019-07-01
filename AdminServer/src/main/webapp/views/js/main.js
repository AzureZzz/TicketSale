
$(function() {
    $(".navbar-expand-toggle").click(function() {
        $(".app-container").toggleClass("expanded");
        return $(".navbar-expand-toggle").toggleClass("fa-rotate-90");
    });
    return $(".navbar-right-expand-toggle").click(function() {
        $(".navbar-right").toggleClass("expanded");
        return $(".navbar-right-expand-toggle").toggleClass("fa-rotate-90");
    });
});

$(function() {
    return $(".side-menu .nav .dropdown").on('show.bs.collapse', function() {
        return $(".side-menu .nav .dropdown .collapse").collapse('hide');
    });
});

$(function () {
    $("#c_logout").click(function(){
        layer.confirm('您确定要退出？', {
            btn: ['确定','取消'] ,
            skin: 'layui-layer-lan'
        }, function(){
            var url = "/logout";
            $.ajax({
                url: url,
                type: 'POST',
                success: function(){
                    layer.msg('退出成功！', {icon: 1});
                    window.location.href="logout";
                }
            });
        }, function(){
        });
    });
});

layui.use('form', function() {
    var form = layui.form,
        $=layui.jquery;
    form.verify({
        oldpass: function(value) {
            if(value.length <= 0) {
                return '原密码不能为空';
            }
        },
        pass: [/(.+){6,12}$/, '密码必须6到12位']
    });
    form.on('submit(mps)', function (datas) {
        var data = {
            "password":datas.field.old_password,
            "newPassword":datas.field.new_password
        };
        if(datas.field.re_password != datas.field.new_password){
            layer.msg('两次密码不一致！', {icon: 2});
        }else{
            $.ajax({
                url:'/modifypassword',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err != null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.msg('修改成功！', {icon: 1});
                        setTimeout(function () {
                            window.location.href="login";
                        }, 1000);
                    }
                }
            });
        }
        return false;
    });
});


