$(window).scroll(function (e) {
    // e.stopPropagation();
});

$(document).ready(function () {
    // $('html').removeClass(' eventlistener localstorage no-touchevents no-forcetouch ');

    $('.featured-list-slider .owl-nav button').empty();
    $('.featured-list-slider .owl-nav button.owl-prev').html('<i class="fal fa-chevron-left"><i>');
    $('.featured-list-slider .owl-nav button.owl-next').html('<i class="fal fa-chevron-right"><i>');

    // $('.featured-list-slider').owlCarousel({
    //     items: 4,
    //     loop: true,
    //     margin: 30,
    //     nav: true,
    //     smartSpeed: 900,
    //     navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"]
    // });

    $('#itemsDetailsTabs li a').click(function () {
        var tab = $(this).attr('href');

        if ($(tab).hasClass('active')) { //this is the start of our condition
            $('#itemsDetailsTabsContent li a').removeClass('active show');
            $(tab).addClass('active');

            // $('.container').hide();
            $(tab).fadeIn('slow');
        }

    });

});

