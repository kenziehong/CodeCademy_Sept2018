https://developer.mozilla.org/en-US/docs/Web/Events

----------------------------------------------
DOM EVENTS WITH JAVASCRIPT
What is an Event?


When you refresh your email inbox, double tap on a post, or scroll through a newsfeed — something cool happens in your browser. These actions are known as events!

Events on the web are user interactions and browser manipulations that you can program to trigger functionality. Some examples of events are:

A mouse clicking on a button
Webpage files loading in the browser
A user swiping right on an image
You can create interactivity on a website by assigning a function to respond to a specific event firing, or triggering. In this lesson, you’ll learn to use JavaScript with events to create dynamic websites.

Instructions
Check out the recipe webpage — you can play around with the events and their specific functions!

Increase the measurements of the ingredients by clicking the + button.
Hover over the instructions to see the estimated cook time.
Click on highlighted ingredients in the instructions for facts about the foods in the ingredient list.
Click the bar at the bottom to change its background color.

------------------------------------------------
DOM EVENTS WITH JAVASCRIPT
"Firing" Events


After a specific event fires on a specific element in the document object model (or DOM), an event handler function can be created to run as a response. In this lesson, we will learn about event handler functions that modify and update DOM elements after an event fires.

Let’s compare this to something more familiar: a cuckoo clock is an example of programming with events! When the clock hands strike a new hour, the cuckoo bird responds with a whistle for each hour. For example, the cuckoo bird will whistle twice when the clock strikes 2 o’clock.

As you can see in the diagram, the clock striking an hour is the specific event that causes a specific response from the cuckoo bird. Event handler functions wait for their specific events to fire like the cuckoo bird in the clock awaiting the next hour. These functions can be used to change a DOM element’s color, text and much more!

Most events in the browser take place without being noticed — the events are undetected because there is no event handler associated with the event to execute an action. Event handlers are crucial for creating interactive websites with JavaScript.

Instructions
Check out the diagram to see the event firing process on a cuckoo clock.

----------------------------------------
DOM EVENTS WITH JAVASCRIPT
Event Handler Registration


You’re doing great! Now it’s time to dive into using event handler functions to create interactivity.

JavaScript interprets registered events as event objects with properties and methods. When you create an event handler function on a specific event, you create a property of the event object.

An event handler function is registered as a property attached to the DOM element being interacted with, or the event target. Check out the syntax:

let eventTarget = document.getElementById('targetElement');

eventTarget.onclick = function() {
  // this block of code will run
}
Let’s break this down!

First, we accessed the DOM element that serves as the event target by its ID using document.getElementById('targetElement').
Then we created the event handler property which consists of the event target followed by the event name (the prefix on- and the event type.) In this example, we’re using the click event which fires when the user presses and releases a mouse button on a DOM element.
Lastly, we assigned an event handler function to the property.
Event handlers can also be registered as an HTML element attribute, but you should always avoid inline JavaScript code in HTML files!

Instructions
1.
Check out the excerpt about JavaScript. There is more information, or moreInfo, to be read when the user clicks the readMore element, but it does not appear to be working. You are going to create an event handler to fix this!

First, create an event handler property for a click event that uses the readMore button as the event target.

2.
Now, you need to make the moreInfo element appear when the click event fires. Create a statement that changes the .display style property of the moreInfo element to 'block'.

Once you’ve completed this run your code and fire your event!

==========================
let readMore = document.getElementById('read-more');
let moreInfo = document.getElementById('more-info');

// Write your code here:
readMore.onclick = function(){
  moreInfo.style.display = "block";
};

----------------------------------------------------------------
DOM EVENTS WITH JAVASCRIPT
Adding Event Handlers


It’s best practice to create named event handler functions, instead of anonymous functions. Your code will remain organized and reusable this way, even if your code gets complex. Check out the syntax:

let eventHandlerFunction = function() {
  // this block of code will run
}

eventTarget.onclick = eventHandlerFunction;
The .addEventListener() method is another common syntax for registering event handlers. An event listener waits for a specific event to occur and calls a named event handler function to respond to it. This method requires two arguments:

The event type as a string
The event handler function
Check out the syntax of an .addEventListener() method with a click event:

eventTarget.addEventListener('click', eventHandlerFunction);
You’ll want to use the .addEventListener() method to allow multiple event handlers to be registered to a single event without changing its other event handlers.

Instructions
1.
Play around with the view and close elements to meet the Codecademy mascot, Margo. Margo is super happy you made it this far and she needs your help!

Right now, the open function makes the margo and the close elements visible by changing their .display properties to 'block'. The hide function hides the same elements by assigning a 'none' value to the .display properties.

Margo wants you to create a function that changes the text in the view element to 'Hello, World!'. Call this function textChange.

