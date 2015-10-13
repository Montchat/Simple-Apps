//: Playground - noun: a place where people can play

import UIKit


//Normal - create a new playgorund
//step through chapters Basic Operations -> Control Flow
//everytime you see code in the book, add it to your playground and add a comment explaining what it is doing 
//Hard
//Step through chapters Functions -> Inheritance 
//Everytime you see code in the books, add it to your playground and add a comment explaining what it is doing
//Nightmare 
//Step through chapters "initialization" -> "nested types"
//Everyime you see code in the book, add it to your playground and add a coment explaining what it is doing 
//Blackhole
//
//step through chapters Extensions -> access control
//everytime you see code in the book, add it to your playground and add a comment explaining what it is doing

var string: String = "hello"

//Normal

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5 
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

//**what is is doing: it is looping through a value of five and printing the statement five times

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
//**what it is doing: it is passing through whatever power you put it to and multiplying the base by itself to that power

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
    
}
//**what it is doing: it is looping through the array of names

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
    
}

//ants have 6 legs
//cats have 4 legs
//spiders have 8 legs
//this for loop statement is iterating over a key-value tuple 

//For Loops

for var index = 0; index < 3; ++index {
    print("index is \(index)")
    
}
//**what it is doing: it is looping through code at an increment of three and printing "the index is index"

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue:0)
//creating a board where the final square must be 25

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    
    if square < board.count {
        square += board[square]
        
    }
    
}


//this code initalizes a square property that can be mutated (0). while the square is less than the final square, square amount will always be increased by the diceRool. if the player is moved beyond finalSqaure than the game is over. the diceroll cannot go over 26 either (as indicated by square < board.count) this way the dice can never roll a value that puts the player over score 25

//Repeat-While: The repeat-while loop, performs a single pass through the loop block first, before considering the loop's condition. It then continues to repeat the loop until the condition is false

let finalSquare2 = 25
var board2 = [Int](count: finalSquare + 1, repeatedValue: 0)
board2[02] = +09; board2[06] = +11; board2[09] = +09; board2[10] = +02; board2[14] = -10; board2[19] = -11; board2[22] = -02; board2[24] = -08
var square2 = 0
var diceRoll2 = 0
//these lines of code initalized the board (like the previous example). it also creates a scenario seen in snakes and ladders where certain keys in the dictionary have values that will move the player up or down the board

repeat {
//move up or down for a snake or ladder 
square += board2[square2]
//roll the dice 
if ++diceRoll2 == 7 { diceRoll2 = 1 }
square2 += diceRoll2

} while square2 < finalSquare2
print("game over!")

//these lines of code will move up the square by the sequence in the board, you will also continue to roll the dice while the square is less than the final square 

//Conditional Statements: Swift provides two ways to add conditional branches to your code, known as the if statement and the switch statement. Typically, you use the if statement to evaluate simple conditions with only a few possible outcomes. The switch statement is better suited to more complex conditions with multiple possbile permutations, and is useful in situations where pattern-matching can help select an appropriate code branch to execute --> taken from swift 2 maual.

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

//this will conditionally print "It's very cold. Consider wearing a scarf." if and only if the value of temperature is less than 32 degrees. Because our temperature is currently 30 (which is less than 32) it will print the statement. 

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
    
} else {
    print("It's not that cold. Wear a t-shirt.")
    
}
//This statement will print. It's not that cold. Wear a t-shirt because of the if-else statement.


temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
    
} else {
    print("It's not that cold. Wear a t-shirt.")
    
}

//This prints "It's really warm. Don't forget to wear sunscreen." Because of the else if part of the else if statement above

//Switch: A switch statement considers a value and copares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches succssfully. A switch statement provides an alternative to the if statment for responding to multiple potential states. 

//In its simplest form, a switch statement compares a value against one or more values of the same type


let someCharacter:Character = "e"
switch someCharacter {
    case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel.")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
print("\(someCharacter) is a consonant")
    
default:
    print("\(someCharacter) is not a vowel or a consonant")
    
}
//This will print "e is a vowel because of the switch statement above. The switch statement will match the character "e" with the statement above. I think it will actually stop executing code after the case statement if it detects a match

let anotherCharacter: Character = "a"
switch anotherCharacter {
//    case "a":
    case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//I commented out the above case "a" statement because it provides an error. The code above is demonstrating that you need to have an executable statement to match with a case . 

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings).")
//prints "There are dozens of moons orbiting Saturn.

//This is a case statement that is similar to the previous one. It executes the code at case 12..<100 because that is where the approximateCount value (62) lies. 

//Tuples

let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_,0):
    print("\(somePoint.0), 0 is on the x-axis")
case (0,_):
    print("(0, \(somePoint.1) is on the y-axis")
case(-2...2, -2...2):
print("\(somePoint.0), \(somePoint.1)) is inside the box")
default:
print("(\(somePoint.0), \(somePoint.1) is outside the box")
    
}

//The example above shows that you can even use a switch statement on tuples and that the switch statement still works. This could be a powerful tool in Swift because it seems like it would allow you to do complex stuff in simple statements like this one. The above switch statement uses the underscore character (otherwise known as the wildcard pattern)

//Value Bindings: A switch case can bind the value or values it matches to temporary constants or variables, for use in the body of the case. This is known as value binding, because the values are "bound" to temporary constants or variables within the case's body. 


let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axiss with a value f \(y)")
case let (x,y):
    print("somewhere else at \(x), \(y)")
    
}

//prints on the x-axis with an x value of 2"
// the reason the above statement is printed is because of the value bindings mentioned. it detects a 0, and prints out that the value at the y of 0 is 2. 

//Where

//A switch case can use a where clause to check for additional conditions 

let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
    
case let (x, y) where x == y:
    print("\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
    
}

//prints "(1, -1) is on the line x == -y"
// it prints this (1,-1) meets the second where condition

//Continue: The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop. It says "I am done with the current loop iteration" without leaving the loop altogether.

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
        case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
    
}

print(puzzleOutput)
//prints "grtmndsthnklk"
//this above statement is affected by the continue statement that tells the function to effectively, skip over vowels.

//Break: The break statement ends execution aof an entire control flow statemnt immediately. 

//Copied from manual because of weird symbols
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// prints "The integer value of 三 is 3."