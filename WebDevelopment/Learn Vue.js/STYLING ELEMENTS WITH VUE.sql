
--------------------------------------------------------
STYLING ELEMENTS WITH VUE
Overview

Welcome to Styling Elements with Vue! The name of this course may be slightly misleading — the only way to style HTML elements is still CSS. However, now that we know how to create dynamic web pages, we need our CSS to dynamically change too. Luckily, Vue contains features for making this essential functionality easy to implement.

In the first half of this lesson, we will learn how to dynamically add inline styles to HTML elements based on the data in our Vue applications. Then, in the second half of the lesson, we will learn how to refactor this work to dynamically add classes instead.

This lesson is fairly short, but the information in it is essential for making professional front-end web apps. Enjoy!

Instructions
Over the course of this lesson, we will be finishing up our e-ticketing app by adding dynamic CSS styles.

We will dynamically style our app to make our “Submit” button look enabled when all required fields are filled in correctly and disabled when they are not. We will also focus on how to dynamically style our “Email” field to convey the different states a form field can enter.

By the end of the lesson, you will possess the skills to style all of the remaining form fields as well. However, incorporating all of this styling would be very repetitive and an unnecessary learning experience. We will discuss how future lessons will give you the skills to prevent this task from being repetitive.

Check out the app to the right to review the current state of the app. Then when you’re ready, click “Next” to continue. Good luck!

----------------------------------------
STYLING ELEMENTS WITH VUE
Inline Styles


We will start this lesson by demonstrating how to dynamically add inline styles to HTML elements in your Vue application.

As you might recall from early on in learning CSS, inline styles are CSS style rules added directly to HTML elements. You apply inline styles by using the style attribute on HTML elements, like so:

<h2 style="color:red">Breaking News</h2>
In the past, we have advocated against the use of inline styles, since they make CSS harder to debug and make HTML harder to read. However, front-end frameworks actually make inline styling a powerful tool due to their ability to contain CSS to small, reusable pieces of front-end code. We will use them extensively later on in your Vue journey.

Here is the syntax for adding dynamic inline styles using Vue:

<h2 v-bind:style="{ color: breakingNewsColor, 'font-size': breakingNewsFontSize }">Breaking News</h2>
const app = new Vue({ 
  data: { 
    breakingNewsColor: 'red',
    breakingNewsFontSize: '32px'
  }
});
In this example, we use the v-bind:style directive to set the value of two inline styles to two Vue app properties. The value of the v-bind:style directive is an object where the keys are CSS properties and the values are dynamic properties on the Vue app.

In this case, we set the color property on an <h2> element to the value of breakingNewsColor on the Vue app, 'red', and the font-size property to breakingNewsFontSize, '32px'.

Note in the example that if we want to set a value for a hyphenated CSS property, such as font-size, we need to put the property name in quotes in order to construct a valid JavaScript object.

This example only used values stored in data, however computed properties can be used for v-bind:style and all of the other directives covered in this lesson in the same way.

While dynamic inline styles are only used to make our HTML slightly more readable in this example, we will have more impressive uses for inline styling in the next exercise.

Instructions
1.
Let’s style our “Confirm Tickets” submit button so that it only looks clickable when all of the required fields have been filled in. To make the button look disabled, we will make the button gray and set the cursor to default (not a pointer) when a user hovers over it.

Start by adding a computed property called submitButtonColorto app.js with a value of the following function:

function() {
  if (this.formIsValid) {
    return '#4c7ef3';
  } else {
    return 'gray';
  }
}
This function will check the computed property formIsValid and will return the current blue color, #4c7ef3, if the form is valid or it will return gray if the form is not valid.

2.
Next let’s create the computed property that will determine which cursor to use. In app.js, add a computed property called submitButtonCursor with a value of the following function:

function() {
  if (this.formIsValid) {
    return 'pointer';
  } else {
    return 'default';
  }
}
This function will return a pointer if the form is valid and will keep the cursor as the default cursor if it is not.

3.
Now let’s use v-bind:style to style our button with these computed properties.

