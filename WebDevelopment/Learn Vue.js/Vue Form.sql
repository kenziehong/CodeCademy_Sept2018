https://www.codecademy.com/courses/introduction-to-javascript/lessons/requests-i/exercises/requests-intro-i
https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
https://vuejs.org/v2/api/#v-on
https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#Attributes
https://developer.mozilla.org/en-US/docs/Web/Events#Form_Events
https://codepen.io/pen/?&editable=true
https://jsfiddle.net/api/mdn/
https://developer.mozilla.org/vi/docs/Learn/HTML/Forms/Sending_and_retrieving_form_data
https://thimble.mozilla.org/en-US/user/hong-dinh/2387190
http://jsbin.com/?html,js,console,output
https://www.codecademy.com/courses/learn-html/lessons/html-forms/exercises/forms-intro

--------------------------------------------
VUE FORMS
Overview


Welcome to Vue Forms! In Vue Data, you learned how to store dynamic data and methods on Vue instances and then display that data using mustache templates. In this lesson, you will learn how to use HTML forms to modify this data.

The first half of the lesson will discuss how to bind the different types of HTML form fields to the data stored on your Vue instances. The second half will then cover how to clean, validate, and submit this data allowing you to create complete, interactive forms for your users.

With these goals in mind, let’s jump into this lesson!

Instructions
To the right, you’ll see the current state of our e-ticketing front-end app. We are storing all of our data on the Vue app, but the form fields don’t actually modify this data.

In this lesson, we will:

Bind all of the form fields to our Vue data
Implement the functionality to reset and submit our form and clean up our form data
Implement form validation to ensure users are using our form as expected
Take a moment to review the current code. Remind yourself of all of the data, watchers, and methods we are currently storing on our Vue app in app.js. Then take a look at index.html to see the form we will use to manipulate this Vue data. Once you’re done, click “Next” to start learning about Vue forms!
--------------------------------------------------------
VUE FORMS
Text, Textarea, and Select Bindings


In Vue Data, we learned that there are two main places to store dynamic data in Vue apps: data for known dynamic values and computed for dynamic values that are determined using other dynamic values.

In web development, it is very common to add forms to sites to allow users to modify these types of dynamic values. As a result, Vue has implemented a directive, called v-model, that automatically binds form fields to dynamic values on the Vue app. When a form field is bound to a value, whenever the value in that form field changes, the value on the Vue app will change to the same value as well. Similarly, if the data on the Vue app changes, the value in the form field will automatically change to reflect the new value to the user.

<input type="text" v-model="username" />
const app = new Vue({ 
  el: '#app',
  data: { username: 'Michael' } 
});
In this example, we bound an <input> field to a piece of Vue data called username, like so:

We added a piece of dynamic data to the Vue app called username
We used v-model on an <input> field to bind the <input> to the piece of data with the provided name: username.
Now, when this example site is loaded, the <input> will already be pre-filled with 'Michael', the starting value of username. Then, whenever the <input> is modified by the user, the username data value will automatically change to the value typed in by the user.

In this example, we bound the form field to a property on data. However, v-model also works with computed properties as well.

v-model works on all HTML form field elements. So, simple form fields such as <textarea> elements and <select> elements can be bound to data and computed properties in the exact same way: adding v-model="propertyName" to the opening tag of the elements.

We will cover slightly more complex form elements in the following exercises.

Instructions
1.
Let’s start binding our form fields to our Vue data!

Using v-model, bind the following text <input> fields to the specified Vue data:

Bind the “First Name” <input> to the firstName data property
Bind the “Last Name” <input> to the lastName data property
Bind the “Email” <input> to the email data property
Bind the “Signature” <input> to the fullName computed property
We’ve temporarily added a section, called the “Developer Pane”, to the top of the page that displays the current Vue data values of the fields we’re working on. Once you’ve finished setting up these <input> fields, try typing into each of them to see the value get updated in the developer pane.

Remember that modifying the “Signature” field will update fullName which will automatically update our firstName and lastName values due to the computed setter.

2.
Next, let’s bind our <textarea> field to our Vue data.

Bind the “Special Requests” <textarea> to the specialRequests data property.

Once you’re done, try typing into the “Special Requests” to see if the value in the developer pane is now updating as expected.

3.
Finally, let’s bind our <select> field to our Vue data.

Bind the “Ticket Quantity” <select> to the ticketQuantity data value.

