LEARN JAVASCRIPT: MODULES
Message Mixer
Message Mixer is a messaging service that allows you to perform an action on input text and display the output of that behavior to the console. For example, with the current functions defined in Message Mixer, you can:

count the characters in a message
capitalize the first character of words
reverse a message's words in place
reversing characters in place
replace the first occurrence of a string
replace all occurrences of a string
encode text by swapping certain characters for other characters
At present, Message Mixer runs as a program in a single file. This single file includes functions that define behavior as well as the output. Message Mixer knows that by extracting the functions into a module, logic can be reused in different parts of our application.

Let's help Message Maker turn the program into a module!

Mark the tasks as complete by checking them off
1.
In the code editor, you have a file messageMixer.js. Run the file to see the output of the program.

2.
Each of the six functions within messageMixer.js manipulates a string of text in some way, and the displayMessage() function outputs a manipulated message to the console.

Segment the text-transformation behavior that should be kept within the module messageMixer.js, and the output behavior that should exist within message.js.

Copy the displayMessage() function and the displayMessage() function call and paste it in message.js. Then delete the displayMessage() function from messageMixer.js.

We will come back to this function soon. Notice that if you run the file, you will see a ReferenceError.

3.
You can now turn the behavior of messageMixer.js into a module. In this file, create a variable MessageMixer and set it equal to an empty object to represent the module as an object.

4.
You've defined a MessageMixer object, but in order for you to attach behavior to it, you'll need to make sure that each function is accessible as a property of it.

One by one, for each function in messageMixer.js, modify the function so that it is a property on the object.

5.
In addition to to setting each function as a property on the MessageMixer object, notice that several functions depend on another function to be called.

The reverseAllWords() function, for instance, calls the reverseWord() in its function body. In order for this function to work, reverseWord() must be prepended by MessageMixer..

The encode() function works in a similar way, when it calls replaceAllOccurrences(). Both need to be prepended by the module name.

Refactor the reverseAllWords() and encode() functions so they use MessageMixer on function calls within the function.

6.
Your MessageMixer object now has properties. Export it using module.exports syntax.

7.
Import the module in message.js using the require() statement. You can use the variable MessageMixer again to represent the module.

When you run message.js, you will still get a ReferenceError.

8.
In order for message.js to display the output from the module, you'll need to call each of the functions in the displayMessage() function as properties of the imported MessageMixer object.

When you run the file, you should see the output of the functions.

9.
Continue by adding a few additional functions to the MessageMixer module.

In messageMixer.js, create a function on the MessageMixer object called palindrome() that takes a String str as a parameter.

The body of the function should use string concatenation or interpolation to return the string, a space, and the reverse of the string. You can use the reverseWord() function. You will need to call reverseWord() as a method of MessageMixer.

10.
Again, in messageMixer.js, create another function pigLatin() on the MessageMixer object that takes a sentence and a character as parameters.

The body of the function should return the sentence split at each of the spaces, and joined back together using the character argument concatenated with a ' '.

11.
In messageMixer.js, use modify the way you export MessageMixer to use export default instead of. module.exports.

12.
In message.js, use the import keyword to import the MessageMixer module. The file path will be './messageMixer'.

13.
In message.js, use console.log() to display the output of palindrome() and pigLatin() functions within the displayMessage() function. You will need to pass the functions a string.

You should see the output of the manipulated message.

14.
Message Mixer wants to test one final behavior for their program. They'd like to export each of the functions as a variable. Modify messageMixer.js so that each function is exported as a variable name.

Note that as you do this, you should also remove the MessageMixer object in front of each function, as well at any reference to MessageMixer in the body of the reverseAllWords(), encode(), and palindrome() functions.

15.
Using the export statement at the bottom of the file, export each of the function by their variable named between two {}

16.
In message.js, modify the program to import each of the variables.

17.
As a last and final step, modify each of the functions within each of the displayMessage() function so that they use only the variable name in the function call.

18.
Click here for a video walkthrough from our experts to help you check your work!
-------------------------------------------------------