In index.html, add a v-bind:style directive to the “Confirm Tickets” submit button that will set the background-color value of the button to submitButtonColor and the cursor value of the button to submitButtonCursor.

Don’t forget that hyphenated CSS properties, like background-color, must be put in quotes when adding them to the style object.

Once you’ve finished running your code, test out the site to make sure it works as expected. At first, the “Confirm Tickets” button should be gray and your cursor should not change when you hover over the button. Then once you fill out the “First Name”, “Last Name”, and “Email” fields and check the “I Agree” checkbox, the button should turn blue and your cursor should change to a pointer when you hover over it.

---------------------------------------------------------------
STYLING ELEMENTS WITH VUE
Computed Style Objects


A common pattern for adding dynamic inline style objects is to add a dynamic Vue app property that generates the style object. For example, we could refactor the previous example as follows:

<h2 v-bind:style="breakingNewsStyles">Breaking News</h2>
const app = new Vue({ 
  data: { 
    breakingNewsStyles: { 
      color: 'red',
      'font-size': '32px'
    }
  }
});
In this example, we store the style object, breakingNewsStyles, as a Vue app property and then make that object the value of v-bind:style. Using this pattern, we can make style objects for specific, reusable use cases.

This pattern also allows us to consolidate similar style-computing logic to a single computed property instead of computing styles on a rule-by-rule basis. Instead of creating a computed property for every rule that we want to apply to an element if it passes a certain condition, we can instead create a single computed property that checks the condition and then returns an object with all of the relevant style rules.

Instructions
1.
In the previous exercise, we created two separate computed properties that were checking for the same condition. This is unnecessarily repetitive code. Let’s refactor our code to a single computed property that will return complete style objects for each situation — if the form is valid and if it is not.

We’ve already removed the work from the previous exercise for you so you don’t have to go through the process of finding and deleting your code.

In app.js, let’s start by adding a computed property called submitButtonStyles with a value of the following function:

function() {
  if (this.formIsValid) {
    return {
      'background-color': '#4c7ef3',
      cursor: 'pointer'
    }
  } else {
    return {
      'background-color': 'gray',
      cursor: 'default'
    }
  }
}
This function will check to see if the form is valid and will return the corresponding style objects from last exercise accordingly.

2.
Now let’s use our computed property to style our “Confirm Tickets” submit button.

In index.html, add a v-bind:style directive to the “Confirm Tickets” button that uses the object stored at submitButtonStyles to style the button.

After running your code, make sure that the submit works as expected — gray and no pointer at the start, and blue with a pointer once the required fields have been filled in and selected.

-----------------------------------------------------------------
STYLING ELEMENTS WITH VUE
Multiple Style Objects


Another powerful aspect of v-bind:style is that it can also take an array of style objects as a value.

const app = new Vue({ 
  data: {
    newsHeaderStyles: { 
      'font-weight': 'bold', 
      color: 'grey'
    },
    breakingNewsStyles: { 
      color: 'red'
    }
  }
});
<h2 v-bind:style="[newsHeaderStyles, breakingNewsStyles]">Breaking News</h2>
In this example, we’ve added another Vue app property, newsHeaderStyles. This is a style object that will presumably be used to style all news item headers. Then, using an array with v-bind:style, we add both of these style objects to our Breaking News element.

You may notice that both of these style objects contain a color value. When this happens, the style object added later in the array gets priority. So, Breaking News will be bold and red. The grey color rule will be overridden and not used.

Instructions
1.
There are three common states a form field often enters: untouched, touched, and invalid. Untouched represents the field when nothing has been typed into it. Touched represents the field with information filled in. Invalid represents the field when invalid information has been entered into the field. We will be styling all three of these states for our “Email” field.

We want the field to be lightly grayed out when it is untouched. Then we want the field to get darker once it has been touched. Additionally, we want the field to be red if an invalid email has been entered. For the sake of simplicity, we will just check to see if the email contains an @ symbol to determine if it is valid.

Let’s start by adding a computed property that returns style objects to represent whether the field is touched or untouched.

In app.js, add a computed property called touchedEmailStyles with a value of the following function:

