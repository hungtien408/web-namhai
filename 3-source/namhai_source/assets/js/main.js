$(document).ready(function () {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu li:last-child").addClass("last");
    $("#menu li:first-child").addClass("fisrt");
    /*==============banner-full=====================*/
    $(".full-img").each(function () {
        var srcimg = $(this).attr("data-img");
        $(this).css({ "background-image": "url(" + srcimg + ")" });
    });
    rehbanner();
    /*===================*/
    $('#sliderBanner').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        dots: true,
        infinite: true,
        speed: 500,
    });
    $(".fancybox").fancybox({
        wrapCSS: 'zoom-fancybox',
        padding: 10,
        openEffect: 'elastic',
        closeEffect: 'elastic'
    });
    myfunload();
    mypageload();
});
/*==============================function=====================*/
function myfunload() {
    $('.panel-heading a[data-toggle="collapse"]').click(function () {
        $('.panel-heading').removeClass('actives');
        $(this).toggleClass("current").parents('.panel-heading').addClass('actives');
        $('.panel-heading').each(function () {
            if (!$(this).hasClass("actives")) {
                $(this).find('a[data-toggle="collapse"]').removeClass("current");
            }
        });
    });
    $(function () {
        $("#tabs").tabs();
    });
    if ($('#silderPartner').size() == 1)
        var silderPartner = $('#silderPartner').imagesLoaded(function () {
            silderPartner.slick({
                autoplay: true,
                autoplaySpeed: 3000,
                //cssEase: 'linear',
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 6,
                slidesToScroll: 1,
                //prevArrow: $(".control-slider .prev"),
                //nextArrow: $(".control-slider .next"),
                arrow: true,
                responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 5
                        }
                    },
                  {
                      breakpoint: 1000,
                      settings: {
                          slidesToShow: 4
                      }
                  },
                  {
                      breakpoint: 650,
                      settings: {
                          slidesToShow: 3
                      }
                  },

                  {
                      breakpoint: 510,
                      settings: {
                          slidesToShow: 2
                      }
                  },
                  {
                      breakpoint: 370,
                      settings: {
                          slidesToShow: 1
                      }
                  }

                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                ]
            });
            silderPartner.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
        });

    if ($("#sliderDetails").size() == 1) {
        var bigimg = $(".small-img:first").attr("href");
        var smallimg = $(".small-img:first").attr("data-img");
        $(".cloud-zoom").attr("href", bigimg).find("img:first").attr("src", smallimg);
        jQuery('.cloud-zoom').CloudZoom();

        $('#sliderDetails .slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            infinite: false,
            fade: true,
            asNavFor: '#sliderDetails .slider-nav'
        });
        $('#sliderDetails .slider-nav').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            asNavFor: '#sliderDetails .slider-for',
            dots: false,
            infinite: false,
            autoplay: true,
            //centerMode: true,
            focusOnSelect: true
        });
        $('#sliderDetails .slider-nav').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            var bigimg = $("#sliderDetails .slider-nav .slick-slide:eq(" + nextSlide + ") .small-img").attr("href");
            var smallimg = $("#sliderDetails .slider-nav .slick-slide:eq(" + nextSlide + ") .small-img").attr("data-img");
            $(".cloud-zoom").attr("href", bigimg).find("img:first").attr("src", smallimg);
            jQuery('.cloud-zoom').CloudZoom();
        });
    }
    mymap();

}
/*=========================*/
function mypageload() {
    myListTb();
}
/*========================================================================*/
function myListTb() {
    if ($('.product-tb').size() > 0) {
        var producttb = $('.product-tb').imagesLoaded(function () {
            producttb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            setTimeout(function () {
                producttb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 100);
        });
    }

    if ($('.partner-tb').size() > 0) {
        var partnertb = $('.partner-tb').imagesLoaded(function () {
            partnertb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".partner-img" }, { cssname: ".partner-name" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            setTimeout(function () {
                partnertb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 100);
        });
    }

    if ($('.gallery-bg').size() > 0) {
        var gallerybg = $('.gallery-bg').imagesLoaded(function () {
            gallerybg.textHeight({
                activetit: true,
                listcss: [{ cssname: ".gallery-img" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                //listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            setTimeout(function () {
                gallerybg.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 100);
        });
    }

}
/*========function-banner-full======*/
function rehbanner() {
    hiehgtbanner();
    $(window).resize(function () {
        setTimeout(function () {
            hiehgtbanner();
        }, 100);
    });
}
function hiehgtbanner(hwin) {
    var hwin = $(window).height();
    $(".full-img").height(hwin);
}
/*===============================*/
$('#menu > li').hover(function () {
    $(this).children('ul').stop(true, false, true).slideToggle(300);
});
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}