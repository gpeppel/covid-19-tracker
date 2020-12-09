document.addEventListener("mouseover", changeButtonBefore);
document.addEventListener("mouseout", changeButtonAfter);

function changeButtonBefore() {
    var e = document.getElementById("me");
    e.classList.remove("me");
    e.classList.add("me-after");
}
function changeButtonAfter() {
    var e = document.getElementById("me-after");
    e.classList.remove("me-after");
    e.classList.add("me");
}