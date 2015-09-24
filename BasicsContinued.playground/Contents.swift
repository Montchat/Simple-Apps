//: Playground - noun: a place where people can play

import UIKit

// Struct: These two are pointing to different places in memory

var name = "Jo"
unsafeAddressOf(name)

var name2 = name
unsafeAddressOf(name2)
name2.appendContentsOf("e")

name
name2

//Class: These two are pointing to the same space in memory

var name3: NSMutableString = "Jo" //This is mutable. You can change it.
unsafeAddressOf(name3)

var name4 = name3
unsafeAddressOf(name4)
name4.appendString("e")

name3
name4

//name3 and name4 dont equal the value. they are a reference to the value

//Structs are wonderful for small ammounts of information.
//You will see a class paired with structs as properties

name3 = "Jo2"
name4

