//
//  mySwift learning.swift
//  
//
//  Created by fucong on 16/3/5.
//
//

import Foundation

var account1 = ("State Bank Personal", 1000.29)
var account2 = ("State Bank Bussiness", 24933.78)

func desposit(amount : Double, account :(name : String, balance : Double))
    ->(String, Double){
        let newBalance : Double = account.balance + amount
        
        return (account.name, newBalance)
}

func withdraw(amount :Double, account : (name : String, balance : Double))
    -> (String, Double) {
        let newBalance : Double = account.balance - amount
        return (account.name, newBalance)
}

let modayTransaction = desposit
let fridayTransaction = withdraw

//需要声明入参事什么
let modayBalance = modayTransaction(400.0, account: account1)
let modayBalance1 = desposit(400, account: account1)
let fridayBalance = fridayTransaction(1000.0, account: account2)
let fridayBalance1 = withdraw(1000.0, account: account2)


func chooseTransaction(transaction: String) ->(Double, (String,Double))
    ->(String, Double){
        if transaction == "Deposit" {
            return desposit
        }
        return withdraw
}

let myTransaction = chooseTransaction("Deposit")

var myBalance = myTransaction(400, account1)
let myBalance1 = chooseTransaction("Deposit")(300, account1)
var thisBalace = chooseTransaction("withdraw")(10000, account2)




func bankVault(passcode : String) -> String {
    func openBankVaukt() -> String{
        return "Vault opened"
    }
    //不接受参数
    func closeBankVault() -> String{
        return "Vault close"
    }
    
    if passcode == "secret" {
        return openBankVaukt()
    }else {
        return closeBankVault()
    }
}

print(bankVault("wrongsecret"))
print(bankVault("secret"))


let bollVomCalculate = {
    (x : Double, pi : Double) -> Double in var thisX = pow(x, 3)
    var result = thisX * pi * 4 / 3
    return result
}

func doBollCalculate(x : Double, pi : Double, mycalculate : (Double, Double) ->Double) -> Double {
    
    let result = mycalculate(x, pi);
    return result
}

var bollResult = doBollCalculate(4, pi: 3.14159, mycalculate: bollVomCalculate)


class Door {
    
    var opened : Bool = false
    var locked : Bool = false
    
    var width : Int
    var height : Int
    var weight : Int
    var color : String
    
    init (width: Int = 32, height : Int = 72, weight : Int = 30, color : String = "Red"){
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open() -> String {
        if(opened == false) {
            opened = true
            return "C-r-r-e-e-a-k-k-k... the door is open!"
        }else {
            return "The door is already open!"
        }
    }
    
    func close() -> String {
        if(opened == true) {
            opened = false
            return "C-r-r-e-e-a-k-k-k... the door is closee!"
            
        }else{
            return "The door is already closed!"
        }
    }
    
    func lock() -> String {
        if(opened == false){
            locked = true
            return "C-l-i-c-c-c-k-k... the door is locked!"
        }else{
            return "You cannot lock an open door!"
        }
    }
    
    func unlock() -> String {
        if(opened == false){
            locked = false
            return "C-l-i-c-c-c-k-k.. the door is unlocked!"
        }else{
            return "You cannot unlock an opendoor"
        }
        
    }
}

let frontDoor = Door(width: 38, height: 89, weight: 88, color: "Green")
frontDoor.color = "White"
frontDoor.width = 29


/*******＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
 ＊ 2016-03－07
 ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊*/
class CombinationDoor: NiceDoor {
    var combinationCode : String?
    
    override func lock() -> String {
        return "This method is not valid for a combiantion door!"
    }
    
    override func unlock() -> String {
        return "This method is not valid for a combination door!"
    }
    
    func lock(combinationCode : String) -> String{
        if (opened == false) {
            if (locked == true) {
                return "The \(name) is already locked!"
            }
            self.combinationCode = combinationCode
            locked = true
            return "C-l-i-c-c-c-k-k.. the \(name) is locked!"
        }
        else{
            return "You cannot lock an open \(name)!"
        }
    }
    
