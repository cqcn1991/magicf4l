var $container = $('#microposts-list');
$container.imagesLoaded(function(){
    $container.masonry({
        itemSelector : '.micropost-big'
//        columnWidth : 300,
//        gutterWidth: 20
    });
});
//在叫ajax之后还要在bind一遍
$(".jump-to-cover").click(function() {
    $('html, body').animate({
        scrollTop: $(".cover-micropost").offset().top
    }, 800);
});