function countCharacter(inputString, inputCharacter) {
  let count = 0;
  let string = inputString.toLowerCase();
  let character = inputCharacter.toLowerCase();
    for (let i = 0; i < string.length; i++) {
      if (string[i] === character) {
         count++;
      }
    }
  return count; 
};

function capitalizeFirstCharacterOfWords(string) {
  let arr = string.split(" ");  
    for (let i = 0; i < arr.length; i++) {  
      let word = arr[i];
        arr[i] = word[0].toUpperCase() + word.substring(1); 
    }
  return arr.join(" "); 
};


function reverseWord(word) {
  return word.split("").reverse().join("");
};

function reverseAllWords(sentence) {
  let words = sentence.split(" ");
    for (let i = 0; i < words.length; i++) {
      words[i] = reverseWord(words[i]);
    }
   return words.join(" ");
};


function replaceFirstOccurence(string, toBeReplaced, replaceWith) {
  return string.replace(toBeReplaced, replaceWith);
};


function replaceAllOccurrences(string, toBeReplaced, replaceWith) {
  return string.split(toBeReplaced).join(replaceWith);
};

function encode(string) {
  let replacementObject = { "a": "@", "s": "$", "i": "!", "o":"0" };
    for (let key in replacementObject) {
      string = replaceAllOccurrences(string, key, replacementObject[key]); 
    }	
    return string;
};


function displayMessage() {
  console.log(countCharacter("What is the color of the sky?", "t"));
  console.log(capitalizeFirstCharacterOfWords("What is the color of the sky?"));
  console.log(reverseWord("What is the color of the sky?"));
  console.log(reverseAllWords("What is the color of the sky?"));
  console.log(replaceFirstOccurence("What is the color of the sky?", "sky", "water"));
  console.log(encode("What is the color of the sky?"));
}

displayMessage();



--------------------------------------------------------------
//file messageMixer.js
//3. create a varibale MessageMixer and set it equal to an empty object to represent the module as an object
const MessageMixer = {};

//4. modify the function so that it is a property on the object
MessageMixer.countCharacter = function (inputString, inputCharacter) {
  let count = 0;
  let string = inputString.toLowerCase();
  let character = inputCharacter.toLowerCase();
    for (let i = 0; i < string.length; i++) {
      if (string[i] === character) {
         count++;
      }
    }
  return count; 
};

MessageMixer.capitalizeFirstCharacterOfWords= function (string) {
  let arr = string.split(" ");  
    for (let i = 0; i < arr.length; i++) {  
      let word = arr[i];
        arr[i] = word[0].toUpperCase() + word.substring(1); 
    }
  return arr.join(" "); 
};


MessageMixer.reverseWord = function (word) {
  return word.split("").reverse().join("");
};

MessageMixer.reverseAllWords = function (sentence) {
  let words = sentence.split(" ");
    for (let i = 0; i < words.length; i++) {
      words[i] = MessageMixer.reverseWord(words[i]);
    }
   return words.join(" ");
};


MessageMixer.replaceFirstOccurence = function (string, toBeReplaced, replaceWith) {
  return string.replace(toBeReplaced, replaceWith);
};


MessageMixer.replaceAllOccurrences = function (string, toBeReplaced, replaceWith) {
  return string.split(toBeReplaced).join(replaceWith);
};

MessageMixer.encode = function (string) {
  let replacementObject = { "a": "@", "s": "$", "i": "!", "o":"0" };
    for (let key in replacementObject) {
      string = MessageMixer.replaceAllOccurrences(string, key, replacementObject[key]); 
    } 
    return string;
};

//6. Your MessageMixer object now has properties. Export it using module.exports systax
module.exports = MessageMixer;

//9.create a function on the MessageMixer object called palindrome() that takes a String str as a parameter.The body of the function should use string concatenation or interpolation to return the string, a space, and the reverse of the string. You can use the reverseWord() function. You will need to call reverseWord() as a method of MessageMixer
MessageMixer.palindrome = function (str){
  return `${str} ${MessageMixer.reverseWord(str)}`;
}