    func unlock(combinationCode : String) -> String {
        if (opened == false) {
            if(locked == false){
                return "The \(name) is already unlocked!"
            }else{
                if (self.combinationCode != combinationCode) {
                    return "Wrong code.... the \(name) is still locked!"
                }
            }
            locked = false
            return "C-l-i-c-c-c-k-k.. the \(name) is unlock!"
        }else{
            return "You cannot unlock an open \(name)"
        }
    }
}

let securityDoor = CombinationDoor()

securityDoor.weight
securityDoor.width
securityDoor.height
print(securityDoor.color)

print(securityDoor.combinationCode)
securityDoor.unlock()

securityDoor.lock()

securityDoor.unlock("yuwei")
securityDoor.lock("yuwei")

securityDoor.unlock("yuwei")


class Tractor {
    let hoursePower : Int
    let color : String
    
    init(hoursePower : Int, color : String){
        self.color = color
        self.hoursePower = hoursePower
    }
    
    convenience init(hoursePower : Int){
        self.init(hoursePower : hoursePower, color: "Red")  //调用前面的初始化方法
    }
    
    convenience init(){
        self.init(hoursePower : 34, color: "Green")
    }
    
}

let myBigTractor = Tractor()

let mybiggrTractor = Tractor(hoursePower: 100)

let myBiggestTractor = Tractor(hoursePower: 120, color: "White")

enum Student {
    case PrimaryStudent
    case MiddleStudent
    case HighStudent
    case CollegeStudent
}

let studet : Student = .PrimaryStudent

var schoolName : String

switch studet{
case .PrimaryStudent :
    schoolName = "XinHua"
case .MiddleStudent :
    schoolName = "QinCai"
case .HighStudent:
    schoolName = "YiZhong"
case .CollegeStudent :
    schoolName = "HDU"
}
enum TransmissionType {
    case Manual4Gear
    case Manual5Gear
    case Automatic
}

struct Vehicle {
    var fuel : FuelType
    var transmission : TransmissionType
}

var dieselAutomatic = Vehicle(fuel: .Diesel, transmission: .Automatic)
var gasolineSpeed = Vehicle(fuel: .Gasoline, transmission: .Manual4Gear)


struct Structure {
    var copyVar : Int = 10
    
}

var struct1 = Structure()

var struct2 = struct1

struct2.copyVar = 30
print(struct1.copyVar)
print(struct2.copyVar)

class Class {
    var copyvar : Int = 10
}

var class1  = Class()

print(class1.copyvar)

var class2 = class1

class2.copyvar = 30
print(class1.copyvar)
print(class2.copyvar)


class exam: statusProtocal {
    func faile() -> String {
        return "Sorry,you fail the exam"
    }
    
    func success() -> String {
        return "Congradulation you pass the exam"
    }
}

var myExam = exam()
myExam.success()
myExam.faile()


protocol AreaProtocol {
    func computeArea() ->Double
}

protocol PerimeterProtocal {
    func computeperimeter() -> Double
}

struct Rectangle : AreaProtocol , PerimeterProtocal{
    var width, height : Double
    
    func computeArea() -> Double {
        return width * height
    }
    
    func computeperimeter() -> Double {
        return width * 2 + height * 2
    }
}

var squera = Rectangle(width: 2, height: 2.5)

squera.computeArea()
squera.computeperimeter()

/********************************************
 * congfu @ 2016-03-09
 *********************************************************/

protocol WaterFee {
    func waterFeeCalculate ()->Double
}

protocol OilFee {
    func oilFeeCalculate()->Double
}

protocol AllFees : WaterFee, OilFee {
    var waterPrice : Double { get set }
    var warterVolum : Double { get set}
    
    var oilPrice : Double { get set}
    var oilVolum : Double { get set}
}

struct allFees : AllFees {
    var waterPrice,warterVolum : Double
    var oilPrice, oilVolum: Double
    
    func waterFeeCalculate() -> Double {
        return waterPrice * warterVolum
    }
    
    func oilFeeCalculate() -> Double {
        return oilPrice * oilVolum
    }
}

let myFees = allFees(waterPrice: 2.5, warterVolum: 4, oilPrice: 5, oilVolum: 10)
myFees.waterFeeCalculate()
myFees.oilFeeCalculate()


protocol SalaryClaculate {
    var daySalary : Double { get set}
    func calculateSalary() -> Double
}

class CalculateSalary: SalaryClaculate {
    var daySalary: Double = 1.0
    func calculateSalary() -> Double {
        return daySalary * 30
    }
}

class DoCalculateSalary {
    var calculate : SalaryClaculate
    
    init(calculate : SalaryClaculate){
        self.calculate = calculate
    }
    
    func calculateWeekSalary() -> Double{
        return calculate.daySalary * 7
    }
    