2.
Next, you must create a function named textReturn that changes the text of the view variable back to the default.

3.
Assign textChange as an event handler function to a click event fired on the view variable and run your code.

4.
Assign textReturn as an event handler function to a click event fired on the close variable. Then run your code and fire the events!

==============================
main.JavaScript

// Add the code you want to test below:
let view = document.getElementById('view-button');
let close = document.getElementById('close-button');
let margo = document.getElementById('margo');

let open = function() {
  margo.style.display = 'block';
  close.style.display = 'block';
};

let hide = function() {
  margo.style.display = 'none';
  close.style.display = 'none';
};

view.onclick = open;
close.onclick = hide;

// Write your code here
let textChange = function (){
  view.innerHTML = "Hello, World!";
};

let textReturn = function(){
  view.innerHTML = "View";
};

view.addEventListener("click",textChange);
close.addEventListener("click",textReturn);


====================================
index.HTML

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
</head>

<body>
  <section id='container'>
  <button id='view-button'>View</button>
  <img src="https://s3.amazonaws.com/codecademy-content/courses/javascript-dom-events/Margot_medal.svg" id='margo'>
  <button id='close-button'>Close</button>
</section>
  
  <script  src="main.js"></script>

</body>
</html>

======================================
style.css

body{
  margin: 0;
  padding: 0;
  font-family: 'Nunito';
}
#container{
  background: #141c3a;
  margin: 0;
  display: block;
  float: left;
  width: 100vw;
  height: 100vh;
}
#view-button{
  width: 380px;
  height: 50px;
  font-size: 24px;
  border: none;
  display: block;
  background-color: #6df0c2;
  margin: 0 auto;
  margin-top: 20px;
  margin-bottom: 20px;
  cursor: pointer;
  font-family: 'Nunito';
}
#margo{
  display: none;
  width: 200px;
  margin: 0 auto;
}
#close-button{
  width: 380px;
  height: 50px;
  font-size: 24px;
  border: none;
  display: none;
  background-color: #fd4d3f;
  margin: 0 auto;
  margin-top: 20px;
  cursor: pointer;
  font-family: 'Nunito';
}

----------------------------------------------------------------------

DOM EVENTS WITH JAVASCRIPT
Removing Event Handlers


The .removeEventListener() method is used reverse the .addEventListener() method. This method stops the code from “listening” for an event to fire when it no longer needs to. .removeEventListener also passes two arguments:

The event type as a string
The event handler function
Check out the syntax of a .removeEventListener() method with a click event:

eventTarget.removeEventListener('click', eventHandlerFunction);
Because this method unregisters event handlers, it needs to identify which function to remove from the event. The event handler function passed to the .removeEventListener() method must be the same function of the corresponding .addEventListener().

Instructions
1.
This digital restaurant needs your help because the lock on the door is broken! Click on the lock and unlock elements and you will see that people are able to get in even when the restaurant is closed. They need you to use .removeEventListener() to turn off keep the door locked.

First, you must add an event listener to the lock element when a click event is fired with an anonymous function.

Inside the function, add a .removeEventListener() to turn off the openDoor function when a user tries to click the door element. Then run your code and fire the event to test out your event handlers.

===================================
DOM EVENTS WITH JAVASCRIPT
Event Object Properties


JavaScript stores events as event objects with their related data and functionality as properties and methods. There are pre-determined properties associated with event objects. You can call these properties to see information about the event, for example:

the .target property to access the element that triggered the event.
the .type property to access the name of the event.
the .timeStamp property to access the number of milliseconds that passed since the document loaded and the event was triggered.
Instructions
1.
Everyone loves a good puppy picture! Use what you’ve learned about event object properties to share this puppy photo with your friends.

First, add a statement to the sharePhoto function that will change the display property of the event .target to 'none'.

You’ll need to use the .target property on an event object to access the event target, like so event.target.

2.
Next, add a statement to the sharePhoto function that will modify the text element to state the number of milliseconds from the DOM loading to the event firing.

3.
Now, to create functionality for the event object, assign the sharePhoto function to a click event on the share element.

Run your code!

----------------------------------------
DOM EVENTS WITH JAVASCRIPT
Event Types


Beyond the click event, there are all types of DOM events that can fire in a browser! It’s important to know most events in the DOM take place without being noticed because there are no event handlers connected to them.

It’s also important to know some registered events don’t depend on user interactions to fire. For instance, the load event fires after website files completely load in the browser.

Browsers can fire many other events without a user — you can check out a list of events on the MDN Events Reference page.

Many events need user interaction with the DOM to fire. One user interaction event you’ve become familiar with is the click event. A click event fires when the user presses and releases a mouse button on an element in the DOM.

