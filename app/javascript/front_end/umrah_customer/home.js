// $(window).load(function(){
//     console.log("HAHAHAHHA")
//     $(window).scroll(function () {
//         console.log('window scroll')
//         var scrollAmount = $(window).scrollTop()
//
//         if (scrollAmount > 200) {
//             $("#nav-bar-home").removeClass("header-transparent").addClass("header-scrolled")
//         } else if (scrollAmount < 200) {
//             $("#nav-bar-home").removeClass("header-scrolled").addClass("header-transparent")
//         }
//     })
// })
//
// $(window).load(function () {
//     if ($("#umrah-feature")) {
//         $("#nav-bar-home").removeClass("header-transparent").addClass("header-scrolled")
//     }
// })


// $(document).ready(function () {
//
//     console.log('yes ready')
//     $("#input").on("input", function (e) {
//         var input = $(this);
//         var val = input.val();
//
//         if (input.data("lastval") != val) {
//             input.data("lastval", val);
//
//             //your change action goes here
//             console.log(val);
//         }
//     });
//
//     // $("#umrah-package-form").submit(function () {
//     //     var umrah_title = $("#input").val()
//     //     var pax_per_room = $("#pax-per-room").val()
//     //     $("input#package_full_name").val(`${umrah_title} ${pax_per_room} pax/room`)
//     // });
//
//     $("#package-price").change(function () {
//         var input = $(this);
//         var val = input.val();
//
//         var regex = /^[0-9]*$/g;
//         var test = val.match(regex);
//
//
//         console.log('test ==', test)
//
//     });
//
//
// })

// if ($(window).width() < 922) {
//     console.log('hahah')
//     $('#multiCollapseExample1').collapse("toggle");
// } else {
//     console.log('test')
//     $('#multiCollapseExample1').collapse({
//         // toggle: true
//         toggle: false
//     });
// }

$(document).on('turbolinks:load', function() {
    if ($(window).width() < 922) {
        $('#sidebar').collapse({toggle:false});
        $('#sidebar-button').show()
        $('#sidebar-title').hide()
        $('#sidebar').addClass("collapse multi-collapse")
    } else {
        // $('#sidebar').collapse({toggle:true});
        $('#sidebar-button').hide().removeClass("collapse multi-collapse")
        $('#sidebar-title').show()
    }
});


// $(document).on('turbolinks:load', function() {
//    console.log('in turbolinks:load')
//
//    $("#umrah-package-form").submit(function() {
//       var umrah_title = $("#input").val()
//       var pax_per_room = $("#pax-per-room").val()
//       $("input#package_full_name").val(`${umrah_title} ${pax_per_room} pax/room`)
//    });
//
// });




















