$(window).scroll(function(){
    var scrollAmount = $(window).scrollTop()

    if (scrollAmount>200) {
        $("#nav-bar-home").removeClass("header-transparent").addClass("header-scrolled")
    } else if (scrollAmount < 200) {
        $("#nav-bar-home").removeClass("header-scrolled").addClass("header-transparent")
    }
})
