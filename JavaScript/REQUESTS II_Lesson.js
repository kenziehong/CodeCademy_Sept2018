//fetch() GET Requests II

//1. First, call the fetch() function and pass it this URL as a string:. This first argument determines the endpoint of the request. You do not have to save this call to any variable. 

//2.Chain a .then() method to the end of the fetch() function and pass it the success callback arrow function as its first argument. The success callback function takes one parameter, response. .then() will fire only after the promise status of fetch() has been resolved. The callback function will be called with the response once one is received.


fetch('https://api-to-call.com/endpoint').then(
  (response)=>{
  
  //3.Inside of the response callback function, check the ok property of response inside of a conditional statement. In the code block of the conditional statement, return response.json().The reason we're testing the ok property of the response object is that it will be a Boolean value. If there were no errors response.ok will be true and then your code will return response.json().
  if(response.ok===true){
    return response.json();
  } 
  
  //4.Your code will throw this error when response.ok is falsy
  throw new Error('Request failed!');
},
   //5.Add a second argument to .then(), it will be an arrow function that will handle our failures.The second callback function takes a single parameter, networkError. If we could not reach the endpoint at all, e.g., the server is down, then we would get this networkError     
   (networkError)=>{
  console.log(networkError.message);
}                                           
)
//6.Chain another .then() method to the end of the first .then() method. Pass the new .then() method a callback function that takes jsonResponse as its parameter and return jsonResponse.The second .then()'s success callback won’t run until the previous .then() method has finished running. It will also not run if there was an error was thrown previously.
.then(
  (jsonResponse)=>{ return jsonResponse; }
)
;


--------------------------------------------------------------------------------------
//fetch() GET Requests III

//file main.js

// Information to reach API
//1.At the top of main.js, create a const called url. Assign url to the following URL as a string: .Wrap the URL in quotes, this will be the URL of the API that you will be accessing.
const url = 'https://api.datamuse.com/words';

//2. create another const and call it queryParams. Assign it a value of '?sl='. queryParams will be the start of your query string and will narrow your search to words that sounds like your word
const queryParams = '?sl=';

// Selects page elements
const inputField = document.querySelector('#input');
const submit = document.querySelector('#submit');
const responseField = document.querySelector('#responseField');

// AJAX function
const getSuggestions = () => {
  
  //3.create a const called wordQuery and assign it inputField.value. You'll need wordQuery to store the value of what is being typed into the input field.
  const wordQuery = inputField.value; 
  
  //4.add a query string to the URL with all the necessary parameters.Create another const called endpoint, assign it value of a string that is url, queryParams, and wordQuery concatenated in that order.
  const endpoint = url + queryParams + wordQuery;
  
  //5.Call the fetch() function and pass in endpoint as an argument.
  //6.Chain a .then() method to the fetch() function. Pass it a success arrow callback function as an argument. The callback function should take response as its single parameter.
  fetch(endpoint).then(
    (response )=>{
      
      //7.create a conditional statement that checks if the ok property of the response object evaluates to a truthy value. If so, call the function renderJsonResponse() and pass in response as an argument. Then, run your code. Then type in a word to and click the submit button to view the JSON that came back. The status of the promise return from fetch() will be resolved. The code for renderJsonResponse() can be viewed at public/helperFunctions.js.
      if(response.ok){
               
        //renderJsonResponse(response);
        
        //8.Delete renderJsonResponse(response) and replace it with return response.json().
        return response.json();
         }
      
      //9.Below the condition's code block, add this code to raise an exception if the request failed: throw new Error('Request failed!');
      throw new Error('Request failed!');
    },
    
    //10.Separate the success callback function and the error callback function with a comma. The error callback function will also be an arrow function that takes one parameter, networkError. In the code block of the arrow function, log networkError.message to the console.
    (networkError)=>{
      console.log(networkError.message);
    }
  ).
  
  //8.By returning response.json(), the next function that is .then() chained to it will receive a Promise with JSON data.
  then(
    (jsonResponse)=>{ return jsonResponse; }
  );
}

// Clears previous results and display results to webpage
const displaySuggestions = (event) => {
  event.preventDefault();
  while(responseField.firstChild){
    responseField.removeChild(responseField.firstChild);
  }
  getSuggestions();
};

submit.addEventListener('click', displaySuggestions);



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//fetch() GET Requests III
//file helperFunctions.js

