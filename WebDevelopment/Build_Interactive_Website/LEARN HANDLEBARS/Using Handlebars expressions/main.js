//access the HTML stored in the script element
//access the innerHTML of the element with id "greet" and assign it to const source
const source= document.getElementById('greet').innerHTML;

//need a function to replace the Handlebars expression in the HTML
//call Handlebars.compile() function with source like argument, the returned value is a function that when passed an object returns a compiled template in a string
const template = Handlebars.compile(source);

//5.create a context object to hold values for filling out the Handlebars template, save it as a const variable. Add a key of greeting with the value "Hello World!"
const context = {
  greeting: 'Hello World!'
}

//6.  call template() with an argument of context and save the value to a const variable compileHtml
const compiledHtml = template(context);

//7. select the element that will contain the templated HTML.
//create a variable named fill using the const keyword and assign it 
const fill = document.getElementById('hello');

//8. add the compiled template HTML to the web page. Assign compiledHtml to fill's innerHTML property
fill.innerHTML = compiledHtml;

//document.getElementById('hello').innerHTML = 
//Handlebars.compile(document.getElementById('greet').innerHTML)({greeting: 'HelloWorld'});

