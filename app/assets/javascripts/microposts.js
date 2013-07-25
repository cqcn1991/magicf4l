var $container = $('#microposts-list');
$container.imagesLoaded(function(){
    $container.masonry({
        itemSelector : '.micropost-big'
//        columnWidth : 300,
//        gutterWidth: 20
    });
});