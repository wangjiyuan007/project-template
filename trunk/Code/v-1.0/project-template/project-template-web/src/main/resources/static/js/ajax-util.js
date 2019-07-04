//全站ajax加载提示
(function ($) {
    $(document).ajaxStart(function () {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
    });
    $(document).ajaxStop(function () {
        layer.closeAll('loading');
    });
    //登录过期，shiro返回登录页面
    $.ajaxSetup({
        complete: function (XMLHttpRequest, status, dataType) {
            var sessionstatus = XMLHttpRequest.getResponseHeader("SESSIONSTATUS");
            if (sessionstatus == "TIMEOUT") {
                top.location.href = XMLHttpRequest.getResponseHeader("CONTEXTPATH");
            }
        }
    });
})(jQuery);