//10.create another function pigLatin() on the MessageMixer object that takes a sentence and a character as parameters.The body of the function should return the sentence split at each of the spaces, and joined back together using the character argument concatenated with a ' '.
MessageMixer.pigLatin = function(sentence,character){
  return sentence.split(' ').join(character+ ' ');
}



-----------------------------------------------------------------
//file message.js

//7. import the module in message.js using the require() statement. You can use the variable MessageMixer again to represent the module
const Message = require('./messageMixer.js');
function displayMessage() {
  console.log(Message.countCharacter("What is the color of the sky?", "t"));
  console.log(Message.capitalizeFirstCharacterOfWords("What is the color of the sky?"));
  console.log(Message.reverseWord("What is the color of the sky?"));
  console.log(Message.reverseAllWords("What is the color of the sky?"));
  console.log(Message.replaceFirstOccurence("What is the color of the sky?", "sky", "water"));
  console.log(Message.encode("What is the color of the sky?"));
  
  //9,10 copy and paste
  console.log(Message.palindrome("What is the color of the sky?"));
  console.log(Message.pigLatin("What is the color of the sky?", "t"));
}

displayMessage();


--------------------------------------------------------------------

//11.In messageMixer.js, use modify the way you export MessageMixer to use export default instead of. module.exports.

MessageMixer.countCharacter = function (inputString, inputCharacter) {
  let count = 0;
  let string = inputString.toLowerCase();
  let character = inputCharacter.toLowerCase();
    for (let i = 0; i < string.length; i++) {
      if (string[i] === character) {
         count++;
      }
    }
  return count; 
};

MessageMixer.capitalizeFirstCharacterOfWords= function (string) {
  let arr = string.split(" ");  
    for (let i = 0; i < arr.length; i++) {  
      let word = arr[i];
        arr[i] = word[0].toUpperCase() + word.substring(1); 
    }
  return arr.join(" "); 
};


MessageMixer.reverseWord = function (word) {
  return word.split("").reverse().join("");
};

MessageMixer.reverseAllWords = function (sentence) {
  let words = sentence.split(" ");
    for (let i = 0; i < words.length; i++) {
      words[i] = MessageMixer.reverseWord(words[i]);
    }
   return words.join(" ");
};


MessageMixer.replaceFirstOccurence = function (string, toBeReplaced, replaceWith) {
  return string.replace(toBeReplaced, replaceWith);
};


MessageMixer.replaceAllOccurrences = function (string, toBeReplaced, replaceWith) {
  return string.split(toBeReplaced).join(replaceWith);
};

MessageMixer.encode = function (string) {
  let replacementObject = { "a": "@", "s": "$", "i": "!", "o":"0" };
    for (let key in replacementObject) {
      string = MessageMixer.replaceAllOccurrences(string, key, replacementObject[key]); 
    } 
    return string;
};



//9.create a function on the MessageMixer object called palindrome() that takes a String str as a parameter.The body of the function should use string concatenation or interpolation to return the string, a space, and the reverse of the string. You can use the reverseWord() function. You will need to call reverseWord() as a method of MessageMixer
MessageMixer.palindrome = function (str){
  return `${str} ${MessageMixer.reverseWord(str)}`;
}

//10.create another function pigLatin() on the MessageMixer object that takes a sentence and a character as parameters.The body of the function should return the sentence split at each of the spaces, and joined back together using the character argument concatenated with a ' '.
MessageMixer.pigLatin = function(sentence,character){
  return sentence.split(' ').join(character+ ' ');
}

export default MessageMixer;



--------------------------------------------------------------------

//12.In message.js, use the import keyword to import the MessageMixer module. The file path will be './messageMixer'
import MessageMixer from './messageMixer';
function displayMessage() {
  console.log(MessageMixer.countCharacter("What is the color of the sky?", "t"));
  console.log(MessageMixer.capitalizeFirstCharacterOfWords("What is the color of the sky?"));
  console.log(MessageMixer.reverseWord("What is the color of the sky?"));
  console.log(MessageMixer.reverseAllWords("What is the color of the sky?"));
  console.log(MessageMixer.replaceFirstOccurence("What is the color of the sky?", "sky", "water"));
  console.log(MessageMixer.encode("What is the color of the sky?"));
  
  //9,10 copy and paste
  console.log(MessageMixer.palindrome("What is the color of the sky?"));
  console.log(MessageMixer.pigLatin("What is the color of the sky?", "t"));
}

