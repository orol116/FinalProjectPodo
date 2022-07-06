/* header category 보이기 js */
document.getElementById("fa-bars").addEventListener("mouseenter", function(){

    document.getElementById("category-area").style.display = "block";

});



/* category.addEventListener("mouseover", function(){

    for(var i = 0; i < category; i++){

        document.getElementById("div-category-area").style.display = "block";
    }

}); */

/* 마우스가 떠났을 때  창 닫는 이벤트 추가 */
$('.category-name').mouseenter(function(){

    $('#div-category-area').css('display', 'block');
    
});

$('#div-category-area').mouseleave(function(){
    $('#div-category-area').css('display', 'none');
    $('#category-area').css('display', 'none');


});









