//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Shape {
    var sides: Int?
    
    
}


class Rectangle: Shape {
    override init() {
        super.init()
        sides = 4
        
    }
    
}

class Toilet {
    var color: UIColor = UIColor.lightGrayColor()
    
    class func createOrangeToilet() -> Toilet {
        //class is a collection of code that you can use to create things, but it is not an actual object
        //when you call this function, it creates a toilet that will be an orange color
        
        let toilet = Toilet()
        toilet.color = UIColor.orangeColor()
        
        return toilet
        
    }
    
    init() {
        // creates a default toilet (that will be a light gray color)
        
    }
    
    var clean: Bool = true
    
    func flushtoilet() {
        self.clean = true
        
    }
    
}

class Box {
    var color: UIColor?
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    func changeSize(size:CGSize) {
        height = size.height
        width = size.width
        
    }
    
}

var box1 = Box()
var box2 = Box()

box1.changeSize(CGSize(width: 10, height: 10))
box2.changeSize(CGSize(width: 20, height: 10))

// -------------------------------------------------------------------------------------

//Car Example

//***Creating Classes for Our Car
class Engine {
    var size: String?
    
}

class Seat {
    
}

class Wheel {
    var size: Int = 20
    var rimColor: UIColor = UIColor.darkGrayColor()
    
}

class SteeringWheel: Wheel {
    
}


//Four different ways to write an array
var array1 = Array<Seat>()
var array2: Array<Seat> = []
var array3 = [Seat]()
var array4: [Seat] = []


//The Car
class Car {
    var engine: Engine?
    var steeringWheel: SteeringWheel?
    var seats: [Seat] = []
    var wheels: [Wheel] = []
    
    init() {
        wheels = [Wheel(), Wheel(), Wheel(), Wheel()]
        seats = [Seat(), Seat()]
        //This car is initalized with four wheels and two seats. The size of the wheels is 20, and the rimColor is a dark gray color.
    }
    
}

var myCar: Car = Car()

myCar.wheels