Once you’re done, try selecting different “Ticket Quantity” options to see if the value in the developer pane is now updating as expected.

------------------------------------------------------------------
VUE FORMS
Radio Button Bindings


An interesting example of a slightly more complex form field is radio buttons. Radio buttons are a series of buttons where the user can only select one. When a different button is selected, the previously-selected button becomes unselected.

In HTML, each radio button is its own <input> field. However, they all correspond to the same piece of data in the Vue app. As a result, each <input> field will need its own v-model directive. However, the value of v-model for each <input> will be the same: the name of the property they all correspond to.

<legend>How was your experience?</legend>

<input type="radio" id="goodReview" value="good" v-model="experienceReview" />
<label for="goodReview">Good</label>

<input type="radio" id="neutralReview" value="neutral" v-model="experienceReview" />
<label for="neutralReview">Neutral</label>

<input type="radio" id="badReview" value="bad" v-model="experienceReview" />
<label for="badReview">Bad</label>
const app = new Vue({ 
  el: '#app', 
  data: { experienceReview: '' } 
});
In this example, we have three radio button <input> elements all bound to the same piece of data using v-model: experienceReview.

When one of the three buttons is selected, it’s value becomes the value of experienceReview. For example, if the “Good” radio button is selected, experienceReview will become the value of that <input>: "good".

Note: The <legend> and <label> elements and the id properties on the <input>s used in this example are used for site accessiblity. These are not Vue features and, thus, are outside the scope of this course. Please take our lesson on HTML Forms if you’d like more information on this topic.

Instructions
1.
Let’s bind our radio buttons to our Vue data!

Using v-model, bind both of the “Ticket Type” radio <input> fields to the ticketType data property.

As with the last exercise, we’ve added a developer pane for you to preview the current value of ticketType. Once you’ve finished hooking up the fields, try using the radio buttons to change the value of ticketType and see the change in the developer pane.

--------------------------------------------------------------------------------------
VUE FORMS
Array Checkbox Bindings


Another interesting form field example is checkboxes. Checkboxes are used in situations where users can select multiple options for a form field. Unlike radio buttons, previous selections won’t be unselected when new selections are added. Instead, users can select all of the relevant checkboxes they’d like.

As a result, the dynamic piece of data bound to these types of checkboxes must be an array. This array stores all of the values checked in the list of checkboxes.

<legend>Which of the following features would you like to see added?</legend>

<input type="checkbox" id="search-bar" value="search" v-model="requestedFeatures">
<label for="search-bar">Search Bar</label>

<input type="checkbox" id="ads" value="ads" v-model="requestedFeatures">
<label for="ads">Ads</label>

<input type="checkbox" id="new-content" value="content" v-model="requestedFeatures">
<label for="new-content">New Content</label>
const app = new Vue({ 
  el: '#app', 
  data: { requestedFeatures: [] } 
});
In this example, we have a set of checkbox fields where users can select all of the features they want to see added to the site. Each checkbox <input> field has the same v-model added to it: requestedFeatures. All of the values of the checked <input> elements will be added to the requestedFeatures array on data.

For example, if the “Search Bar” and “New Content” checkboxes were selected by the user, the value of requestedFeatures would be ['search', 'content'].

Instructions
1.
Let’s bind our referrals checkboxes to our Vue data!

Using v-model, bind all three of the checkbox <input> fields in the “How did you hear about this event?” section to the referrals data array.

As with the previous exercises, we’ve added a developer pane for you to preview the current value of referrals. Once you’ve finished hooking up the fields, try checking and unchecking the checkboxes and see the value of referrals change in the developer pane.

----------------------------------------------------------
VUE FORMS
Boolean Checkbox Bindings


You may not always use a list of checkboxes. Sometimes you may only need a single checkbox to indicate whether a user has or has not checked a single option. In this case, we need to change the type of Vue data bound to the checkbox.

As seen in the previous example, if you are using a list of checkboxes with values, they need to be bound to an array to store all of the checked values. A single checkbox, however, can be represented by a boolean value. If the checkbox is checked, the value is true — if the value is unchecked, the value is false.

<legend>Would you recommend this site to a friend?</legend>
<input type="checkbox" v-model="wouldRecommend" />
const app = new Vue({ 
  el: '#app',
  data: { wouldRecommend: false } 
});
In this example, we’ve add v-model to a single checkbox. If the user would recommend this site to their friends, they will check the box and the value of wouldRecommend will be set to true. If they uncheck the box or leave it unchecked, the value of wouldRecommend will be false.

