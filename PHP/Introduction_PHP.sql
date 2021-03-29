INTRODUCTION TO PHP
History of PHP


/*PHP was created in 1994 and is one of the foundational technologies of modern web development. Given all the new technologies used today, is there still a place for PHP?

PHP remains one of the widest used server-side technologies on the internet. It provides the underlying code for many popular content management systems (CMS) including WordPress, Drupal, and Joomla. A CMS allows users to create and update their own websites without having to write a lot of complex code themselves.

PHP also provides the underlying code for many e-commerce sites including WooCommerce and Magento. These e-commerce platforms offer a number of tools for selling products online. This way companies can focus on other aspects of their business without having to implement complex programming logic from scratch.

PHP contains built-in functionality for interacting with web data, Vanilla PHP, or PHP without any other tools, can be used on its own to create web application back-ends. But we don’t have to reinvent the wheel every time! Once we’re comfortable with the basics of the PHP language, we have our pick of powerful PHP frameworks to choose from! These frameworks provide scaffolding and solutions to common problems in back-end web development. Some popular PHP frameworks are Laravel, CakePHP, and Symfony.
*/
----------------------------------------------
INTRODUCTION TO PHP
How is PHP used in HTML?


/*PHP is often used to build dynamic web pages. A dynamic web page is one where each visitor to the website gets a customized page that can look different than how the site looks to another visitor. This is in contrast to static web pages which provide the same content to each visitor.

Static vs. Dynamic Web Sites Using PHP

In order to create this dynamic behavior, PHP was designed to work closely with HTML. PHP can be used directly in-line with an HTML document. When the web site is delivered from the back-end to the front-end, the PHP content is executed and added to the HTML to form one HTML document. The start of in-line PHP is denoted with <?php and the end is denoted with ?>.

As an example, consider the following code:

<p>This HTML will get delivered as is</p>
<?php echo "<p>But this code is interpreted by PHP and turned into HTML</p>";?>
In PHP, the echo keyword is used to output text. The text in this case is everything between the double quotes ("). An instruction written in PHP is called a statement. A semicolon (;) is required at the end of each statement in PHP.

So when the code above is executed, it outputs the text into the HTML file and the front-end will receive the following HTML document:

<p>This HTML will get delivered as is</p>
<p>But this code is interpreted by PHP and turned into HTML</p>
Instructions
We’ve included the example from the narrative here so that you can see it in action. When you are ready, continue to the next exercise.
*/
<h1>My First PHP Site</h1>
<p>This HTML will get delivered as is</p>
<?php echo "<p>But this code is interpreted by PHP and turned into HTML</p>";?>
<?php echo "<ul><li>You can use any HTML tags,</li><li>like this list.</li></ul>";?>
<footer>
  <p>And this code is back in plain HTML</p>
</footer>

------------------------------------------------------------
INTRODUCTION TO PHP
How is PHP Executed?


/*In the previous exercise, we explored how PHP can be sent from the back-end to the front-end where it is received as HTML to be displayed by a browser.

PHP is flexible and can also be executed from the terminal. We can use PHP as a general purpose programming language to write programs that give simple instructions to the computer without involving HTML or the web. When this is done, the output of the program is logged to the terminal. This is useful when testing functionality or for writing simple local programs.

When writing a PHP script file, we still need to denote that we are beginning our PHP code using <?php, but the closing tag is no longer required. It is typically left out by convention.

*/For example, if the following code were placed in index.php:

<?php
echo "Hello, World!";
When the code above is run, "Hello, World!" will be output to the terminal.

Generally, PHP ignores whitespace (tabs, spaces, new lines), so this code yields the same result as the previous example:

<?php
echo     "Hello, World!";
You may be surprised that this code also works:

<?php
Echo "Hello, World!";
Unlike many other languages, PHP is not always case-sensitive, so Echo is a valid statement in PHP. However, it’s best practice to use standard casing – in this case, echo.

Instructions
1.
We’ve included some sample code - can you change it so that I love PHP! is printed to the terminal instead of Hello, World!?

---------------------------------------------------------

INTRODUCTION TO PHP
PHP Comments


Sometimes, we want to include text in our files that we don’t want the computer to execute or display to the end user. We can do this with comments. Comments can be used to annotate our code to make it clearer to ourselves or others. They are also useful to prevent lines of code from being executed without deleting them.

In PHP, there are two main ways to add comments to our code. The first is single line comments. These are typically used for short explanations or points of clarification. Either # or // can be used to create a single line comment. Anything on the same line after these symbols is not executed by PHP.

