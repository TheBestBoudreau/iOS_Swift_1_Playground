//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
    var numberOfSides: Int { get set }
    var shapeColor: String {get set}
    func shapeDescription()
    func calculateArea(firstMeasurement : Int , secondMeasurement : Int) -> Int
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
    var shapeColor: String
    
    var numberOfSides: Int
    
    init(){
        self.numberOfSides = 4
        self.shapeColor = "Red"
    }
    
    func shapeDescription() {
        
        print("This is a square")
    }
    
    func calculateArea(firstMeasurement: Int, secondMeasurement: Int) -> Int {
        return firstMeasurement * secondMeasurement
    }
}

/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */

/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */

/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */

/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */
protocol PersonProtocol {
    var studentName : String {get set}
    var studentGender : String {get set}
    var studentAge : Int {get set}
    
    init(name : String , gender : String , age : Int)
    
    func whoDis()
}

class Student : PersonProtocol{
    var studentGender: String
    var studentAge: Int
    var studentName: String
    required init(name: String, gender: String, age: Int) {
        self.studentName = name
        self.studentAge = age
        self.studentGender = gender
    }
    func whoDis() {
        print("Hello my name is \(studentName), i'm \(studentAge) years old and i'm a \(studentGender)")
    }
    
    
    
    
}



/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
    
    // This 'square' function takes its own value and multiples it by itself, then returns the new value
    func square() -> Double {
        
        return self * self
    }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */
var myFloatValue = 2.0
var mySquareFloatValue = myFloatValue.square()
/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */
import UIKit
extension UIColor{
    
    public convenience init (hex : Int) {
        
        
        let components = (
            R:CGFloat ((hex >> 16) & 0xff) / 255,
            G:CGFloat ((hex >> 08) & 0xff) / 255,
            B:CGFloat ((hex >> 00) & 0xff) / 255
        )
        
        
        self.init(red : components.R, green: components.G, blue :components.B, alpha: 1)
    }
    
    
}
/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */
extension String{
    
    func trim() ->String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
}
/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */
extension String {
    func checkEmail(enterEmail: String ) ->Bool {
        let emailFormat = try! NSRegularExpression (pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return (emailFormat.firstMatch(in: self, options: [], range: NSRange (location:0 ,length: count)) != nil)
        
    }
}
/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */
extension Double{
    func convertSecondsToMinutes (seconds : Double) -> Double{
        return seconds / 60
    }
    func convertSecondsToHours (seconds : Double) -> Double {
        return seconds / 3600
    }
}
//: [Next](@next)