Instructions
1.
We only have one more field left to bind to data! Let’s bind the purchase agreement checkbox to our Vue data.

Using v-model, bind the checkbox <input> in the “Purchase Agreement” section to the boolean purchaseAgreementSigned data property.

Check that your field is working as expected by checking the value in the developer pane.

------------------------------------------------------------------

VUE FORMS
Form Event Handlers


As you may have seen previously in your learning journey, every web app experience consists of a series of events and responses to those events. Everything that can happen in a web app, from a user clicking a button to a piece of information coming back from a database, is considered an event. As seen in MDN’s list of events, forms have two built-in events that we need to handle: submit events (when a submit button is pressed to submit the final form) and reset events (when a reset button is pressed to reset the form to its initial state).

As we saw briefly in Introduction to Vue, Vue uses the v-on directive to add event handlers. Event handlers will respond to the specified event by calling the specified method.

We can use the v-on directive on <form> elements to add form event handling functionality, like so:

<form v-on:reset="resetForm">
  ...
  <button type="reset">Reset</button>
</form>
const app = new Vue({ 
  el: '#app', 
  methods: { resetForm: function() { ... } }
});
In this example, we added a reset event handler to our form. We specify the type of event to respond to after a colon, :, and then specify the method to call as the value of the directive. When a user clicks the “Reset” button, a reset event will be triggered (because the type of the button is reset), the <form> event handler will see this event appear, and the resetForm method will be called in response.

Note: A common shorthand for event handlers involves replacing v-on: with @, like so:

<form @reset="resetForm">
  ...
</form>
Both syntaxes are acceptable and used in Vue applications.

Instructions
1.
Let’s add reset and submit event handlers to our form.

In Vue Instances, we created a method called resetFields that resets all of the Vue app’s data. We will use this for our reset event handler. Using either provided syntax, add a reset event handler that calls resetFields when a reset event is fired.

Once you’ve implemented your handler, try filling out some of the form fields and then clicking the “Reset” button. The page should no longer refresh when you click the button and instead, all of the fields will clear.

2.
Next, let’s add our submit event handler.

We’ve added a method to our Vue app called submitForm. This method presumably will process our Vue form data in some way — potentially adding it to a database. The logic of this method is universal to all JavaScript, not Vue, and thus is beyond the scope of this lesson. We suggest you take our lesson on JavaScript Requests if you want to learn more about how to implement this type of method. For the purposes of this lesson, we will leave the body of this method empty.

Add a submit event handler that calls submitForm in response to submit events.

Try testing your event handler out by filling out some of the form and then clicking the “Submit” button. Even though nothing should happen, the page refreshes! This is a bad user experience that we will learn how to fix in the next exercise.

----------------------------------------------------------------------
VUE FORMS
Form Event Modifiers


If you have prior front-end development experience, you might have some familiarity with common event-handling boilerplate. If not, don’t fret — Vue has you covered!

In order to ensure a great web experience, browsers set up default actions to perform in response to events. That way even if a web app doesn’t know how to handle an event, the browser will still respond to it. You saw this in the previous exercise when your app refreshed the page in response to a form submit event.

Event objects have built-in methods to modify this behavior, such as Event.preventDefault() (which stops the browser from performing its default event-handling behavior) and Event.stopPropagation() (which stops the event from continuing to be handled beyond the current handler).

Vue gives developers access to these methods in the form of modifiers. Modifiers are properties that can be added to directives to change their behavior. Vue includes modifiers for many common front-end operations, such as event handling.

<form v-on:submit.prevent="submitForm">
  ...
</form>
In this example, we added the prevent modifier to a form submit event handler directive. This will automatically call Event.preventDefault() whenever our event handler is triggered — in the case of form submit events, this will prevent the page from reloading.

Similarly, if we had used the stop modifier, it would call Event.stopPropagation(). You can find a list of available modifiers in the Vue documentation.

Instructions
1.
Let’s fix our form submit bug by adding a form modifier to stop the page from refreshing in response to submit events.

Add the .prevent modifier to our form submit event handler to prevent the browser from refreshing the page.

Now when you try submitting the page, your form submit event handler will still be called, but the page will no longer refresh. Try it out!

----------------------------------------------------------------
VUE FORMS
Input Modifiers


