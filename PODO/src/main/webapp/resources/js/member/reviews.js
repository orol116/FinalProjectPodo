function reviewsList(){

    $.ajax({
        url : contextPath + "selectReviewsList",
        data : {"memberNo" : memberNo},
        type : "GET",
        dataType : "JSON",
        success : function(rList){
            console.log(rList);

            const reviewList = document.getElementById("reviews-area");

            reviewList.innerHTML = "";

            for(let review of rList){
                /* 전체 후기 감싸는 박스 reviewBox */
                const reviewBox = document.createElement("section");
                reviewBox.id = "user-reviews";

                const reviewRow = document.createElement("div");
                reviewRow.id = "reviews-top";

                const writerImage = document.createElement("img");
                writerImage.id = "reviews-image";

                const writerName = document.createElement("div");
                writerName.id = "reviews-user-nick";

                const DTArea = document.createElement("div");
                DTArea.id = "create-date-area";

                const createDate = document.createElement("div");
                createDate.id = "reviews-create-date";

                DTArea.append(createDate);

                reviewRow.append(writerImage, writerName, DTArea);

                const shortReview = document.createElement("div");
                shortReview.id = "reviews-shorts";

                const textReview = document.createElement("div");
                textReview.id = "reviews-user-text";

                const footReview = document.createElement("div");
                footReview.id = "reviews-footer";

                const itemReview = document.createElement("div");
                itemReview.id = "reviews-user-item";

                const btnArea = document.createElement("div");
                btnArea.id = "hideBtn-area";

                const hideBtn = document.createElement("button");
                hideBtn.id = "hideBtn";
                /* hideBtn.setAttribute("onclick", ""); */

                btnArea.append(hideBtn);
                footReview.append(itemReview,btnArea );

                reviewBox.append(reviewRow,shortReview, textReview,footReview);

            }




        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}