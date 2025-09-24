const menu = document.querySelector('.menu');
menu.addEventListener('click', ()=> {
    const crossIcon = this.querySelector('.cross-icon');
    if (menu.style.display === "none") {
        menu.style.display = "none"
        crossIcon.style.display = "none"
    }
    else {
        crossIcon.style.display = "inline-block"
        menu.style.display = "block"
    }
});