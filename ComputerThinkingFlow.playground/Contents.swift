//: Playground - noun: a place where people can play


import UIKit

//ComputerThinkingFlow

var num1 = 1
var num2 = 2
num1 + num2

func addNumbers() {
    num1 + num2
    
}

addNumbers()

class Math {
    var num1: Int = 0
    var num2: Int = 0
    
    func addNumbers() -> Int {
        return num1 + num2
        
    }
    
    func subtractNumbers() -> Int {
        return num1 - num2
        
    }
}

class Human {
    var math = Math()
    
    func setNumbers() {
        math.num1 = 5
        math.num2 = 7
        
        self.runMath()
        
    }
    
    func runMath() {
        self.doAddition()
        self.doSubtraction()
    }
    
    func doAddition() {
        let value = math.addNumbers()
        
    }
    
    func doSubtraction() {
        let value = math.subtractNumbers()
        
    }
    
}

let me = Human() // the human is initalized and the human properties are initialized. the math properties are also initalized because they are part of the human class

me.setNumbers()
me.math.num1
me.math.num2

let you = Human()
you.math.num1

//Colors and Unwrapping: The If/Let Statement

var color:String?
color = "Red"

print(color == nil)

if color != nil {
    print(color!)
}

if let c = color {
    print("the color is " + c)
    
}

let n1 = 4.0
let n2 = 5

// n1 + n2. this does not work because n1 is a double and n2 is an int

enum FavoriteColor:String {
    case Red
    case Blue
    case Yellow
    
}

class User {
    var name: String!
    var email: String!
    var password: String!
    var favoriteColor: FavoriteColor?
    
    
}



