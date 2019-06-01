VUE DATA
Getting Started with Vue

Welcome to Vue Data! In Introduction to Vue, we briefly covered some of the most exciting features of Vue. In this lesson, we will start by reviewing how to create Vue apps and display dynamic data. We will then explore the different types of data that Vue can store and display in far more depth.

The first step to beginning any Vue project is to import the Vue library. For simple projects, we do this by adding the following <script> tag to the <head> of the HTML file that will contain the Vue app:

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js" defer></script>
Instructions
1.
Over the next three Vue lessons, we will be building a purchase screen for an e-ticketing app. We have prepared all of the static HTML and CSS for you. You can see the current version of the site to the right. It will be up to you to write all of the Vue code to make the site work as expected.

During this lesson, we will add all of the necessary data and functionality to our Vue app. In the next lesson, Vue Forms, we will then go on to use this data to make our app work as expected. We will add some of the code from the next lesson at points throughout this lesson to let you preview how your data will ultimately work in the app. You will learn how to use all of the techniques to make this app work very soon.

Let’s start by adding Vue to our project. In index.html, import Vue using the <script> tag provided above.

-------------------------------------------------
VUE DATA
Vue App Instantiation


Now that we have the Vue library available to use, we need to create our Vue app. All Vue apps are instances of the Vue class provided by the imported Vue library. As with all classes, we must use the new keyword to make an instance of this class, like so:

const app = new Vue({});
As seen in this example, the only parameter the Vue constructor takes is an object, called the options object, that will contain all the information (options) the Vue app needs to function. We will cover many of the options you can add to this object in the following exercises.

Instructions
1.
In app.js, create a new Vue app using the code snippet provided above.

2.
Now let’s import app.js into the same HTML file where we imported the Vue library. In index.html, add the following <script> tag on the line after importing the Vue library:

<script src="./js/app.js" defer></script>

-------------------------------------------------
VUE DATA
Attaching Vue Instances


The first property you will usually need to add to your Vue app’s options object is el. The el property corresponds to the HTML element that should be turned into a Vue app. The value of this key is a string containing a CSS selector that targets a single element in your HTML file. As a result, it is a good idea to always use an ID for this selector.

<div id="app"></div>
const app = new Vue({ el: '#app' });
In this example, we added a <div> element with an ID of app to our HTML file that will surround all of the HTML of our Vue app.

We then added an el attribute to our Vue app’s options object with a value of '#app'. This will find the element with an ID of app in the HTML file and transform it into a Vue app.

Adding a <div> that surrounds the template code of a Vue app and then using that <div> as the value of el is common practice in setting up a Vue app.

Instructions
1.
In index.html, add an ID of app to the <div> element on line 13.

2.
In app.js, add an el property to the options object of our Vue app. The value of this property should target the HTML element with an ID of app.

------------------------------------------------
VUE DATA
Data


Now that our Vue app is hooked up to our HTML, we are ready to generate and display dynamic data. As discussed in Introduction to Vue, displaying and updating dynamic data for users is essential functionality for most front-ends.

Most values on the web can change at any moment, such as the number of likes on a post or the current set of posts to display. We call constantly-changing data values like this dynamic data. We need a place to store dynamic data values so that we can still use them in our HTML even when we don’t know what their values will be at any given moment. There are many different ways to do this in Vue.

The simplest way is the data property on the options object. The value of data is an object. Each key-value pair in this object corresponds to a piece of data to be displayed in the template. The key is the name of the data to use in the template and the value is the value to display when the template is rendered.

We then use mustache syntax to display this data in our HTML template.

const app = new Vue({
  el: '#app',
  data: {
    language: 'Spanish',
    hoursStudied: 274
  }
});
<div id="app">
  <p>You have been studying {{ language }} for {{ hoursStudied }} hours</p>
</div>
Looking at this example, we see that two pieces of dynamic data were added to data on our Vue instance: language and hoursStudied with values of 'Spanish' and 274 respectively. These values are then displayed in our template using mustache syntax, displaying the text You have been studying Spanish for 274 hours to our user. If these values are changed later on by our app, such as if the language is changed or the number of hours studied increases, our template will automatically display this new value for the user.

Instructions
1.
We’re going to need to add dynamic data to make our app work.

In app.js, add a data attribute to our options object with a value of an empty object, {}.

2.
Next, add the following data to the data object. Each of these pieces of data corresponds to a field in our ticketing app’s form.