    func monthSalary() -> Double{
        return calculate.calculateSalary()
    }
    
    func yearSalary() -> Double{
        return calculate.daySalary * 365
    }
}

extension DoCalculateSalary{
    
    func calculateTaxt() ->Double{
        return calculate.daySalary * 0.2
    }
}


var mySalary = DoCalculateSalary(calculate : CalculateSalary())
mySalary.calculateWeekSalary()
mySalary.monthSalary()
mySalary.yearSalary()



/***********************************************************************
 *  congfu @2016-03-10
 ************************************************************/

extension Double {
    var daySalary : Double {return self}
    
    var monthSalary : Double { return 30.0 * self}
    
    var yearSarlary : Double { return 365 * self}
    
    var monthTax : Double { return self * 30 * 0.2}
    
    var yearTax : Double {return self * 365 * 0.2}
    
}

var salary = 200.0.daySalary

var monthsalary = salary.monthSalary

var myYearSalry = salary.yearSarlary

var myMonthTax = salary.monthSalary

var myYearTax = salary.yearTax


extension String {
    func prependString(value : String) ->String{
        return value + self
    }
    
    func appendString(value : String) ->String{
        return self + value
    }
}

"X".appendString("Youself")
"X".prependString("Yourself")


/********************************************************************
 congfu @2016-03-13
 *****************************************************/


public struct PennyShaver{
    public static var stolenSoFar = 0.0
    public static var numberofPeopleStolenFrom = 0
    var amountToSteal = 0.01
    
    public func createPaymentCalculator(withOverTime : Bool) ->(Double, Double)->Double{
        
        func calculatePayrollFor(hourlyRate : Double, hours : Double) ->Double{
            let underoundPayrollAmount = hourlyRate * hours
            PennyShaver.stolenSoFar += amountToSteal
            PennyShaver.numberofPeopleStolenFrom = PennyShaver.numberofPeopleStolenFrom + 1
            
            return underoundPayrollAmount - amountToSteal
        }
        
        func calculatePayrollWithTime(hourlyRate : Double, hours : Double)->Double{
            let overTimeHours = hours - 40
            let overtimeRate = hours * 1.5
            
            var underoundPayrollAmount = hourlyRate  * 40
            let overTimePay = overTimeHours * overtimeRate
            underoundPayrollAmount += overTimePay
            
            PennyShaver.stolenSoFar += amountToSteal
            PennyShaver.numberofPeopleStolenFrom = PennyShaver.numberofPeopleStolenFrom + 1
            return underoundPayrollAmount - amountToSteal
            
        }
        
        if withOverTime{
            return calculatePayrollWithTime
        }else{
            return calculatePayrollFor
        }
        
    }
    
    
}


let pennyShaver = PennyShaver(amountToSteal: 0.19)

let overTimeCalcultor = pennyShaver.createPaymentCalculator(true)
let regtimeCalculator = pennyShaver.createPaymentCalculator(false)
let overTimePay = overTimeCalcultor(80.22, 43.33)


struct Student {
    let name ,sex: String
    let age : Int
    
    init(name : String, sex : String, age : Int){
        self.name = name
        self.age = age
        self.sex = sex
    }
    
}



let newStudent = Student.init(name: "Eric", sex: "male", age: 18)



struct Person {
    let name ,sex: String
    let age : Int
    
    init(_ name : String, _ sex : String, _ age : Int){
        self.name = name
        self.age = age
        self.sex = sex
    }
    
}

let  newPerson = Person.init("Frank", "female", 19)



public struct Create{
    
    func createCalculate(type : Int) ->(Double, Double) -> String{
        func areaCalculatorCreate(length : Double, width : Double) -> String{
            let area = 2 * length * width
            return "this area is \(area)"
        }
        
        func circleCalculate(length : Double, width :Double) ->String{
            let circle = 2 * (length + width)
            return "this circle is \(circle)"
        }
        func returnRemind(length :Double, width : Double) -> String{
            print("please chose type area or circle !")
            return "no functon"
        }
        
        switch type {
        case 1:
            return areaCalculatorCreate
        case 2 :
            return circleCalculate
        default:
            return returnRemind
        }
        
    }
    
}

var create = Create()
var areaCalculator = create.createCalculate(1)
var circleCalculator = create.createCalculate(2)
let area1 = areaCalculator(2, 2.7)

let circle  = circleCalculator(3,2.5)






