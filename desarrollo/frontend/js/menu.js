const hamburguesa = document.querySelector('.menu-list');
const menu = document.querySelector('.nav_links');

console.log(menu)
console.log(hamburguesa)

hamburguesa.addEventListener('click', ()=>{
    menu.classList.toggle("spread");
    hamburguesa.classList.toggle("inshow")
})

window.addEventListener('click', e=>{
    if(menu.classList.contains('spread')
        && e.target != menu && e.target !=hamburguesa){
            menu.classList.toggle("spread");
            hamburguesa.classList.toggle("inshow")
    }
})
