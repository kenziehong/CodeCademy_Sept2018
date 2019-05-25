https://nodejs.org/api/assert.html#assert_assert_deepequal_actual_expected_message
https://nodejs.org/api/assert.html


===============================
WRITE EXPRESSIVE TESTS
Introduction


A good test framework is fast, complete, reliable, isolated, maintainable, and expressive. In this lesson you will learn how to use Node’s assert library to write more expressive tests.

An expressive test is easy to read and descriptive, making it useful as a form of documentation for your implementation code. One way to make a test more expressive is clarifying its verify phase — the step where expected outcome is compared to actual outcome.

Node.js provides a library called assert with methods that help you write more expressive verification code. You can use the methods in this library in place of conditional statements to write less code and use human-readable language. It can be used within the Mocha testing framework, and you will be using both throughout this lesson.

Instructions
1.
An assertion has been provided within a Mocha describe - it block. Run the Mocha test suite by typing npm test in the terminal and hitting Enter.

Review the output and move on to the next exercise.

====================================

WRITE EXPRESSIVE TESTS
assert.ok


As a Node module, assert can be imported at the top of your files with

const assert = require('assert');
The functions in the assert library compare values and throw errors as needed using one function call. The small, human-readable format of the functions will help you make a more expressive test suite.

assert.ok(6 - 1 === 5);
In this case 6 - 1 === 5 evaluates to true, so no error is thrown.

If an argument passed to assert.ok() evaluates to false, an AssertionError is thrown. The error communicates to Mocha that a test has failed, and Mocha logs the error message to the console.

Instructions
1.
At the top of index_test.js, import assert with the require function.

2.
Within the provided it block, enter the following expression:

assert.ok(result === 91);
3.
Run the test suite.

4.
The argument passed to assert.ok() throws an error! You should see some descriptive feedback in the terminal.

Make the expression evaluate to true by replacing 91 with expected.

5.
Run the suite again. Your test should pass now!

=================================================
WRITE EXPRESSIVE TESTS
assert.equal


You can use assert.ok() for most verifications, but sometimes it can be difficult to determine the condition you are evaluating.

Read the example code below. Will this assertion throw an error?

const landAnimals = ['giraffe', 'squirrel'];
const waterAnimals = ['shark', 'stingray'];

landAnimals.push('frog');
waterAnimals.push('frog');

assert.ok(landAnimals[2] == waterAnimals[2]);
The above assertion is checking for equality. In order to understand this you must evaluate the entire expression within the parentheses of .ok().

You can instead use assert.equal() which does the == comparison for us.

In the example below, the two methods achieve the same outcome.

assert.ok(landAnimals[2] == waterAnimals[2]);
assert.equal(landAnimals[2], waterAnimals[2]);
The second line is more expressive: instead of parsing the entire statement, a reader only needs to read the first two words to know the test is verifying equality!

Instructions
1.
Replace the call to assert.ok() with the equivalent call to assert.equal().

Though your test will work regardless of the order you pass the actual and expected results, it is common practice to pass actual first and expected second.

2.
Run the test suite.

=====================================
WRITE EXPRESSIVE TESTS
assert.strictEqual


Take a look at the code below. Will these assertions throw errors?

const a = 3;
const b = '3';
assert.ok(a == b);
assert.ok(a === b);
The first assertion will not throw an error because it uses loose (==) equality. It performs a type conversion when comparing two things.
The second will throw an error because it uses strict (===) equality. It returns false if the types differ.
If you need to be strict in evaluating equality, you can use assert.strictEqual().

assert.equal() performs a == comparison
assert.strictEqual() performs a === comparison
Compare the following code to the previous example. This code performs the same verifications, but it is more expressive. Without parsing any logic, a reader would know the intention of your tests by reading the method names.

const a = 3;
const b = '3';
assert.equal(a, b);
assert.strictEqual(a, b);
Instructions
1.
Set expected to the string '96' and run the test suite. The test still passes!

2.
Replace assert.equal() with assert.strictEqual()

3.
Run the test suite in the command line. The test fails!

4.
Reset expected to 96 so that assert.strictEqual() does not return an error.

5.
Run the test suite.

==========================================
WRITE EXPRESSIVE TESTS
assert.deepEqual I


Do you think these assertions will throw errors?

const a = {relation: 'twin', age: '17'};
const b = {relation: 'twin', age: '17'};
assert.equal(a, b);
assert.strictEqual(a, b);
Both assertions will throw an error because distinct objects are not considered equal when using either loose or strict equality in JavaScript.

If you need to compare the values within two objects, you can use assert.deepEqual(). This method compares the values of each object using loose (==) equality.

The following code will not throw an error…

assert.deepEqual(a, b);
…and you can confirm by manually comparing the relation and age properties of each object.

a.relation == b.relation;
a.age == b.age;
Instructions
1.
Run the test suite. You should see an error thrown.

2.
Replace assert.equal() with assert.deepEqual().

3.
Run the test suite again.

=============================================

WRITE EXPRESSIVE TESTS
assert.deepEqual II

In the last exercise you used deepEqual() to compare the values of two objects with loose equality. Arrays are also objects, so deepEqual() also compares their values with loose equality.

const arr1 = [1, 2, 3];
const arr2 = [1, 2, 3];
const arr3 = [1, 2, '3'];

assert.deepEqual(arr1, arr2); // No error
assert.deepEqual(arr1, arr3); // No error
If you’d like to learn more about deepEqual(), the documentation is available here.

Instructions
1.
Run the test suite. You should see an error thrown.

2.
Replace assert.equal() with assert.deepEqual().

3.
Run the test suite again.

==================================
WRITE EXPRESSIVE TESTS
Other assert methods

Node’s assert library includes more than the four methods covered so far. You can find them all in the Node.js documentation.

Many of the methods can be implemented using other methods, like using assert.ok(1 == 1) to implement assert.equal(1,1). Although this can be used for many types of tests, more descriptive functions like assert.equal, assert.strictEqual, and assert.deepEqual allow us to be more expressive: the expected functionality of the implementation code is clear to anyone reading your tests.

Instructions
1.
Using the link above, go to the assert documentation and find a more expressive way to implement assert.ok(1 !== 2).

====================================
WRITE EXPRESSIVE TESTS
Review


You can now write tests with Node’s assert library! In this lesson you learned to:

Check for loose (==) equality with assert.equal()
Check for strict (===) equality with assert.strictEqual()
Check the equality of two object’s values with assert.deepEqual()
Make your tests expressive by using different assert methods found in the Node.js documentation.
As you continue to write tests, remember to always evaluate them against the characteristics of a good test: fast, complete, reliable, isolated, maintainable, and expressive. If you are meeting these six criteria, you are creating high quality test frameworks!
