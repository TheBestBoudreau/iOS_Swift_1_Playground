//: [Previous](@previous)
/*:
 ## Tuples
 Tuples are a type that can store multiple values into a group. You can also name each of the values if you choose to.
 */
// This is a tuple with a person's first name, last name and age.
var personTuple = ("Bob", "Smith", 23)

// We can access each value using their index
personTuple.0
personTuple.1
personTuple.2

// We can also consider naming each value for clarity
var namedPersonTuple = (firstName: "Jane", lastName: "Smith", age: 23)

// This way, we can also access the values using their name
namedPersonTuple.firstName
namedPersonTuple.lastName
namedPersonTuple.age

/*:
 - Experiment:
 Try creating your own tuple. Mix in different variable types and try mixing some parameters with names and some without. Does it still work?
 */
var myTuple =   ("Brian", "turnip", "beef", age : 24, anotherAge: 56)

/*:
 - Experiment:
 Try nesting tuples within one another. Create a tuple and add a tuple as one of its items.
 */
var anotherTuple = ("Mitch","Ray","Hello World")
var addTuple = ("Peterson", "Lamppost", anotherTuple)
/*:
 - Experiment:
 We took a look at tuple earlier during the 'Loops' section. Can you tell where it is being used? Experiment with the tuple names and even change up the interesting numbers to see what's possible.
 */

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
for (kind, numbers) in interestingNumbers {
    print("\(kind) \(numbers)")
}

/*:
 - Callout(Challenge):
 Create a function that takes three parameters, a name of type `String`, an age of type `Int`, and eligable of type `Bool`. The function returns a tuple of the name and age if eligable is true, otherwise, it will return `nil`.
 \
To test: call your new function with eligable true and false, and print the two values
 (Hint: Use optional return value and conditional unwrapping)
 */
func myFunction(name : String , age : Int, eligable : Bool) -> (String? , Int?) {
    if eligable == true {
        return (name , age)
    }

myFunction(name: "Kevin", age: 23, eligable: true)

/*:
 ## Enums
 Enums are related values defined by the user. An example to think of this are the months within a year. There are only 12 months and when you are programming, you'll need a way to represent this. We could potentially use a String for each month, but that could lead to spelling mistakes. So instead, we can define our own values that makes it obvious to you.
 
 - Note:
 Enums in Swift are *WAY* more powerful than in Objective-C. Enums in Swift can have methods and an assigned value that can be a string, a character, or a value of any integer or floating-point type.
 */

enum Months: Int{
    case January = 1
    case Feburary
    case March
    case April
    case May, June, July, August
    case September
    case October
    case December
    func abbreviatedStringForm() -> String {
        switch self {
        case .January:
            return "Jan"
        case .Feburary:
            return "Feb"
        case .March:
            return "Mar"
        case .April:
            return "Apr"
        case .May:
            return "May"
        case .June:
            return "June"
        case .July:
            return "July"
        case .August:
            return "Aug"
        case .September:
            return "Sept"
        case .October:
            return "Oct"
        case .December:
            return "Dec"
        }
    }
}

//: Now we can represents the months in our program with easy readiablity and minimal mistakes.
let januaryMonth = Months.January
let marchMonth = Months.March

/*:
 - Experiment:
 Try adding '.rawValue' to the end of `Months.Januray` and `Months.March` above. What value did you get? How are these values assigned to the months?
 \
Try removing the '= 1' from the Months enum. Now what is different?
 */
Months.January.rawValue
Months.March.rawValue

/*:
 - Experiment:
 Finish the rest of the months for our `Months` enum. Then take a look at `abbreviatedStringForm()` function. Complete this function so that it returns the abbreviated form of the desired month as a String. ie: calling `Months.January.abbreviatedStringForm()` returns "Jan".
 */
Months.January.abbreviatedStringForm()


/*:
 - Experiment:
 Write a function within the enum that compares two months and determines how many months are they apart. For example: Comparing January to March would return to me '2', because January and March are two months apart.
 */
    func calculateMonths ( month1 : Months.RawValue , month2 : Months.RawValue) -> Int{
      return month2 - month1
}

/*:
 - Callout(Challenge):
 Create enums for the game "Rock, Paper, Scissors". Create a function within the enum that compares two hand shapes and determines the winner. Then create a function that returns ✋ , ✌️, or 👊 given rock, paper, or scissors.
*/
    enum rockPaperScissors : String {
        case rock = "👊"
        case paper = "✋"
        case scissors = "✌️"
        
        
        func play (rps : rockPaperScissors) -> String{
            switch (self, rps){
            case (.rock , .scissors), (.paper , .rock) , (.scissors, .paper):
                return self.rawValue
            case (.rock , .paper) , (.paper , .scissors) , (.scissors, .rock):
                return self.rawValue
            default:
                return self.rawValue
            }
        }
        
}


//: [Next](@next)
