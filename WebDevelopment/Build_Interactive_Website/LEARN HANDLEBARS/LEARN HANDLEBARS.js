https://developer.mozilla.org/en-US/docs/Glossary/CDN

===================================
LEARN HANDLEBARS
Introduction to Handlebars


In this lesson, you will expand your ability to create dynamic web pages by learning about an external library, Handlebars.js!

A library is a collection of code that is already written that makes development easier. In the case of Handlebars, you are provided a templating engine which allows you to generate reusable HTML with JavaScript. Another benefit is that Handlebars keeps a clear separation of when you’re writing HTML or JavaScript.

Invitations are a great example of a “real life” template. Invitation cards usually include the invitee’s name, the venue location, the time and date, and maybe a short description. If you had to write all of that information out, then you would realize that most of the information is repeated — the only change you really need to make is the name! Creating a template with a blank space for the name would make it much easier for you to invite all your friends and family!

The idea of templating becomes even more useful for web pages that have thousands or even millions of views. Take for instance this exercise that you’re working on right now — it has the same material for every visitor, the only major difference is your own personal icon on the top right corner. You wouldn’t want to create a unique page for every single visitor, use a template and sub in the values you need to.

Instructions
1.
Take a look at the text on the web page and note all the instances that ‘vanilla’ comes up.

In main.js, re-assign the value of flavor in the context object to 'chocolate'. Then run your code.

Notice all the changes you made with one edit!

===============================================

LEARN HANDLEBARS
Implementing Handlebars


Watch the video to get an in-depth overview of the code used in the previous exercise. In case you want to watch it at a later time, here is the YouTube link.

The major steps of using Handlebars in a project:

Add the Handlebars library to your project. — one option is to use a Content Delivery Network (CDN): MDN CDN documentation.
Create a Handlebars script in your HTML file.
In your JavaScript file, grab the HTML stored in the Handlebars script.
Use Handlebars.compile() to return a templating function.
Pass in a context object to the templating function to get a compiled template.
Render the compiled template onto the web page.


===============================================
LEARN HANDLEBARS
Using Handlebars expressions


The power of Handlebars lies in its reusability and extensibility. Handlebars expressions allow us to accomplish this.

Inside a script, Handlebar expressions are wrapped with double braces, {{ }}. The content inside the curly braces serves as a placeholder.

For instance, if we use the following script:

<script id="foo" type="text/x-handlebars-template">
  <p>{{bar}}</p>
</script>
And our JavaScript file looks like:

const source = document.getElementById('foo').innerHTML;

const template = Handlebars.compile(source);

const context = {
  bar: 'Text of the paragraph element'
};

const compiledHtml = template(context);
After running our code, the expression, {{bar}} is replaced with the value of context.bar in our JavaScript file. In other words, compiledHtml will contain a string of '<p> Text of the paragraph element </p>'.

Instructions
1.
Start by creating your Handlebars template in index.html. Under the opening <head> tag, create a <script> element. Give the script element an attribute of id with a value of 'greet'. Then, add another attribute, type to the same script, and assign type a value of 'text/x-handlebars-template'.

The id will allow you to select the HTML inside the script and the type determines that it is going to be used by the Handlebars object.

2.
In the <script> element you just made, add a Handlebars expression with greeting inside the expression.

3.
Now navigate to your main.js file. You want to access the HTML stored in the <script id="greet" type="text/x-handlebars-template"> element to later make a Handlebars template:

Access document.getElementById('greet').innerHTML and assign it to a const variable source.
4.
source is a string that contains the raw HTML, but you want to be able to replace the Handlebars expressions with actual values. Sounds like you need a function to replace the Handlebars expressions in the HTML.

Call Handlebars.compile() with source and save the returned value in a template using const. template is a function that when passed an object returns a completed/compiled template in a string.

5.
Create a context object to hold values for filling out the Handlebars template.

Create an object context and save it as a const variable. Add a key of greeting with the value 'Hello World!'.

To create an object, the syntax would look similar to:

const someVariable = {
  key: value
}
6.
To replace the Handlebars expressions with the values in context, call template() with an argument of context and save the value to a const variable compiledHtml.

7.
Now you have to select the element that will contain the templated HTML.

Create a variable named fill using the const keyword and assign it document.getElementById('hello')

8.
It’s time to add the compiled template HTML to the web page.

Assign compiledHtml to fill‘s innerHTML property.

Once you pass the checkpoint, the browser will render ‘Hello World!’.

==================================================
LEARN HANDLEBARS
Handlebars "If" block helper



So far, you’ve only used Handlebars expressions to insert values in your templates. If you want to check for a specific object property before you insert a value, Handlebars provides you with the {{if}} helper block. The {{if}} helper is similar to the if conditional in JavaScript, but there is a difference in syntax:

