window.onload = function() {
    currentPath = window.location.pathname;
    if(currentPath == '/') {
        document.querySelector("nav").className = "nav-top";
    }
}

window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
    if (currentPath == '/' && currentScrollPos == 0) {
        document.querySelector("nav").className = "nav-top";
    } else {
        document.querySelector("nav").className = "nav-scroll";
    }
    prevScrollpos = currentScrollPos;
}