Modifiers are incredibly useful tools for quickly adding essential front-end logic to directives. Vue offers modifiers for many of their directives, including the main topic of this lesson: v-model. Yes, that’s right, we can use modifiers to make our form fields even more versatile.

Vue offers the following three modifiers for v-model:

.number — automatically converts the value in the form field to a number
.trim — removes whitespace from the beginning and ends of the form field value
.lazy — only updates data values when change events are triggered (often when a user moves away from the form field rather than after every keystroke)
You can find out more information about these modifiers in the Vue documentation.

Instructions
1.
Let’s use modifiers to clean up some of the data in our form.

First, let’s use the .trim modifier to remove any potential whitespace from our text fields. Add .trim to the following form fields:

The “First Name” <input> field
The “Last Name” <input> field
The “Email” <input> field
The “Special Requests” <textarea> field
2.
Next, let’s use the .number modifier to ensure all of our number fields are stored as the correct data type.

Add the .number modifier to the “Ticket Quantity” <select> field.

---------------------------------------------------------------
VUE FORMS
Form Validation


There is one last piece of functionality we must cover to round out your Vue form knowledge — validation.

Form validation is the process in which we ensure all required information has been provided by the user and provided in the proper format. We don’t want a user to forget an important piece of information, like their last name, and never be informed about it!

There are many ways to implement form validation in Vue — we will cover one of the more common methods.

This method makes heavy use of the disabled <button> property. In brief, if disabled is present (or set to true) on a <button> element, that <button> will not do anything when pressed. Whereas if disabled is not present (or set to false), the button will work as expected. You can find more information about the disabled property in the MDN <button> documentation.

<button type="submit" v-bind:disabled="!formIsValid">Submit</button>
const app = new Vue({ 
  el: '#app', 
  computed: { 
    formIsValid: function() { ... } 
  }
});
In this example:

We use the v-bind directive to set the value of the disabled property on a “Submit” button to the value of a computed property called formIsValid
formIsValid will contain some logic that checks the values stored on the Vue app and returns a boolean representing whether or not the form is valid
If the form is valid, formIsValid will return true and the disabled property will not be present on the “Submit” button, keeping the button enabled
If the form is not valid, formIsValid will return false and the button will be disabled
This solution may seem somewhat complex. It is important to note that this is not a technique we would expect you to come up with on your own at this stage in your learning journey. However, it is incredibly important to know how to implement form validation, so we wanted to introduce it to you at this stage. Take some time reviewing this code and memorizing it so that you can feel confident implementing validation as you build Vue forms in the future.

Instructions
1.
Let’s finish implementing the front-end logic for our form by adding validation! We will need to add a computed property that validates our Vue data and then use that method to conditionally disable the “Submit” button.

For validation, we will check that the “First Name”, “Last Name”, and “Email” fields have been filled in and that the purchase agreement has been signed.

In app.js, add a computed property called formIsValid that checks that all of our required fields are filled in. To do this, make the following function the value of formIsValid:

return this.firstName && this.lastName && this.email && this.purchaseAgreementSigned;
2.
Now let’s use the computed property to conditionally disable our “Submit” button.

Using v-bind, bind the value of disabled to the value of !formIsValid. This will make sure that the “Submit” button is disabled when the form is not valid.

Testing this might be a little hard since our “Submit” button does not do anything. We will make this disabled button clearer to our users in the Styling with Vue lesson. To test this functionality now, you should notice that when the enabled “Submit” button is clicked, an outline will be added to the “Submit” button by the browser. Whereas when the disabled “Submit” button is clicked, an outline will not be added by the browser as nothing has actually occurred.

Try clicking the “Submit” button when it is disabled to see nothing happen. Then try filling out all of the required fields, checking the “I Agree” button, and clicking the “Submit” button to see the enabled button in action.

----------------------------------------------------
VUE FORMS
Review


Congratulations, you now know how to bind HTML forms to Vue data and listen to events in Vue! Let’s review the major takeaways from this lesson:

Form fields can be bound to Vue data using the v-model directive — how v-model is used depends on the type of field it is being added to
Form event handlers can be added using v-on:submit and v-on:reset
Modifiers can be used to add functionality to directives — most importantly preventing page reload on form submission using v-on:submit.prevent and cleaning up form field values using .number and .trim
Form validation can be implemented by setting the value of the disabled attribute on a <button> to the value of a computed property using v-bind
Good job on tackling all of this material! You can now create a pretty significant front-end using Vue. You should be proud of how far you’ve come in such a short period of time. Good work!

