﻿! function (t) {
    t.fn.extend({
        textHeight: function (s) {
            var i = {
                activetit: !0,
                listcss: [{
                    cssname: ".news-name"
                }],
                wpointb: !0,
                desbool: !0,
                listpos: [{
                    cssnamepos: ".desription",
                    cssheightnum: "3"
                }],
                tbrow: !1,
                csstr: ".element-item",
                max: !0
            },
             s = t.extend(i, s);
            return this.each(function () {
                function i() {
                    if (clearTimeout(a), n.activetit)
                        for (var s = 0; r > s; s++) t(n.listcss[s].cssname, o).height("auto");
                    if (n.desbool)
                        for (var i = 0; h > i; i++) t(n.listpos[i].cssnamepos, o).height("auto");
                    a = setTimeout(function () {
                        e()
                    }, 100)
                }

                function e() {
                    var s = o.width() + 3,
                     i = o.find(n.csstr).outerWidth(),
                     e = Math.round(s / i),
                     a = o.find(n.csstr).size(),
                     c = (parseInt(a / e), 1),
                     p = 0;
                    if (n.tbrow) {
                        for (var f = 0; a > f; f++) p += l.filter(":eq(" + f + ")").outerWidth(), s >= p ? l.filter(":eq(" + f + ")").attr("data-row", "row-" + c) : (p = 0, c++, p += l.filter(":eq(" + f + ")").outerWidth(), l.filter(":eq(" + f + ")").attr("data-row", "row-" + c));
                        c == a && o.find(n.csstr).attr("data-row", "row")
                    }
                    if (n.max)
                        if (n.tbrow) {
                            if (c > 0) {
                                if (n.activetit)
                                    for (var m = 0; c > m; m++)
                                        for (var u = "[data-row='row-" + (m + 1) + "']", f = 0; r > f; f++) {
                                            var g = u + " " + n.listcss[f].cssname,
                                             v = Math.max.apply(null, t(g, o).map(function () {
                                                 return t(this).height()
                                             }).get());
                                            t(g, o).height(v)
                                        }
                                if (n.desbool)
                                    for (var d = 0; c > d; d++)
                                        for (var u = "[data-row='row-" + (d + 1) + "']", m = 0; h > m; m++) {
                                            var w = u + " " + n.listpos[m].cssnamepos,
                                             b = Math.max.apply(null, t(w, o).map(function () {
                                                 return t(this).height()
                                             }).get()),
                                             x = parseInt(t(w, o).css("line-height"));
                                            b > n.listpos[m].cssheightnum * x ? t(w, o).height(n.listpos[m].cssheightnum * x) : t(w, o).height(b)
                                        }
                            }
                        } else {
                            if (n.activetit)
                                for (var f = 0; r > f; f++) {
                                    var v = Math.max.apply(null, t(n.listcss[f].cssname, o).map(function () {
                                        return t(this).height()
                                    }).get());
                                    t(n.listcss[f].cssname, o).height(v)
                                }
                            if (n.desbool)
                                for (var m = 0; h > m; m++) {
                                    var b = Math.max.apply(null, t(n.listpos[m].cssnamepos, o).map(function () {
                                        return t(this).height()
                                    }).get()),
                                     x = parseInt(t(n.listpos[m].cssnamepos, o).css("line-height"));
                                    b > n.listpos[m].cssheightnum * x ? t(n.listpos[m].cssnamepos, o).height(n.listpos[m].cssheightnum * x) : t(n.listpos[m].cssnamepos, o).height(b)
                                }
                        } else if (n.tbrow) {
                            if (e > 1) {
                                if (n.activetit)
                                    for (var m = 0; c > m; m++)
                                        for (var u = "[data-row='row-" + (m + 1) + "']", f = 0; r > f; f++) {
                                            var g = u + " " + n.listcss[f].cssname,
                                             v = Math.min.apply(null, t(g, o).map(function () {
                                                 return t(this).height()
                                             }).get());
                                            t(g, o).height(v)
                                        }
                                if (n.desbool)
                                    for (var d = 0; c > d; d++)
                                        for (var u = "[data-row='row-" + (d + 1) + "']", m = 0; h > m; m++) {
                                            var w = u + " " + n.listpos[m].cssnamepos,
                                             b = Math.min.apply(null, t(w, o).map(function () {
                                                 return t(this).height()
                                             }).get()),
                                             x = parseInt(t(w, o).css("line-height"));
                                            b > n.listpos[m].cssheightnum * x ? t(w, o).height(n.listpos[m].cssheightnum * x) : t(w, o).height(b)
                                        }
                            }
                        } else {
                            if (n.activetit)
                                for (var f = 0; r > f; f++) {
                                    var v = Math.min.apply(null, t(n.listcss[f].cssname, o).map(function () {
                                        return t(this).height()
                                    }).get());
                                    t(n.listcss[f].cssname, o).height(v)
                                }
                            if (n.desbool)
                                for (var m = 0; h > m; m++) {
                                    var b = Math.min.apply(null, t(n.listpos[m].cssnamepos, o).map(function () {
                                        return t(this).height()
                                    }).get()),
                                     x = parseInt(t(n.listpos[m].cssnamepos, o).css("line-height"));
                                    b > n.listpos[m].cssheightnum * x ? t(n.listpos[m].cssnamepos, o).height(n.listpos[m].cssheightnum * x) : t(n.listpos[m].cssnamepos, o).height(b)
                                }
                        }
                }
                var a, n = s,
                 o = t(this),
                 r = n.listcss.length,
                 h = n.listpos.length,
                 l = o.find(n.csstr);
                i(), n.wpointb && t(window).resize(function () {
                    i()
                })
            })
        }
    })
}(jQuery);