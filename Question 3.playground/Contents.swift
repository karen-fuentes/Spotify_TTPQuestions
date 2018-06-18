import UIKit
import XCTest

/*
 Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.
 Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.
 Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
 1¢, 1¢, 1¢, 1¢
 1¢, 1¢, 2¢
 1¢, 3¢
 2¢, 2¢
*/

func changePossibilities(amount: Int, denominations: [Int], index: Int = 0) -> Int {
    //base case
    if amount < 0 { return 0 }
    if amount == 0  { return 1 }
    if index == denominations.count && amount > 0 { return 0 }
    //recurive call
   return changePossibilities(amount: amount - denominations[index], denominations: denominations, index: index) + changePossibilities(amount: amount, denominations: denominations, index: index + 1)
}

class CodePathTester: XCTestCase {
    
    static public func changePossibiltiesTest(amount: Int, denomination: [Int], expected: Int) {
        //Arrange
        let expected = (amount: amount, denomination: denomination, answer: expected)
        
        //action
        let result = changePossibilities(amount: expected.amount, denominations: expected.denomination)
        
        //assert
        assert(expected.answer == result)
    }
}





