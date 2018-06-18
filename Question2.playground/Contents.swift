import UIKit
import XCTest

/*
 decodeString(s): Given an encoded string, return its corresponding decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab" For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
 */

/*----- STEPS-----
 1. take in input and filter out all opening and closing brackets
 2. reverse the input then convert it to an array (for subscripting)
 3. iterate through the array of character (some are letters other numbers)
 4. if we can not cast the current character to a number we append that current
 character to encodedStr
 5. once we current character at i is a  number we cast it to an int and repeate the encoded string ktimes
 6. Once we are done iterating through the array ( where i is no long < reversedInput.count)
 we reverse the string to get desired output
 */

func decodeString(s: String)->String{
    var outputString = ""
    let inputWithoutBrackets = s.filter{$0 != "[" && $0 != "]"}
    let reversedInput = Array(inputWithoutBrackets.reversed())
    var encodedStr = ""
    
    for i in 0..<reversedInput.count {
        
        if let kTimes = Int(String(reversedInput[i])) {
            outputString = String.init(repeating: encodedStr, count: kTimes)
            encodedStr = outputString
            continue
        }
        
        encodedStr.append(reversedInput[i])
    }
    return String(outputString.reversed())
}

decodeString(s: "4[ab]") // returns "abababab"
decodeString(s: "2[b3[a]]") // returns "baaabaaa"

//class to test different inputs and outputs
class CodePathTester: XCTestCase {
    
    static public func decodeStringTest(s: String, expectedOutput: String) {
        //Arrange
        let expected = (s: s, answer: expectedOutput)
        
        //action
        let result = decodeString(s: expected.s)
        
        //assert
        assert(expected.answer == result)
    }
}

CodePathTester.decodeStringTest(s: "4[ab]", expectedOutput: "abababab")
CodePathTester.decodeStringTest(s: "2[b3[a]]", expectedOutput: "baaabaaa")
