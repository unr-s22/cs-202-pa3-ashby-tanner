= Programming Assignment 3, S2022
:author: Keith Lancaster, Ph.D.
:icons: font
:source-highlighter: highlight.js


== Overview
This is a group assignment for two students. The goal is to provide coding experience using overloaded operators and working in groups using Git.

== Research Requirements

* overloading relational operators (<,>,==, etc.)
* using a _friend_ function to override the output stream operator (<<)
* methods to sum vectors that hold classes that contain integer values
* building output text using `std::stringstream`


== Program Description

Currency is not held in floating point numbers in commercial programs because they are approximations of fractional values and subject to rounding and truncation errors. Instead, currency is usually handled in terms of the smallest value available. In the case of US dollars, this is cents.

You are to create a class called `Money` and a class called `Account`. The `Account` class will maintain a current balance, and have methods for making deposits and withdrawals. All transactions with the `Account` class must utilize the `Money` class.

.Money Class
This class must store the its value in an integer that holds cents. It must include

* a constructor that takes dollars and cents (in two different arguments, both integers)
* a default constructor
* overloads of all the relational operators (<,>,<=,>=,!=,==)
* overloads of the math operators + and -
* an overload of the stream operator << to allow values to be printed like this:

[source, cpp]
----
Money m(100,10);
std::cout << m << std::endl;

// this should print the following
$100.33
----

_The external interface of the class must not expose the underlying cents variable directly._


.Account Class
The account class have the following methods:

* a constructor that takes an instance of the `Money` class to provide an initial balance 
* `makeDeposit` and `makeWithdrawals`: these functions each have one argument, an instance of the `Money` class
** each deposit and withdrawal must be stored in a corresponding vector of type `std::vector<Money>`
** when a deposit or withdrawal is made, an internal boolean flag should be set indicating that the balance needs to be updated
** when any method requests the current balance, the balance should be recalculated _if_ the flag is true. Otherwise, the balance should just be returned. This approach allows the system to accept multiple deposits and withdrawals and only recalculate the balance when the balance is requested
* an overload of the << operator that prints the following, assuming that the `Account` instance `account` has had three deposits and one withdrawal:

[source, cpp]
----
std::cout << account << std::endl;

// this code should print
Account Details
--------------------------
Current Balance:$100.55
--------------------------
Number of Deposits: 3
--------------------
(1) $100.33
(2) $100.33
(3) $100.33
--------------------------
Number of Withdrawals: 1
--------------------------
(1) $200.44
----

[NOTE]
--
* Since the overload of << in the `Money` class includes a $ in the printout, you do not need one in the `Account` overload.
--




.Main

In your `main` function in `main.cpp`,

* Create an account with a starting balance of $300.23
* Print the account to the terminal using the overloaded << operator (i.e., `std::cout << account << std::endl`)
* Deposit into the account, in order, $200.00, $300.24, and $501.22
* Print the account to the terminal. (Verify that the sum is correct)
* Withdraw, in order, $300.10, $201.34 and again print the account to the terminal.
* Write code to verify that your relational operators are working correctly. This is up to you, however, you must have printouts to the console showing that the operations are correct.
** For example, you might write

[source, c++]
——
Money m(100,10);
Money n(100,10);
if(m > n){
     // print something
} else // etc.
——

== Working in a Group

* Both members must contribute to the assignment. You may divide the work in any way you wish. Contributions MUST be made from different Github accounts. You cannot say "We both worked on my computer".
* One person in the group will accept the assignment, and then add the other as a collaborator.
* You can choose to use a single branch, feature branches, or developer branches. These approaches will be explained in a video.
* One member of the group will turn in the Github URL when the assignment is complete.

[NOTE]
--
There MUST be contributions to Github from both group members. 
--

== Submitting the Assignment

When you are ready, type the following commands:
```
git add .
git commit -m “your commit message”
git push origin main
```
In WebCampus, put your Github username and the clone url (see above) in the text field for the submission and submit your assignment.

== Academic Honesty
Academic dishonesty is against university as well as the system community standards. Academic dishonesty includes, but is not limited to, the following:

* Plagiarism: defined as submitting the language, ideas, thoughts or work off another as one's own; or assisting in the act of plagiarism by allowing one's work to be used in this fashion.

* Cheating: defined as (1) obtaining or providing unauthorized information during an examination through verbal, visual or unauthorized use of books, notes, text and other materials; (2) obtaining or providing information concerning all or part of an examination prior to that examination; (3) taking an examination for another student, or arranging for another person to take an exam in one's place; (4) altering or changing test answers after submittal for grading, grades after grades have been awarded, or other academic records once these are official.

Cheating, plagiarism or otherwise obtaining grades under false pretenses constitute academic dishonesty according to the code of this university. Academic dishonesty will not be tolerated and penalties can include canceling a student’s enrollment without a grade, giving an F for the course, or for the assignment. For more details, see the University of Nevada, Reno General Catalog.
