HTTP Requests

console.log('First message!');

//pass a function call to the queue. The first argument is a callback and the second argument is the number of milliseconds the program must wait before the callback can be run
setTimeout(() => {
   console.log('This message will always run last...');
},2500);
console.log('Second message!');


---------------------------------------------------------
XHR GET Requests II

//1.First, we need to create the XMLHttpRequest object using the new operator. Save this object in a const called xhr
const xhr = new XMLHttpRequest ();

//2.save the following URL to a const called url. Make sure the URL is wrapped in quotes so that it is a string.
const url = 'https://api-to-call.com/endpoint';

//3.Set the responseType property of the xhr object to equal 'json' by using dot notation.JSON is JavaScript Object Notation, which is how the response is going to be formatted.
xhr.responseType = 'json';

//4.Set the xhr.onreadystatechange event handler equal to an anonymous arrow function. Leave the function empty.
xhr.onreadystatechange = ()=>{
  
  //5. add this conditional statement to check the request has finished
  if(xhr.responseType=== XMLHttpRequest.DONE){

  	//6.return the response property of xhr
     return xhr.response;
     }
};

//7.call the .open() method on the xhr object and pass it 'GET' and url as arguments..open() creates a new request and the arguments passed in determine the type and URL of the request
xhr.open('GET',url);

//8.call the .send() method on the xhr object. Do not pass it any arguments. Nice work! You've written the boilerplate code for an AJAX GET request using an XMLHttpRequest object.
xhr.send();


----------------------------------------------------------------------------
XHR GET Requests III

// Information to reach API

//1.create a const named url and save to it the following URL (as a string).You'll be using this URL to direct your request
const url = 'https://api.datamuse.com/words?';

//2.create another const named queryParams and assign it to 'rel_rhy='(is the start of a parameter for the query string. This parameter will narrow your search to words that rhyme.)
const queryParams = 'rel_rhy=';

// Selecting page elements
const inputField = document.querySelector('#input');
const submit = document.querySelector('#submit');
const responseField = document.querySelector('#responseField');

// AJAX function
const getSuggestions = () => {
  
  //3.create a const named wordQuery and assign it to be inputField.value. It grabs what is in the inputField and assigns it to the variable wordQuery
  const wordQuery = inputField.value;
  
  //4. create another const named endpoint, and assign equal to a string that concatenates url, queryParams, and wordQuery. endpoint will store the value of the entire URL and query string
  const endpoint = url + queryParams + wordQuery;
  
  //5.  Declare a const named xhr and use the new operator to create the XMLHttpRequest object
  const xhr = new XMLHttpRequest();
  
  //6.Set the responseType of xhr to 'json'. When data is sent back, it will be in JSON format.
  xhr.responseType = 'json';
  
  //7.Assign an anonymous arrow function to the onreadystatechange event handler of xhr
  xhr.onreadystatechange = ()=>{
    
    //8.The renderRawResponse() helper function can be viewed at public/helperFunctions.js.
    if(xhr.readyState === XMLHttpRequest.DONE){
      
      //11.Now delete renderRawResponse(xhr.response) and replace it with renderResponse(xhr.response) and run your code
       renderResponse(xhr.response);
       }
    
    //9.call the .open() method on the XHR object and pass it 'GET' and endpoint as respective arguments. This method call will create a new request using the two arguments: 'GET' sets the method and url sets the destination.
    xhr.open('GET',endpoint);
    
    //9. call the .send() method on xhr and pass it no arguments. The .send() method will send the request to the server.
    xhr.send();
    
  };
  

}

// Clear previous results and display results to webpage
const displaySuggestions = (event) => {
  event.preventDefault();
  while(responseField.firstChild){
    responseField.removeChild(responseField.firstChild);
  };
  getSuggestions();
}

submit.addEventListener('click', displaySuggestions);



--------------------------------------------------------------------------
XHR GET Requests IV

// Information to reach API
const url = 'https://api.datamuse.com/words?';

//1.Have const queryParams store the value 'rel_jjb='. This will search for words that describe another word.
const queryParams = 'rel_jjb=';

//2.Since we want to retrieve more specific results, we should create another parameter. Create another const additionalParams underneath queryParams, and assign it '&topics='
const additionalParams = '&topics=';

// Selecting page elements
const inputField = document.querySelector('#input');
const topicField = document.querySelector('#topic');
const submit = document.querySelector('#submit');
const responseField = document.querySelector('#responseField');

// AJAX function
const getSuggestions = () => {
  const wordQuery = inputField.value;
  
  //3.declare a const topicQuery, and assign it to the value of topicField.
  const topicQuery = topicField.value;
  
  //4.change the value of endpoint to a concatenated string of url, queryParams, wordQuery, additionalParams, and topicQuery. Run code, Our request will have returned a response of adjectives that are related to a topic!
  const endpoint = `${url}${queryParams}${wordQuery}${additionalParams}${topicQuery}`;
  
  const xhr = new XMLHttpRequest();
  xhr.responseType = 'json';

  xhr.onreadystatechange = () => {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      renderResponse(xhr.response);
    }
  }
  
  xhr.open('GET', endpoint);
  xhr.send();
}

// Clear previous results and display results to webpage
const displaySuggestions = (event) => {
  event.preventDefault();
  while(responseField.firstChild){
    responseField.removeChild(responseField.firstChild);
  }
  getSuggestions();
}