A firstName attribute with a value of an empty string, ''
A lastName attribute with a value of an empty string, ''
An email attribute with a value of an empty string, ''
A ticketQuantity attribute with a value of 1
A ticketType attribute with a value of 'general'
A referrals attribute with a value of an empty array, []
A specialRequests attribute with a value of an empty string, ''
A purchaseAgreementSigned attribute with a value of false
The values we are setting here are the values these pieces of dynamic data will start with (before the user interacts with and changes them. As a result, some have default starting values (such as ticketType with 'general') and others start as empty strings since we can’t guess what a user may want to set them to.

3.
Finally, let’s replace a few hard-coded values in our template with our dynamic data.

Make the following modifications to line 81 of index.html:

Replace First with a mustache expression that will render firstName from data
Replace Last with a mustache expression that will render lastName
Replace Quantity with a mustache expression that will render ticketQuantity
Replace Type with a mustache expression that will render ticketType
Check out the browser to the right to see your template now use the data values to render the page. Try setting different values for firstName, lastName, ticketQuantity, and ticketType and rerunning your code to see the template update in the browser. We will make these values even more readable in the next exercise.
--------------------------------------------
VUE DATA
Computed Property Setters


Being able to generate computed properties based on data is super useful. But why limit ourselves by only allowing this data flow to only go one way?

Vue allows us to not only determine computed values based on data values but to also update the necessary data values if a computed value ever changes! This allows our users to potentially edit computed values in the front-end and have all of the corresponding data properties get changed in response so that the computed property will re-calculate to the user’s chosen value.

const app = new Vue({
  el: '#app',
  data: {
    hoursStudied: 274
  },
  computed: {
    languageLevel: {
      get: function() {
        if (this.hoursStudied < 100) {
          return 'Beginner';
        } else if (this.hoursStudied < 1000) {
          return 'Intermediate';
        } else {
          return 'Expert';
        }
      },
      set: function(newLanguageLevel) {
        if (newLanguageLevel === 'Beginner') {
          this.hoursStudied = 0;
        } else if (newLanguageLevel === 'Intermediate') {
          this.hoursStudied = 100;
        } else if (newLanguageLevel === 'Expert') {
          this.hoursStudied = 1000;
        }
      }
    }
  }
});
<div id=“app”>
  <p>You have studied for {{ hoursStudied }} hours. You have {{ languageLevel }}-level mastery.</p>
  <span>Change Level:</span>
  <select v-model="languageLevel">
    <option>Beginner</option>
    <option>Intermediate</option>
    <option>Expert</option>
  </select>
</div>
In this example:

We modified our computed languageLevel value to contain both a getter and a setter method. We did this by making the value of languageLevel an object with two keys, get and set, each with a value of a function.
The get function is the same function we used earlier, computing the value of languageLevel based on hoursStudied.
The set function updates other data whenever the value of languageLevel changes. set functions take one parameter, the new value of the computed value. This value can then be used to determine how other information in your app should be updated. In this case, whenever languageLevel changes, we set the value of hoursStudied to be the minimum number of hours needed to achieve that mastery level.
Finally, we added a <select> field to our template that allows users to change their mastery level. Don’t worry about this part of the logic yet, we will cover this information in Vue Forms.
Instructions
1.
When our “Ticket Box” app is finished, we will use fullName to sign the purchase agreement. However, we will make the signature field editable so users can edit firstName and lastName by editing fullName. Let’s add a setter function to fullName to make this possible.

First, we will need to modify our current fullName functionality to be an object to support both a getter and a setter.

Make the value of fullName in computed an object. Add a key called get to that object and make the value equal to the current fullName function.

We’ve included this function below in case you need it:

function() {
  if (this.firstName && this.lastName) {
    return this.firstName + ' ' + this.lastName;
  } else {
    return this.firstName || this.lastName;
  }
}
2.
Now we can add our setter.

Add a key called set to fullName‘s object. Make the value of this property the following function:

function(newFullName) {
  const names = newFullName.split(' ');

  if (names.length === 2) {
    this.firstName = names[0];
    this.lastName = names[1];
  }

  if (names.length <= 1) {
    this.firstName = names[0] || '';
    this.lastName = '';
  }
}
This method will take in new fullName values and set firstName and lastName based on the updated value.

We’ve temporarily hooked up the “First Name” (firstName), “Last Name” (lastName), and “Signature” (fullName) fields in the site (you’ll learn how to do this in Vue Forms). Try filling out the “First Name” and “Last Name” fields and then modifying the “Signature” field to see firstName and lastName automatically get updated.

---------------------------------------------------
VUE DATA
Watchers


So far we’ve learned that data is used to store known dynamic data and computed is used to store dynamic data that is computed using other pieces of dynamic data. However, there is one caveat.

A computed value will only recompute when a dynamic value used inside of its getter function changes. For example, in our previous examples languageLevel would only be recomputed if hoursStudied changed. But what do we do if we want to make app updates without explicitly using a value in a computed function? We use the watch property.

const app = new Vue({
  el: '#app',
  data: {
    currentLanguage: 'Spanish',
    supportedLanguages: ['Spanish', 'Italian', 'Arabic'],
    hoursStudied: 274
  },
  watch: {
    currentLanguage: function (newCurrentLanguage, oldCurrentLanguage) {
      if (supportedLanguages.includes(newCurrentLanguage)) {
        this.hoursStudied = 0;
      } else {
        this.currentLanguage = oldCurrentLanguage;
      }
    }
  }
});
In this example, we want to set the number of hours studied to 0 whenever the user changes languages to a new supported language. If the language is not supported, it reverts the language back to the previously-selected language.

This functionality is not a computed value because we do not actually need to continually use this information to compute a new dynamic property: we just need to update existing properties whenever the change happens.

The value of watch is an object containing all of the properties to watch. The keys of this object are the names of the properties to watch for changes and the values are functions to run whenever the corresponding properties change. These functions take two parameters: the new value of that property and the previous value of that property.

Note: It may seem like you could use watch in many instances where you could use computed. The Vue team encourages developers to use computed in these situations as computed values update more efficiently than watched values.

Instructions
1.
Let’s add a watcher to our app. As we go on to build more complex apps, watch will become even more important. For this app, though, we are just going to do something a little fun. Whenever a user types "meet and greet" or "meet-and-greet" into the special requests field, we will automatically upgrade their tickets to VIP.

Add a watch property to the options object. For now, make the value an empty object, {}.

2.
Now, let’s watch specialRequests for changes.

Add a key to watch called specialRequests and make the value the following function:

function(newRequests, oldRequests) {
  if (newRequests.toLowerCase().includes('meet and greet') || newRequests.toLowerCase().includes('meet-and-greet')) {
    this.ticketType = 'vip';
  }
}
This function will check the updated special requests for mentions of “meet and greet” and change the ticket type to VIP if any exist.

We’ve temporarily tied the “Ticket Type” (ticketType) and “Special Requests” (specialRequests) fields on the site to the corresponding pieces of data in your Vue app (don’t worry, you’ll learn how to do this in Vue Forms). Try writing “meet and greet” into the “Special Requests” field to see ticketType automatically get updated.

---------------------------------------------------
VUE DATA
Instance Methods


Throughout this lesson, we have covered many options object properties that allow us to store and generate dynamic values to use in our template. But where do we store any methods we need to make our app work? As you might guess, there is an options object property called methods.

The methods property is where Vue apps store their instance methods. These methods can be used in many situations, such as helper functions used in other methods or event handlers (functions that are called in response to specific user interactions).

const app = new Vue({
  el: "#app",
  data: {
    hoursStudied: 300
  },
  methods: {
    resetProgress: function () {
      this.hoursStudied = 0;
    }
  }
});
<button v-on:click="resetProgress">Reset Progress</button>
In this example, we added an instance method called resetProgress to our Vue app using methods. This method sets the value of hoursStudied to 0.

We then added this method as an event handler to a <button> so that whenever the button is clicked, the method will be called. Don’t worry about the v-on:click code for this lesson — we will cover it in Vue Forms.

The value of methods is an object where the keys of the object are the names of the methods and the values are the corresponding instance methods.

Instructions
1.
We’re going to add an instance method that we will use in later lessons to finish building our app.

First, add the methods property to the Vue app’s options object and make the value an empty object, {}.

2.
Now we’re going to add a method will clear all of our dynamic data. This will be used for when a user clicks the “Reset” button at the bottom of the page.

Add a key of resetFields to your methods object and make the value the following function:

function() {
  this.firstName = '';
  this.lastName = '';
  this.email = '';
  this.ticketQuantity = 1;
  this.ticketType = 'general';
  this.referrals = [];
  this.specialRequests = '';
  this.purchaseAgreementSigned = false;
}
We’ve temporarily bound the form fields to their corresponding data properties and bound the resetFields method to the “Reset” button (you’ll learn how to do all this in Vue Forms). Try typing into a few of the form’s fields and then clicking the “Reset” button to see them all clear.

---------------------------------------------------

VUE DATA
Review

In this lesson, we learned four different techniques for displaying and updating dynamic data in our Vue apps. Here’s a brief recap of the Vue app options object properties we covered and the use cases for each.

data - used for storing known dynamic values
computed - used for computing dynamic values based on known dynamic values — can additionally specify a setter by specifying get and set functions — the setter will update other dynamic values when the computed value changes
watch - used for performing functionality when a specified dynamic value changes
methods - used for storing instance methods to be used throughout the app
If you want to learn more about each of these properties, check out the Options / Data section of the Vue.js documentation.

Congratulations on learning all of these new techniques! It may be overwhelming right now, but you will get more adept at determining which situations are best-suited to each technique as you spend more time building Vue apps. After taking Vue Forms and Styling Elements with Vue, you will have a full understanding of how these pieces of data are used to make fully-functioning Vue form apps. Good luck!

-----------------------------------