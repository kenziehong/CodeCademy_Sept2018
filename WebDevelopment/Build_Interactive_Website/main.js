let door = document.getElementById('door');
let unlock = document.getElementById('unlock');
let lock = document.getElementById('lock');
let sign = document.getElementById('sign');
let cafeImage = document.getElementById('image');

cafeImage.hidden = true;

let openDoor = function() {
  door.hidden = true;
  cafeImage.hidden = false;
}

let closeDoor = function(){
  door.hidden = false;
  cafeImage.hidden = true;
}

unlock.onclick = function() {
  sign.innerHTML = 'OPEN';
  unlock.style.backgroundColor = '#6400e4';
  lock.style.backgroundColor = 'lightgray';
}

lock.onclick = function() {
  sign.innerHTML = 'CLOSED';
  lock.style.backgroundColor = '#6400e4';
  unlock.style.backgroundColor = 'lightgray';
}

unlock.addEventListener('click', function(){
  door.addEventListener('click', openDoor);
  image.addEventListener('click', closeDoor);
})

// Write your code here
lock.addEventListener("click",function(){
  door.removeEventListener("click",openDoor);
});


==============================================
DOM EVENTS WITH JAVASCRIPT
Event Object Properties

let social = document.getElementById('social-media');
let share = document.getElementById('share-button');
let text = document.getElementById('text');

// Write your code below
let sharePhoto = function(event) {
  event.target.style.display = 'none';
  text.innerHTML = 'You share the puppy in ' 
  + event.timeStamp + ' ms.' + event.type;
}

share.onclick = sharePhoto;

===================================
DOM EVENTS WITH JAVASCRIPT
Event Types

// This variable stores the "Pick a Color" button
let button = document.getElementById('color-button');

// This variable stores the "Mystery Color" button
let mysteryButton = document.getElementById('next-button');

// This random number function that will creates color codes for the randomColor variable
function rgb(num) {
  return Math.floor(Math.random() * num);
}

// Write your code below
let colorChange = function() {
  let randomColor = 'rgb(' + rgb(255) + ',' + rgb(255) + ',' + rgb(255) + ')';
  event.target.style.backgroundColor = randomColor;
}
button.onclick = colorChange;
mysteryButton.onwheel = colorChange;

==========================================
DOM EVENTS WITH JAVASCRIPT
Mouse Events

// These variables store the boxes on the side
let itemOne = document.getElementById('list-item-one');
let itemTwo = document.getElementById('list-item-two');
let itemThree = document.getElementById('list-item-three');
let itemFour = document.getElementById('list-item-four');
let itemFive = document.getElementById('list-item-five');
let resetButton = document.getElementById('reset-button');

// This function programs the "Reset" button to return the boxes to their default styles
let reset = function() {
  itemOne.style.width = ''
  itemTwo .style.backgroundColor = ''
  itemThree.innerHTML = 'The mouse must leave the box to change the text'
  itemFive.style.display = "none"
};
resetButton.onclick = reset;

// Write code for the first list item
//create an event handler function, mouse pass over
itemOne.onmouseover = function(){
  itemOne.style.width = '430px';
};

// Write code for the second list item
//click mouse
itemTwo.onmouseup = function(){
  itemTwo.style.backgroundColor = 'green'
};

// Write code for the third list item
//out of button
itemThree.onmouseout = function(){
  itemThree.innerHTML = 'The mouse has left the element.'
};

// Write code for the fourth list item
//click mouse
itemFour.onmousedown = function(){
  itemFive.style.display = 'block';
};

==============================================
DOM EVENTS WITH JAVASCRIPT
Keyboard Events


let ball = document.getElementById('float-circle');

// Write your code below
let up = function() {
  ball.style.bottom = '250px';
};
let down = function() {
  ball.style.bottom = '50px';  
};

document.onkeydown = up;
document.onkeyup = down;