submit.addEventListener('click', displaySuggestions);



-----------------------------------------------------------------------------
XHR POST Requests II

//1.Create a new XMLHttpRequest object using the new operator, and save it in a const called xhr. The XMLHttpRequest object is used in JavaScript to interact with servers.
const xhr = new XMLHttpRequest();

//2.save the following URL to a const called url. Make sure the URL is wrapped in quotes so that it is a string. The URL will direct the request to the correct server.
const url = 'https://api-to-call.com/endpoint';

//3.Create a new const called data, and save this line of code to it. JSON.stringify() will convert a value to a JSON string. By converting the value to a string, we can then send the data to a server.
const data = JSON.stringify({id: '200'});

//4.Set the responseType property of the xhr object to be 'json'.To access the responseType property, use dot notation like so: xhr.responseType. Then to assign it to 'json' you can use the following syntax:
xhr.responseType = 'json';

//5.Set the xhr.onreadystatechange event handler equal to an anonymous arrow function. .onreadystatechange will contain the event handler that will be called when xhr's state changes
xhr.onreadystatechange = ()=>{
  
  //6.add a conditional statement that checks to see if the readyState of xhr is equal to XMLHttpRequest.DONE ( see if the request has finished.) .To access the readyState of the xhr object, use dot notation like so: xhr.readyState. When comparing two objects use ===
  if(xhr.readyState === XMLHttpRequest.DONE ){
     
    //7.return the response property of xhr. The response property will contain the data that we're getting back from the POST request
    return xhr.response;
     }
};

//8.call the .open() method on the xhr object and pass it 'POST' and url as arguments..open() creates a new request and the arguments passed in determine what type of request is being made and where it's being made to
xhr.open('POST',url);

//9. call the .send() method on the xhr object and pass data as an argument. .send() will send the request to the server.You've written the boilerplate code for an AJAX POST request using an XMLHttpRequest object.
xhr.send(data);


------------------------------------------------------------------------
XHR Post Requests III

//file main.js

// Information to reach API

//1.Copy your Rebrandly API Key, and assign it to the const apiKey at the top of your code.
const apiKey = 'b3e68237f76c493ea4386c03e6db44e6';
const url = 'https://api.rebrandly.com/v1/links';

// Some page elements
const inputField = document.querySelector('#input');
const shortenButton = document.querySelector('#shorten');
const responseField = document.querySelector('#responseField');

// AJAX functions
const shortenUrl = () => {
  
  //2.create a const called urlToShorten, and save inputField.value to it. urlToShorten will now save the value of the input field
  const urlToShorten = inputField.value;
  
  //3.Create a const called data, and save the following code to it: .We're including this information because the API expects to see an object with a key destination that has a value of a URL
  const data = JSON.stringify({destination: urlToShorten});
  
  //4.Create a new XMLHttpRequest object using the new operator, and save it to a const called xhr.
  const xhr = new XMLHttpRequest();
  
  //5.Set the responseType property of the xhr object to be 'json'
  xhr.responseType = 'json';
  
  //6Save an empty anonymous arrow function to the onreadystatechange event handler of the xhr object.
  xhr.onreadystatechange = ()=>{
    
    //7.add code. The renderRawResponse function can be viewed at public/helperFunctions.js.
    if(xhr.readyState === XMLHttpRequest.DONE){
      
      //10.Enter this URL into the input field, and click the shorten button in the web page (https://medium.com/@codecademy/breaking-the-coding-language-barrier-bf24652c3c60). Notice the object that came back! Now replace renderRawResponse(xhr.response) with renderResponse(xhr.response). Run the code. Paste the URL again and click "Shorten".Isn't it much cleaner?
       renderResponse(xhr.response);
       }
  };
  
  //7.call the .open() method on xhr, and pass it 'POST' and url as respective arguments.
  xhr.open('POST',url);
  
  //8.To access the Rebrandly API, we need a header with two key-value pairs. In the header, you must include values for 'Content-type' and an 'apikey'
  xhr.setRequestHeader('Content-type','application/json');
  xhr.setRequestHeader('apikey', apiKey);
  
  //9.On xhr, call the .send() method, and pass it data as an argument.
  xhr.send(data);
  
}


// Clear page and call AJAX functions
const displayShortUrl = (event) => {
  event.preventDefault();
  while(responseField.firstChild){
    responseField.removeChild(responseField.firstChild);
  }
  shortenUrl();
}

shortenButton.addEventListener('click', displayShortUrl);



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//file helperFunction.js

// Manipulates responseField to render a formatted and appropriate message
const renderResponse = (res) => {
  // Displays either message depending on results
  if(res.errors){
    responseField.innerHTML = "<p>Sorry, couldn't format your URL.</p><p>Try again.</p>";
  } else {  
    responseField.innerHTML = `<p>Your shortened url is: </p><p> ${res.shortUrl} </p>`;
  }
}

// Manipulates responseField to render an unformatted response
const renderRawResponse = (res) => {
  // Displays either message depending on results
  if(res.errors){  
    responseField.innerHTML = "<p>Sorry, couldn't format your URL.</p><p>Try again.</p>";
  } else {
    // Adds line breaks for JSON
    let structuredRes = JSON.stringify(res).replace(/,/g, ", \n");
    structuredRes = `<pre>${structuredRes}</pre>`;
    responseField.innerHTML = `${structuredRes}`;
  }
}
