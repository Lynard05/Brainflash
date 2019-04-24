var str = '/';
var str2 = document.querySelectorAll('.flip-card').length;
function showFinal(){
	swal(document.querySelectorAll('input[type="checkbox"]:checked').length + ' Correct Out Of ' + 
			document.querySelectorAll('.flip-card').length + ' Possible');

}
function resetCards(){
	document.location.reload();
}
document.addEventListener('DOMContentLoaded', () => {
	
var totalCards = document.querySelectorAll('.flip-card').length.toFixed(1);
	
var percentPerCard = 100 / totalCards;

var total = 0; 
	
const buttons = document.querySelectorAll('.increaseValue');

const incorrectButtons = document.querySelectorAll('.decreaseValue');

var checkboxes = document.querySelectorAll("input[name=checkbox]");



checkboxes.forEach((checkbox)=>{
checkbox.addEventListener( 'change', function() {
    if(this.checked && total + percentPerCard <= 100) {
    	increaseByPercent();
        move();

        
    }
    else if (this.checked){
    	total = 100;
    	move();
    	
    } 
    else if(!this.checked && total - percentPerCard > 0) {
        decreaseByPercent();
     	move();
     	
    } 
    else {
        total =0;
        move();
       
    }
    
})
})


function move() {
  var elem = document.getElementById("myBar");   
  var width = total.toFixed(1) - 1;
  var id = setInterval(frame, 10);

  function frame() {
    if (width >= total) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}

function decreaseByPercent(){
 
  total = total - percentPerCard;
  
}
function increaseByPercent(){
  total = total + percentPerCard;
  
}




});