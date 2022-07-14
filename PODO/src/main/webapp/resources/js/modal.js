window.onload = function(){

    function onclick(){
        document.querySelector(".modal_wrap").style.display = "block";
        document.querySelector(".blank").style.display = "block";

        function offClick(){
        document.querySelector(".modal_wrap").style.display = "none";
        document.querySelector(".blank").style.display = "none";
        }

        document.getElementById("item-report").addEventListener("click", onclick);
        document.getElementById("modal-close").addEventListener("click", offClick);

    }

}