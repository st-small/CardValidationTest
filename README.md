# CardValidator Framework Implemention
This is the second part of terms of reference. Full description referenece is: [Description](https://github.com/st-small/CardValidationTest/blob/master/SDK%20(iOS)_test_assignment.pdf)

## Short desciption
CardValidator allows to validate numbers of payments cards using three parts of validation:
1. Card length should be 12-19 digits
2. Card's number shouldn't start from zero
3. Card's number should pass Luhn algortihm

This application was created to check framework's possibilities and demonstrate it' functionality. It contains 70 payment card's number that was added to demonstrate random results. It is simple list you can find it here: [Cards list](https://github.com/st-small/CardValidationTest/blob/master/CardValidationTest/ViewControllers/cards.txt).

First screen greetings the user and invites him to start demonstrating. Second screen shows empty table view and allows add new payment card to test. User can do it by tap in add button in navigation bar. After user tapped, validation process starts and will add the result into table. Result will show number of the payment card, it's scheme (Visa, Mastercard etc.) and result of validation (valid or invalid). 

Card validator framework you can find here: [CardValidator](https://github.com/st-small/CardValidator)