Click Event Image
In the rest of this lesson, you’ll explore more user interaction event types like the mouse and keyboard events. To explore more event types, check out the MDN Events Reference.

Instructions
1.
We made a really cool color generator to help people find different colors — try it out! Uh oh, it seems to be broken. We need you to use your new knowledge to fix the website.

Complete the colorChange function to randomly change the colors of the buttons when specific events are fired on them. First, add the following variable to the event handler function: let randomColor = 'rgb(' + rgb(255) + ',' + rgb(255) + ',' + rgb(255) + ')';

2.
Add a statement that changes the background color of the event target and set it equal to randomColor.

To change the value of hyphenated style properties in JavaScript you must use camel case. For example, the font-size property will become fontSize.

3.
There are two elements that should change color on this web page. First, create an event handler property on the button element that fires when it’s clicked. Use colorChange as the event handler function.

Then run your code and fire the click event.

4.
Next, create an event handler property using the mysteryButton element as the target and assign it to the same event handler function.

This property needs an event that fires when you rotate the mouse wheel or slide down on the mousepad. Use the MDN Events Reference page to find the correct event type. Then run your code and fire the event.

--------------------------------------------------------

DOM EVENTS WITH JAVASCRIPT
Mouse Events


When you click down or move the mouse device mouse events fire. Outside of the click event, there are other events that can be fired when using a mouse.

The mousedown event is fired when the user presses a mouse button down. This is different from a click event because mousedown doesn’t need the mouse button to be released to fire.

Mouse Down Event Image
The mouseup event is fired when the user releases the mouse button. This is different from the click and mousedown events because mouseup doesn’t depend on the mouse button being pressed down to fire.

Mouse Up Event Image
The mouseover event is fired when the mouse enters the content of an element.

Mouse Over Event Image
The mouseout event is fired when the mouse leaves an element.

Mouse Out Event Image

Instructions
1.
In this exercise, you’ll modify the list elements using mouse events. You can use the reset element that is already programmed to set the other list element back to their default styles.

First, create an event handler property on itemOne when the mouse hovers over it.

This can be an anonymous function with syntax like this:

eventTarget.onevent
2.
Now, assign an anonymous event handler function that changes the width of itemOne to any size greater or less than 400px.

3.
Now, create an event handler property on itemTwo when the mouse is released over the element.

4.
Create an event handler function that changes the background color of itemTwo when the mouse is released over the element.

5.
Next, create an event handler property that fires when the mouse leaves the itemThree element.

6.
Create an anonymous event handler function that changes the text of itemThree to 'The mouse has left the element.'.

7.
Finally, create an event handler property that fires when the mouse is pressed down on itemFour.

8.
Create an event handler function that makes the itemFive appear when the mouse is pressed down on itemFour.

==================================
DOM EVENTS WITH JAVASCRIPT
Keyboard Events


Another popular type of event is the keyboard event! keyboard events are triggered by user interaction with keyboard keys in the browser.

The keydown event is fired while a user presses a key down. Key Down Event Image

The keyup event is fired while a user releases a key. Key Up Event Image

The keypress event is fired when a user presses a key down and releases it. This is different from using keydown and keyup events together, because those are two complete events and keypress is one complete event. Key P ress Event Image

Keyboard events have unique properties assigned to their event objects like the .key property that stores the values of the key pressed by the user. You can program the event handler function to react to a specific key, or react to any interaction with the keyboard.

Instructions
1.
Now it’s time to create a game! Program this code to dribble the ball on the platform using any key on a keyboard. When a user presses a key down, it should lift the ball up. When the user releases the key, the ball should drop.

First, make a function named up that will raise the bottom position of the ball to '250px' above the platform element.

The bottom style property stores the vertical position of an element. It should be assigned to a value of '250px' as a string, not a number.

2.
Next, make a function named down that will run when the ball drops to the platform element. This function should change the bottom position of the ball to '50px'.

3.
Create an event handler property that runs the up function when a keydown event fires on the document object, or anywhere on the DOM, as the event target.

4.
Create an event handler property that runs the down function when a keyup event fires on the document.

Run your code and play around with the keyboard events to make the ball bounce on the platform. You can try keys like the space bar, letter keys or number keys!

========================================

DOM EVENTS WITH JAVASCRIPT
Review


Congrats, you completed the lesson! Now you’ve learned about JavaScript events and you can leverage these events on the DOM to create interactivity with event handlers.

Let’s review what you’ve learned:

JavaScript engines register events as objects with properties and methods associated with them.
Event handlers are registered as properties of their event object.
Event object properties like .target, .type, and .timeStamp are used to provide information about the event.
The .addEventListener() method can be used to add multiple event handler functions to a single event.
The .removeEventListener() method stops specific event handlers from “listening” for specific events firing.