function() {
  if (this.email) {
    return {
      'border-color': '#bdbcbc',
      'border-width': '2px'
    }
  } else {
    return {
      'border-color': '#e0e0e0',
      'border-width': '2px'
    }
  }
}
This function will return a style object with a light gray border color if the “Email” field hasn’t been typed in yet and will return a darker gray border color if it has been. We’ve also made the size of the border slightly larger with border-width in both to indicate this is a required field.

2.
Next, let’s add a computed property that will style the “Email” field if it has been filled in incorrectly. We’ve already added a separate computed property called emailIsValid that performs the email validation logic.

In app.js, add a computed property called invalidEmailStyles and make the value the following function:

function() {
  if (this.email && !this.emailIsValid) {
    return {
      'background-color': '#ffeded',
      'border-color': '#da5252'
    }
  }
}
This function will return a style object with a light red background and a dark red border if the “Email” field has been filled in with an invalid email value.

3.
Now let’s use our style objects to style the different states of the “Email” field.

In index.html, add a v-bind:style directive to the “Email” field that will style the field with both the touchedEmailStyles style object and the invalidEmailStyles style object.

Make sure to add touchedEmailStyles first so that the border color from invalidEmailStyles will override the border color from touchedEmailStyles if an invalid email is provided.

After you finish running your code, test out the field. The “Email” field should be slightly thicker than the rest of the fields. It should start with a light gray border, then the background color and the border should turn red when you type into it, and finally, the background should go back to white and the border should be a dark gray when you type an @ character into the field. Nice work!

--------------------------------------------------------
STYLING ELEMENTS WITH VUE
Classes


As we mentioned earlier, you will use inline styles more often later in your Vue journey when you learn how to use components.

Currently, our Vue apps all live in one file. Filling that file with lots of style rules is likely going to produce difficult to read code. In this case, it is best that we still use CSS classes to keep most of our style information in our CSS files.

Let’s check out how to dynamically add CSS classes instead of inline styles.

