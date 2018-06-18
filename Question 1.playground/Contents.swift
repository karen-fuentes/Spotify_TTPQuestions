//: Playground - noun: a place where people can play

import UIKit
import XCTest

//Question One: sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

//function takes in word s of type string and word t of type string and outputs string

//1. we have two pointers one that keeps track of the  index of the characters in word s and the other to keep track of the index of the characters in word t

//2. If the current s character equals the current character at t then we append that character to output

//3. we increment the pointer s until we reach the count of the string s

//4. once we reach the end of the word s (sPointer == s.count) then we increment pointer t and reset the pointer s              (starting from the begining of string s again)

//5. we repeat until the t pointer is equal to the count of the string t (we reached the end of the word t)

func sortByStrings(s: String, t: String) -> String {
    var output = ""
    var sPointer = 0
    var tPointer = 0
    
    while tPointer < t.count{
        let currentSChar = s[s.index(s.startIndex, offsetBy: sPointer)]
        let currentTChar = t[t.index(t.startIndex, offsetBy: tPointer)]
        
        if currentSChar == currentTChar {
            
            output.append(currentSChar)
        }
        
        sPointer += 1
        
        if sPointer == s.count {
            tPointer += 1
            sPointer = 0
        }
    }
    
    return output
}

sortByStrings(s: "weather", t: "therapyw") //output = "theeraw"
sortByStrings(s: "good", t: "odg") // output = "oodg"

//class to test different inputs and outputs
class CodePathTester: XCTest {
    
    static public func sortByStringsTest(s: String , t: String, expectedOutput: String) {
        //Arrange
        let expected = (s: s, t: t, answer: expectedOutput)
        
        //action
        let result = sortByStrings(s: expected.s, t: expected.t)
        
        //assert
        XCTAssertEqual(result, expected.answer , "\(result) is equal \(expected)")
    }
}
CodePathTester.sortByStringsTest(s: "weather", t: "therapyw", expectedOutput: "theeraw")
CodePathTester.sortByStringsTest(s: "good", t: "odg", expectedOutput: "oodg")








