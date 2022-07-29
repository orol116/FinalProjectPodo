console.log(tradeCondition);

window.onload = function() {

    if(tradeCondition=="판매완료"){

        var itemDetailHead = document.getElementById("item-detail-head");
        
        let overlayCard = document.createElement("span");
        overlayCard.classList.add("overlayCard");
        
        let overlayTitle = document.createElement("p");
        overlayTitle.classList.add("overlayTitle");
    
        itemDetailHead.append(overlayCard);
        overlayCard.append(overlayTitle);
    
        $('.overlayTitle').before('<img src="/podo/resources/images/transactionCompleted.png" class="overlay" />');
        overlayTitle.innerText = "판매완료";

        var itemImage = document.getElementById("item-image");
        itemImage.classList.remove("overlay");
    }

};