<span v-bind:class="{ unread: hasNotifications }">Notifications</span>
.unread {
  background-color: blue;
}
const app = new Vue({
  data: { notifications: [ ... ] },
  computed: {
    hasNotifications: function() {
      return notifications.length > 0;
    }
  }
}
In this example, we are using the v-bind:class directive to dynamically add a class called unread to a “Notifications” <span> element if the computed property hasNotifications returns true.

v-bind:class takes an object as its value — the keys of this object are class names and the values are Vue app properties that return a truthy or falsy value. If the value is truthy, the class will be added to the element — otherwise it will not be added.

In this example, if there are notifications in the notifications array, the unread class will be added to the “Notifications” element causing the element to be styled blue.

Similar to before with v-bind:style, you can also set the value of v-bind:class to a Vue app property that returns a class object instead of writing the object out in your HTML file.

Instructions
1.
Let’s now try implementing our dynamic styles with classes instead of inline styles to see the strengths and weaknesses of each technique.

We’ll start by implementing our “Confirm Tickets” button again. We’ve already removed the dynamic inline styles you previously incorporated from the code for you.

In style.css, copy the following code to add a CSS rule that will apply the enabled submit button styles we were using earlier to <button> elements with the active class:

button.active {
  cursor: pointer;
  background-color: #4c7ef3;
}
We will use this class to conditionally style the “Confirm Tickets” submit button when all of the required fields have been filled in correctly.

2.
Now, in index.html, use v-bind:class to conditionally add the active class to the “Confirm Tickets” button when formIsValid is true.

Once you’ve finished running your code, test that the “Confirm Tickets” button still styles as expected. It should start gray with no pointer and then turn blue with a pointer when all of the required fields have been filled out correctly.

---------------------------------------------------------------
STYLING ELEMENTS WITH VUE
Class Arrays


As was the case when we were applying style objects, sometimes we need to apply multiple class objects to a single element. To accommodate this, v-bind:class can take an array as its value.

This array can take class objects as its contents and will apply the classes to the element in the order of the class objects in the array. However, this array can also take one other type of element.

While class objects are good for conditionally adding classes to elements, sometimes we need to just add a class to an element regardless of conditions. When this is the case, you can add the class name to the array and it will always be applied to the element. These class names must be stored as properties on your Vue app.

Let’s clarify this with an example:

<span v-bind:class="[{ unread: hasNotifications }, menuItemClass]">Notifications</span>
const app = new Vue({
  data: { 
    notifications: [ ... ],
    menuItemClass: 'menu-item'
  },
  computed: {
    hasNotifications: function() {
      return notifications.length > 0;
    }
  }
}
.menu-item {
  font-size: 12px;
}

.unread {
  background-color: blue;
}
In this code, we have modified our previous example by changing the value of v-bind:class to be an array. We then added a Vue app property to the end of the array that will add the menu-item class to the element. The object at the beginning of the array will still conditionally add the unread class based on whether there are unread notifications. However, we now always add the class stored at menuItemClass, menu-item, to our “Notifications” element.

Using an array with v-bind:class is useful for adding non-conditional classes, like the menu-item class above, in addition to our conditional classes. We can also use this array to add multiple class objects like we did with our inline style objects earlier in the lesson.

Instructions
1.
Let’s try using a v-bind:class array to style the three states of our “Email” input field ( untouched, touched, and invalid) and style the field as a required field.

First, let’s add all of our necessary classes to our CSS file. In style.css, add the following CSS classes to style each state of our input fields:

input.required {
  border-width: 2px;
}

input.touched {
  border-color: #bdbcbc;
}

input.invalid {
  background-color: #ffeded;
  border-color: #da5252;
}
2.
Next, we’re going to add two properties to our Vue app. We want to always add the required class to our “Email” field regardless of the state it’s in. Therefore, we need a Vue app property that will store the class name to use with v-bind:class. However, this property will not require any other information to compute, so we can simply store it on data.

In app.js, add a data property to your Vue app called requiredFieldClass with a value of the string 'required' (the name of the class).

3.
Next, we will add a Vue app property that will return a class object that will determine whether or not to add the touched and invalid classes to our “Email” field.

In app.js, add a computed property called emailClasses with a value of the following function:

function() {
  return {
   touched: this.email.length !== 0,
   invalid: this.email && !this.emailIsValid
  };
}
This code will make the value of emailClasses a class object that will add the touched class if anything has been written in the “Email” field and will add the invalid class if an invalid email has been written in the “Email” field.

4.
Finally, let’s use v-bind:class to add the class values from these two properties to our “Email” field.

In index.html, use v-bind:class with an array to add the classes stored in the requiredFieldClass and emailClasses properties to the “Email” <input> field.

After you’ve finished running your code, check that the “Email” field still styles as you expect. It should start with a light gray border and a white background, then should have a red border and background when you type into it, and finally should have a darker gray border and a white background when you type an @ into the field. Additionally, the border on this field should be slightly thicker than other fields at all times.

---------------------------------------------------
STYLING ELEMENTS WITH VUE
Review


Congratulations on completing this lesson! In this lesson, we covered a number of different techniques for dynamically styling Vue elements.

We learned how to dynamically add inline styles using v-bind:style with a style object or an array of style objects. We then learned how to dynamically add classes using v-bind:class with a class object or an array of class objects and class name strings.

It may seem like any one of these techniques would be sufficient for dynamically styling a front-end app — and that’s true! As you continue learning about Vue, you will see advantages and use cases for each technique.

The important thing to take away at this stage in your learning journey is that you should aim to use the technique that keeps your code the most readable and leaves your app with the least repetitive code.

Instructions
As mentioned at the beginning of this lesson, you now possess the skills to style all of the remaining form fields in the app. However, doing this would require separate inline style or class logic for every single field, since you would need to check the value of each field individually when determining what state it is in. This would result in a ton of repetitive code!

For now, if you need to use dynamic styling in your work, this will work. However, later in your learning journey, you will learn how to use your current dynamic styling skills with components in order to re-use your styling logic without copy and pasting your code. This will make your code easier to read and more maintainable.

Congratulations on learning all of these new styling techniques! They may seem overwhelming right now, but after a little practice, you’ll gain the confidence to know what tools you have at your disposal and when to use them. Nice work!