For example:

// I will always remember this
echo "Hello world"; // My first PHP statement
or

# I will always remember this
echo "Hello, World!"; # My first PHP statement
The second type of comment is a multi-line comment. This is used for longer descriptions, a more detailed guide on how to properly use the section of code, or to prevent several lines of code from being executed. These comments are started with /* and ended with */.

For example:

/* "I've never thought of PHP as more 
than a simple tool to solve problems."
- Rasmus Lerdorf */
echo "Hello, World!";
Instructions
1.
This PHP code includes both single and multi line comments. Take a moment to predict what will show up in the terminal and what will not. When you’re ready run the code to see if you were right.

----------------------------------------------------------
INTRODUCTION TO PHP
Todo: Learn PHP


/*Before moving on, let’s take a quick look at a working PHP application.

We’re going to show you an example of PHP being used on the back-end to create a dynamic website sent to the browser. When the visitor to the website, in this case you, modifies the task list, a request is made for a new web page, the PHP code runs again in the back-end and delivers a new version of the site with updated HTML.

The todo list example is frequently used when demonstrating a web framework or technology. It provides a way to exhibit how the CRUD (Create, Read, Update, Delete) behaviors are implemented using a specific technology.

Within a todo app, the functionality is typically:

Add new items to the list (Create)
View the existing list (Read)
Change the completion status of each item (Update)
Remove items from the list (Delete)
Instructions
Try out the functionality of the todo app in the browser window. Don’t worry about understanding all of the code yet, this is just to give you an idea of how PHP works. As you learn more about PHP, come back to this example and think about how you could create a similar application.

Type something in the box and “Add” it to your task list. See how you can create a whole list of items?

Now mark some of them complete and delete some of them.

Continue to the next exercise when you are ready.*/

<?php
require 'vendor/autoload.php';
# This logic handles connecting to the database, where we store our todo status
$pdo = new \PDO("sqlite:" . "db/sqlite.db");

# This PHP logic handles user actions
# New TODO
if (isset($_POST['submit'])) 
{
  $description = $_POST['description'];
  $sth = $pdo->prepare("INSERT INTO todos (description) VALUES (:description)");
  $sth->bindValue(':description', $description, PDO::PARAM_STR);
  $sth->execute();
}
# Delete TODO
elseif (isset($_POST['delete']))
{ 
  $id = $_POST['id'];
  $sth = $pdo->prepare("delete from todos where id = :id");
  $sth->bindValue(':id', $id, PDO::PARAM_INT);
  $sth->execute();
}
# Update completion status
elseif (isset($_POST['complete']))
{
    $id = $_POST['id'];
    $sth = $pdo->prepare("UPDATE todos SET complete = 1 where id = :id");
    $sth->bindValue(':id', $id, PDO::PARAM_INT);
    $sth->execute();
}
# Here is the HTML:
?>
<!DOCTYPE HTML>
<html lang="en">
<head>
  <title>Todo List</title>
</head>

<body class="container">
  <h1>Todo List</h1>
  <form method="post" action="">
    <input type="text" name="description" value="">
    <input type="submit" name="submit" value="Add">
  </form>
  <h2>Current Todos</h2>
  <table class="table table-striped">
    <thead><th>Task</th><th></th><th></th></thead>
    <tbody>

<?php
  # Entering PHP mode, 
$sth = $pdo->prepare("SELECT * FROM todos ORDER BY id DESC");
$sth->execute();

foreach ($sth as $row) {
  # Exiting PHP Mode
    ?> 
<tr>
  <td>
      <!-- This is PHP shorthand for inserting dynamic text into HTML -->
      <?=htmlspecialchars($row['description'])?></td>
  <td>
    <?php # Here we are mixing HTML and PHP to get the desired document
if (!$row['complete']) {
        ?>
    <form method="POST">
      <button type="submit" name="complete">Complete</button>
      <input type="hidden" name="id" value="<?=$row['id']?>">
      <input type="hidden" name="complete" value="true">
    </form>
    <?php
} else {
        ?>
    Task Complete!
    <?php
}
    ?>
  </td>
  <td>
    <form method="POST">
      <button type="submit" name="delete">Delete</button>
      <input type="hidden" name="id" value="<?=$row['id']?>">
      <input type="hidden" name="delete" value="true">
    </form>
  </td>
</tr>
<?php
}
?>
    </tbody>
  </table>
</body>
</html>

--------------------------------------------------------------------