{{#if argument}}
  // Code to include if the provided argument is truthy 
{{/if}}
Notice that the example above has both an opening {{#if}} expression and a closing {{/if}} expression. The code block between those expressions will be added to the final HTML template if the argument provided is truthy.

Instructions
1.
In the index.html file, locate the <script> that has an id of 'ifHelper'. Inside the located <script> element, add an {{if}} helper block. Provide an argument of opinion to the opening {{if}} expression.

2.
Inside the {{if}} block, add an opening and closing <p> tag. Inside the created <p> add in the text: "The correct way to say 'GIF' is GIF!".

This template will now include a <p> element that says "The correct way to say 'GIF' is GIF!" if opinion is truthy.

3.
Go to main.js. Some of the boilerplate code has been provided for you. However, you still have to create the object that you want to pass into template.

In a line below template, declare a variable named context using the keyword const. Then, assign to context an object that has a property of opinion and a value of true.

4.
Finally, in the last line of main.js, assign debateElement‘s .innerHTML property the value of compiledHtml.

Run the code and you should see some text appear on the browser!

==========================================
LEARN HANDLEBARS
Handlebars "Else" section


In the previous exercise, you used {{if}} to determine if the compiled HTML should include a block of code. But, if that argument turns out to be falsy then you’ll just have a blank section in your HTML!

Instead, you can add a default line of code by creating an else section, using Handlebar’s {{else}} expression.

Take a look at the following code to see how {{else}} is implemented:

{{#if argument}}
  // Code to include if the provided argument is truthy 
{{else}}
  // Code to include if the provided argument is falsy 
{{/if}}
In this exercise, you’ll incorporate an else section into your code from the previous exercise.

Instructions
1.
In index.html, in the <script> that has an id attribute of 'ifHelper', add an {{else}} expression inside the the {{if}} helper block.

2.
Great, now you’ve started on your else section, but you need to include some code. Add into your else section a <p> element that contains the text: There's no right way to say GIF!

3.
Go to main.js and assign the opinion property of context to false.

Run your code and you should see the falsy condition appear in the browser!

==============================================

LEARN HANDLEBARS
Handlebars "Each" and "This" - Part I


Another helper that Handlebars offers is the {{each}} block which allows you to iterate through an array. Just like the {{if}} block, there is an opening {{#each}} expression and closing {{/each}} expression. Inside the {{each}} block, {{this}} acts as a placeholder for the element in the iteration.

Below is an example of the Handlebars {{each}} block:

{{#each someArray}}
  <p>{{this}} is the current element!</p>
{{/each}}
This {{each}} block would be paired with an array like:

const context = {
  someArray: ['First', 'Second', 'Third'] 
}
After compiling, the HTML will look like:

<p>First is the current element!</p>
<p>Second is the current element!</p>
<p>Third is the current element!</p>
In this exercise, you’ll be writing your own {{each}} block and using the {{this}} expression.

Instructions
1.
In index.html, in the <script> element with an id of eachHelper, create an {{each}} helper block. Use {{#each}} to start the block and {{/each}} to end the block. Add an argument of newArray to the starting expression.

2.
Inside the {{each}} block, add a <div> element with a class attribute of "block". The content of the <div> will be {{this}}.

Before you run the code, navigate to main.js and find the newArray property of the context object.

Notice that the newArray property contains an array of the letters 'a', 'b', and 'c'.

Run your code. If all went well you’ll now have 3 blocks on the webpage!

3.
Just to showcase how useful {{this}} and {{each}} can be, delete the elements inside the newArray. Instead of letters, filled array with elements of numbers starting with 1 and ending in 10.

Run your code. This time, if all went well, your letters will be replaced with 10 blocks that increase from 1 to 10!

Make sure you’ve deleted the letters inside the array newArray. newArray should have a value of [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

============================================
LEARN HANDLEBARS
Handlebars "Each" and "This" - Part II

Using {{this}} also gives you access to the properties of the element being iterated over.

For instance, if you’re using the following array inside the context object:

const context = {
  someArray: [
    {shape: 'Triangle'},
    {shape: 'Circle'},
    {shape: 'Square'}
  ] 
}
And your template looks like:

{{#each someArray}}
  <p>The current shape is: {{this.shape}}!</p>
{{/each}}
After going through the steps of compiling, the finished HTML will look like:

<p>The current shape is: Triangle!</p>
<p>The current shape is: Circle!</p>
<p>The current shape is: Square!</p>
This exercise will provide additional practice using the {{each}} block and accessing properties using {{this}}.

Instructions
1.
In index.html, in the <script> element with an id of languagesTemp, add an {{each}} helper block. Use {{#each}} to start the block and {{/each}} to end the block. Then in the starting expression, add an argument of languages.

2.
Inside the {{each}} block, add a <div> element with a class attribute of "card". Inside the <div> element, add a <p> element with the text: I should learn {{this.name}}..

After compiling, for each iteration of elements, {{this.name}} will be replaced with a value.

3.
Navigate to main.js. In the context object, add a languages property and set its value to an empty array.

4.
Populate the languages array with 3 objects. Each object will have a name property. The values for the name are: 'HTML', 'CSS', 'JavaScript'.

==========================================

LEARN HANDLEBARS
Combining "If" and "Each"


In the previous exercises, you’ve mostly worked with individual expressions, however, you have the ability to combine expressions! In this exercise, you will combine the {{if}} block and the {{each}} block together in a single <script>!

Let’s revisit the code from the previous exercise. In this exercise, you’ll be adding an element to the languages array and adding a new property, modern, to all the elements. Then you will manipulate the Handlebars script to show different texts based on the modern property.

Instructions
1.
In main.js, add a modern property with a value of true to each element of the languages array.

2.
Now, add another object to the array in the languages property of context. This object will have a name property with a value of 'COBOL' and a modern property of false.

If you take a look at the web page, you’ll see that you should learn every language. But, since ‘COBOL’ isn’t a modern language maybe it should be given less priority. Let’s change that in the next step.

3.
Navigate to index.html, in the Handlebars <script>, add a starting {{if}} expression directly under the <div class="card">. Add an argument of this.modern to the starting {{if}} expression.

Then, directly above the closing <div> tag, add the closing {{if}} expression.

4.
Great, now you should see that ‘COBOL’ is no longer on the web page!

But remember, you can use {{else}} to create a default behavior for when languages are not modern.

In the Handlebars <script> element, add an {{else}} section to the {{if}} block. Inside the {{else}} section, add a paragraph element that has the text When I have time, I'll learn {{this.name}}.

Now you’ve covered both cases when the language is modern and when it isn’t!


+++++++++++++++++++++++++++++++++++++
index.html

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Languages</title>
    <link href="public/style.css" type="text/css" rel="stylesheet">
    <script src="handlebars.min.js"></script>
    <script id="languagesTemp" type="text/x-handlebars-template">
			{{#each languages}}
      	<div class="card">
        	{{#if this.modern}}
          	<p>I should learn {{this.name}}.</p>
          {{else}}  
          	<p>When I have time, I'll learn {{this.name}}</p>
          {{/if}}
              
         </div>
      {{/each}}
    </script>
  </head>
  <body>
    <h1>
      Thoughts on Languages:
    </h1>
    <div id="goals">
    </div>
  	<script src="public/main.js" type="text/javascript"></script>  
  </body>
</html>


++++++++++++++++++++++++++
main.js 

const source = document.getElementById('languagesTemp').innerHTML;
const template = Handlebars.compile(source);

const context = {
  languages: [
    {
      name: 'HTML',
       modern: true,
    },
    {
      name:'CSS',
       modern: true,
    }, 
    {
      name: 'JavaScript',
       modern: true,
    },
    {
      name: 'COBOL',
      modern: false,
    }
  ],
 
};

const compiledHtml = template(context);

const displayGoals = document.getElementById('goals');
displayGoals.innerHTML = compiledHtml;

============================================

LEARN HANDLEBARS
Review


Great work you now know the fundamentals of using Handlebars! Let’s recap a few key points:

Handlebars is an external library used to create templates which are a mix of HTML, text, and expressions.
Handlebars uses expressions which are wrapped inside double braces like: {{someVariable}}
A script tag with a type of "text/x-handlebars-template" is used to deliver a template to the browser.
Handlebar.compile() returns a templating function from a template script script intended for Handlebars.
A template created from .compile() will take an object as an argument and use it as context to generate a string containing HTML.
Handlebars has built in block helpers which can be included in a Handlebars script.
Block helpers have a starting expression and an ending expression. The starting expression will have a # appears before a keyword. The ending expression will have the same keyword but with a / character to denote the end.
The {{if}} will conditionally render a block of code.
An {{else}} expression can be inserted into an if helper block and used as part of the conditional statement.
{{each}} is another built-in helper expression which accepts an an array to iterate through.
In the block helper functions, the {{this}} expression gives context and serves as a placeholder for the current value.
Instructions
If you want to challenge yourself:

Add more elements and properties to the array in the languages property.
Re-write the code in the code editor from scratch.
Wrap an {{each} block inside an {{if}} block.
Create a separate Handlebars script and insert the finished template into a different section of the web page.