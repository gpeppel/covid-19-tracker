<script>
    function changeButtonBefore() {
        var i;
        var image_id = document.getElementById("me");
        image_id.removeAttribute("id");
        image_id.setAttribute("id", "me-after");
        // for (i = 0; i < document.getElementsByTagName('img').length; i++) {
        //     if (image_id.classList.contains("greggie")) {
        //         document.getElementsByTagName("img")[i].setAttribute("id", "me-after");
        //     }
        // }
    }
    function changeButtonAfter() {
        var i;
        var image_id = document.getElementById("me-after");
        image_id.removeAttribute("id");
        image_id.setAttribute("id", "me");
        // for (i = 0; i < document.getElementsByTagName('img').length; i++) {
        //     if (image_id.classList.contains("greggie")) {
        //         document.getElementsByTagName("img")[i].setAttribute("id", "me");
        //     }
        // }
    }
</script>
<script src="js/drawPoly.js"></script>
<script src="js/modal.js"></script>