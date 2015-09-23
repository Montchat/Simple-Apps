//User Class

import UIKit

enum FavoriteColor:String {
    case Red
    case Blue
    case Yellow
    
}

class User {
    var name: String!
    var password: String!
    var email: String!
    var favoriteColor:FavoriteColor?
    
    var loginStatus = false
    
    func sayHelloTo(name:String) -> String {
        return "Hello, \(name)"
        
    }
    
    func register(name name:String, password: String, email:String, favoriteColor: FavoriteColor?) {
        self.name = name
        self.password = password
        self.email = email
        self.favoriteColor = favoriteColor
        
    }
    
    func login(name name: String, password:String) {
        if self.name == name && self.password == password {
            loginStatus = true
        } else {
            loginStatus = false
            
        }
        
    }
    
    func logout() {
        loginStatus = false
    }
    
}

//Testing the code. Joe logs in to say hi to Jo and then logs out.
let joe = User()
joe.register(name: "bananabanana", password: "donkeykong", email: "DonkeyKongFan22@donkeykong.com", favoriteColor: .Yellow)
joe.loginStatus
joe.login(name: "bananabanana", password: "donkeykong")
joe.loginStatus
joe.sayHelloTo("Jo")
joe.logout()
joe.loginStatus