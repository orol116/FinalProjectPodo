function show() {
    document.querySelector(".background").className = "background show";
  }

  function close() {
    document.querySelector(".background").className = "background";
  }

  document.querySelector("#recentShow-item").addEventListener("click", show);
  document.querySelector("#close").addEventListener("click", close);




 

  const backToTop = document.getElementById('go-topBtn');

  const checkScroll=()=>{

      // 페이지가 수직으로 얼마나 스크롤되었는지를 확인하는 값(픽셀 단위로 변환) pageOffset
      let pageOffset = window.pageYOffset;

      // 이 값이 0이 아니면, 클래스를 show를 선언하고, 그렇지 않다면 show를 삭제한다. 디폴트 css는 hidden상태
      // 0이면 스크롤이 안된상태 이고, 0이 아니면 스크롤이 일어난상태 
      if(pageYOffset !== 0){
          // id= backtotop  class="show"를 추가한다.
          backToTop.classList.add('show');  
      }else{
          backToTop.classList.remove('show');
      }
  }

  const moveBackToTop=()=>{
      if(window.pageYOffset > 0 ){
          //스무스하게 스크롤 하기 //어디까지 올라갈지 위치를 정한다. behavior 자연스럽게 이동.
          window.scrollTo({top:0, behavior:"smooth"});
      }
  }

  window.addEventListener('scroll', checkScroll);
 
  backToTop.addEventListener('click',moveBackToTop);



  itemCategory.addEventListener("click", selectItemsList);


function selectItemsList() {

    $.ajax({
        url: contextPath + "/shop/selectItemsList/" + memberNo,
        data: { "memberNo": memberNo },
        type: "GET",
        dataType: "JSON",
        success: function (iList) {
            console.log(iList);

            itemList.innerHTML = "";

            reviewList.style.display = "none";
            itemList.style.display = "block";

            if (iList == "") {
                const itembox = document.createElement("div");
                itembox.classList.add("box");

                itembox.innerText = "등록된 상품이 없습니다.";

                reviewList.style.display = "none";
                itemList.style.display = "block";
                itembox.style.border = "none";

                itemList.style.fontSize = "20px";


                itemList.append(itembox);


            } else {

                let itemContainer;

                for (let k = 0; k < 5; k++) {

                    if(k % 4 == 0){
                        itemContainer = document.createElement("div");
                        itemContainer.classList.add("itemContainer");
                        itemContainer.style.display = "flex";

                        itemList.append(itemContainer);
                    }


                    const itembox = document.createElement("div");
                    itembox.classList.add("box");
                    itembox.style.margin = "10px 15px 10px 15px";
                    itembox.style.paddingLeft = "2px";
                    /* const boxNumber = 1;
                    boxNumber++; */

                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");
                    mainTitle.setAttribute('href',contextPath + '/board/detail/'+iList[k].boardNo);

                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("img");
                    if(iList[k].imageList[0] != null){
                        itemImage.setAttribute('src', contextPath+iList[k].imageList[0].imageReName);
                    }else{
                        itemImage.setAttribute('src','resources/images/items/image1.jpg');
                    }

                    const title1 = document.createElement("div");
                    title1.classList.add("title1");

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = iList[k].boardTitle;

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = iList[k].price;

                    const time = document.createElement("div");
                    time.classList.add("time");
                    time.innerText = iList[k].updateDate;

                    name2.append(price, time);

                    title1.append(title2, name2);

                    imageArea.append(itemImage);

                    mainTitle.append(imageArea, title1);

                    itembox.append(mainTitle);

                    itemContainer.append(itembox);

                }

            }

        },
        error: function (req, status, error) {
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}


  