displayMessage();


-------------------------------------------------------------------

//14.Message Mixer wants to test one final behavior for their program. They'd like to export each of the functions as a variable. Modify messageMixer.js so that each function is exported as a variable name. Note that as you do this, you should also remove the MessageMixer object in front of each function, as well at any reference to MessageMixer in the body of the reverseAllWords(), encode(), and palindrome() functions.

const countCharacter = function (inputString, inputCharacter) {
  let count = 0;
  let string = inputString.toLowerCase();
  let character = inputCharacter.toLowerCase();
    for (let i = 0; i < string.length; i++) {
      if (string[i] === character) {
         count++;
      }
    }
  return count; 
};

const capitalizeFirstCharacterOfWords= function (string) {
  let arr = string.split(" ");  
    for (let i = 0; i < arr.length; i++) {  
      let word = arr[i];
        arr[i] = word[0].toUpperCase() + word.substring(1); 
    }
  return arr.join(" "); 
};


const reverseWord = function (word) {
  return word.split("").reverse().join("");
};

const reverseAllWords = function (sentence) {
  let words = sentence.split(" ");
    for (let i = 0; i < words.length; i++) {
      words[i] = reverseWord(words[i]);
    }
   return words.join(" ");
};


const replaceFirstOccurence = function (string, toBeReplaced, replaceWith) {
  return string.replace(toBeReplaced, replaceWith);
};


const replaceAllOccurrences = function (string, toBeReplaced, replaceWith) {
  return string.split(toBeReplaced).join(replaceWith);
};

const encode = function (string) {
  let replacementObject = { "a": "@", "s": "$", "i": "!", "o":"0" };
    for (let key in replacementObject) {
      string = replaceAllOccurrences(string, key, replacementObject[key]); 
    } 
    return string;
};



//9.create a function on the MessageMixer object called palindrome() that takes a String str as a parameter.The body of the function should use string concatenation or interpolation to return the string, a space, and the reverse of the string. You can use the reverseWord() function. You will need to call reverseWord() as a method of MessageMixer
const palindrome = function (str){
  return `${str} ${reverseWord(str)}`;
}

//10.create another function pigLatin() on the MessageMixer object that takes a sentence and a character as parameters.The body of the function should return the sentence split at each of the spaces, and joined back together using the character argument concatenated with a ' '.
const pigLatin = function(sentence,character){
  return sentence.split(' ').join(character+ ' ');
}


//15.Using the export statement at the bottom of the file, export each of the function by their variable named between two {}
export {countCharacter,capitalizeFirstCharacterOfWords,reverseWord,reverseAllWords,replaceFirstOccurence,replaceAllOccurrences,encode,palindrome,pigLatin};


-------------------------------------------------------------------------


//16.In message.js, modify the program to import each of the variables.
import {countCharacter,capitalizeFirstCharacterOfWords,reverseWord,reverseAllWords,replaceFirstOccurence,replaceAllOccurrences,encode,palindrome,pigLatin} from './messageMixer';
function displayMessage() {
  console.log(countCharacter("What is the color of the sky?", "t"));
  console.log(capitalizeFirstCharacterOfWords("What is the color of the sky?"));
  console.log(reverseWord("What is the color of the sky?"));
  console.log(reverseAllWords("What is the color of the sky?"));
  console.log(replaceFirstOccurence("What is the color of the sky?", "sky", "water"));
  console.log(encode("What is the color of the sky?"));
  
  //9,10 copy and paste
  console.log(palindrome("What is the color of the sky?"));
  console.log(pigLatin("What is the color of the sky?", "t"));
}

displayMessage();