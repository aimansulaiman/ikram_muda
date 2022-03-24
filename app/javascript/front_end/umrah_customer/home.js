$(window).load(function(){
    $(window).scroll(function () {
        console.log('window scroll')
        var scrollAmount = $(window).scrollTop()

        if (scrollAmount > 200) {
            $("#nav-bar-home").removeClass("header-transparent").addClass("header-scrolled")
        } else if (scrollAmount < 200) {
            $("#nav-bar-home").removeClass("header-scrolled").addClass("header-transparent")
        }
    })
})

$(window).load(function () {
    if ($("#umrah-feature")) {
        $("#nav-bar-home").removeClass("header-transparent").addClass("header-scrolled")
    }
})

