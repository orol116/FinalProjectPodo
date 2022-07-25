
// 자동 배너 슬라이드 효과

var slideIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}
    x[slideIndex-1].style.display = "block";
    
    setTimeout(carousel, 5000); // Change image every 2 seconds
}


(() => {
  // let boardNo = document.querySelector('.frame:nth-child(2) ').getAttribute('id')
  const section = document.querySelectorAll('section')[3];
  let frame = document.querySelector('.frame:last-child');
  // let count = section.children.length;
  
  console.log(section);
  console.log(frame);
  // console.log(count);
  
  // 1. 인터섹션 옵저버 생성
  const io = new IntersectionObserver((entry, observer) => {

    // 3. 현재 보이는 target 출력
    const ioTarget = entry[0].target;
    
    // 4. viewport에 target이 보이면 하는 일
    if (entry[0].isIntersecting) {
      
      let boardNo = document.querySelector('.frame:last-child>.box:last-child').getAttribute('id');
      //ajax
      $.ajax({
        url : contextPath + "/mainItem",  
        data : { "boardNo" : boardNo }, 
        type : "GET", 
        dataType : "JSON",
        success : function(result){
      
        console.log(result);
        console.log(result[0]);
        
        console.log('현재 보이는 타켓', ioTarget)
        // 5. 현재 보이는 target 감시 취소
        io.unobserve(frame);
  
        // 6. 새로운 frame 추가
        frame = section.appendChild(document.createElement('div'));
        frame.classList.add('frame');
        // frame.setAttribute('id',result[0].boardNo)
  
  
        for(let res of result){

          div = document.createElement('div')
          div.classList.add('box')
          div.setAttribute('id', res.boardNo)
          div.style.width = "220px";
          div.style.flexBasis = "0";
          div.style.marginLeft = "4.5px";
          
          frame.appendChild(div);

          a = document.createElement('a');
          a.setAttribute('href',contextPath+'/board/detail/'+res.boardNo)
          a.classList.add('title');
          a.style.width ="223.02px";
          div.append(a);

          divImg = document.createElement('div');
          divImg.classList.add('image');
          a.append(divImg);

          img = document.createElement('img');
          
          if(res.img != null){

            img.setAttribute('src',contextPath+res.img.imageReName)
          }else{
            
            img.setAttribute('src','resources/images/items/image1.jpg')
          }
          img.setAttribute('alt','상품 이미지')
          divImg.append(img);

          divTitle1 = document.createElement('div');
          divTitle1.classList.add('title1')
          a.append(divTitle1)

          divTitle2 = document.createElement('div');
          divTitle2.classList.add('title2');
          divTitle2.innerText = res.boardTitle;
          divTitle1.append(divTitle2);

          divName = document.createElement('div');
          divName.classList.add('name2');
          divTitle1.append(divName);

          divPrice = document.createElement('div');
          divPrice.classList.add('price');
          divPrice.innerText=res.price+'원';
          divName.append(divPrice);
          
          divTime = document.createElement('div');
          divTime.classList.add('time');
          divTime.innerText=res.updateDate;
          divName.append(divTime);

        }
  
        // 7. 새로 추가된 frame 감시
        io.observe(frame);
        },
        error : function(){ 
            console.log("에러 발생");
        }
      })

      //ajax
    }
  
  }, {
    // 8. 타겟이 50% 이상 보이면 작동
    threshold: 0.5
  });

  // 2. fream감시
  io.observe(frame);
  
})();
