# Spotify_TTPQuestions

### Question 1:

```swift

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
class CodePathTester: XCTestCase {
    
    static public func sortByStringsTest(s: String , t: String, expectedOutput: String) {
        //Arrange
        let expected = (s: s, t: t, answer: expectedOutput)

        //action
        let result = sortByStrings(s: expected.s, t: expected.t)

        //assert
        assert(expected.answer == result)
    }
  
}

CodePathTester.sortByStringsTest(s: "weather", t: "therapyw", expectedOutput: "theeraw")
CodePathTester.sortByStringsTest(s: "good", t: "odg", expectedOutput: "oodg")
```

### Question 2:

```swift
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
 ```

### Question 3:

 ```swift
 func changePossibilities(amount: Int, denominations: [Int], index: Int = 0) -> Int {
    //base case
    if amount < 0 { return 0 }
    if amount == 0  { return 1 }
    if index == denominations.count && amount > 0 { return 0 }
    //recurive call
   return changePossibilities(amount: amount - denominations[index], denominations: denominations, index: index) + changePossibilities(amount: amount, denominations: denominations, index: index + 1)
}

changePossibilities(amount: 4, denominations: [1,2,3]) //4

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
```