// Formats response to look presentable on webpage
const renderResponse = (res) => {
  // Handles if res is falsey
  if(!res){
    console.log(res.status);
  }
  // In case res comes back as a blank array
  if(!res.length){
    responseField.innerHTML = "<p>Try again!</p><p>There were no suggestions found!</p>";
    return;
  }

  // Creates an empty array to contain the HTML strings
  let wordList = [];
  // Loops through the response and caps off at 10
  for(let i = 0; i < Math.min(res.length, 10); i++){
    // creating a list of words
    wordList.push(`<li>${res[i].word}</li>`);
  }
  // Joins the array of HTML strings into one string
  wordList = wordList.join("");

  // Manipulates responseField to render the modified response
  responseField.innerHTML = `<p>You might be interested in:</p><ol>${wordList}</ol>`;
  return
}

// Renders response before it is modified
const renderRawResponse = (res) => {
  // Takes the first 10 words from res
  let trimmedResponse = res.slice(0, 10);
  // Manipulates responseField to render the unformatted response
  responseField.innerHTML = `<text>${JSON.stringify(trimmedResponse)}</text>`;
}

// Renders the JSON that was returned when the Promise from fetch resolves.
const renderJsonResponse = (res) => {
  // Creates an empty object to store the JSON in key-value pairs
  let rawJson = {};
  for(let key in res){
    rawJson[key] = res[key];
  }
  // Converts JSON into a string and adding line breaks to make it easier to read
  rawJson = JSON.stringify(rawJson).replace(/,/g, ", \n");
  // Manipulates responseField to show the returned JSON.
  responseField.innerHTML = `<pre>${rawJson}</pre>`;
}



-----------------------------------------------------------------

//fetch() GET Requests IV

//file main.js

// Information to reach API
const url = 'https://api.datamuse.com/words';
const queryParams = '?sl=';

// Selects page elements
const inputField = document.querySelector('#input');
const submit = document.querySelector('#submit');
const responseField = document.querySelector('#responseField');

// AJAX function
const getSuggestions = () => {
  const wordQuery = inputField.value;
  const endpoint = `${url}${queryParams}${wordQuery}`;
  
  fetch(endpoint).then(response => {
    if (response.ok) {
      return response.json();
    }
    throw new Error('Request failed!');
  }, networkError => {
    console.log(networkError.message)
  }).then(
    
    //1.At the end of the .then() method, chain another .then() method. Pass .then() an anonymous arrow callback function that takes jsonResponse as its single parameter.
    jsonResponse =>{
      
      //2.call the function renderRawResponse() and pass in jsonResponse as an argument. Run the code.In the input field, you can type in a word and click the submit button. If all went well, you should see an array of words that the Datamuse API responded with!You can view the purpose of renderRawResponse at public/helperFunctions.js
      //renderRawResponse(jsonResponse );
      
      //3.Time to clean up that response a bit. Delete renderRawResponse(jsonResponse) and replace it with renderResponse(jsonResponse). Run your code.Try the webpage again with another word!
     renderResponse(jsonResponse);       
      
    }
  );
}

// Clears previous results and display results to webpage
const displaySuggestions = (event) => {
  event.preventDefault();
  while(responseField.firstChild){
    responseField.removeChild(responseField.firstChild);
  }
  getSuggestions();
};

submit.addEventListener('click', displaySuggestions);

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//fetch() GET Requests IV

//file helperFunction.js

// Formats response to look presentable on webpage
const renderResponse = (res) => {
  // Handles if res is falsey
  if(!res){
    console.log(res.status);
  }
  // In case res comes back as a blank array
  if(!res.length){
    responseField.innerHTML = "<p>Try again!</p><p>There were no suggestions found!</p>";
    return;
  }

  // Creates an empty array to contain the HTML strings
  let wordList = [];
  // Loops through the response and caps off at 10
  for(let i = 0; i < Math.min(res.length, 10); i++){
    // creating a list of words
    wordList.push(`<li>${res[i].word}</li>`);
  }
  // Joins the array of HTML strings into one string
  wordList = wordList.join("");

  // Manipulates responseField to render the modified response
  responseField.innerHTML = `<p>You might be interested in:</p><ol>${wordList}</ol>`;
  return
}

// Renders response before it is modified
const renderRawResponse = (res) => {
  // Takes the first 10 words from res
  let trimmedResponse = res.slice(0, 10);
  // Manipulates responseField to render the unformatted response
  responseField.innerHTML = `<text>${JSON.stringify(trimmedResponse)}</text>`;
}

// Renders the JSON that was returned when the Promise from fetch resolves.
const renderJsonResponse = (res) => {
  // Creates an empty object to store the JSON in key-value pairs
  let rawJson = {};
  for(let key in response){
    rawJson[key] = response[key];
  }
  // Converts JSON into a string and adding line breaks to make it easier to read
  rawJson = JSON.stringify(rawJson).replace(/,/g, ", \n");
  // Manipulates responseField to show the returned JSON.
  responseField.innerHTML = `<pre>${rawJson}</pre>`;
}
