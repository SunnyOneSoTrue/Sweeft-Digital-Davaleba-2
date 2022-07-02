import UIKit
import Foundation


//MARK: დავალება 1
    func isPalindrome(text: String) -> Bool {
        var reversed = "" //MARK: String(text.reversed()) // ეს ჩაშენებული ფუნქციის გამოყენებით
        let textArray = Array(text) // რათა წვდომა მქონდეს სტრინგის ინდივიდუალურ ჩარებთან ინდექსის გამოყენებით
        
        
        for index in stride(from: textArray.count-1, through: 0, by: -1) { // მოვუყვებით მასივს უკუღმა და თითოეულ
            reversed += String(textArray[index]) //                             ჩარს ვუმატებთ
        }
        
        if text == reversed { // საბოლოოდ ვადარებთ პალინდრომია თუ არა
            return true
        }
        else{
            return false
        }
    }
    
    //MARK: დავალება 2
    func minSplit(amount: Int) -> Int {
        var tanxa = amount
        var amountOfCoins = 0
        let coinValues = [50,20,10,5,1]
        
        for CoinValue in coinValues {
            if tanxa / CoinValue != 0 { //MARK: ეს ალგორითმი ზოგავს მინიჭებების ოპერაციების რაოდენობას
                amountOfCoins += tanxa / CoinValue
                tanxa = tanxa % CoinValue
            }
            else if (tanxa == 0){
                return amountOfCoins
            }
            
            
            if (tanxa == 0) { //MARK: ეს ალგორითმი კიდეც შედარების ოპერაციების რაოდენობას ზოგავს
                return amountOfCoins
            }
            else {
                amountOfCoins += tanxa / CoinValue
                tanxa = tanxa % CoinValue
            }
        }
        
        return -1
    }

//დავალება 3
    func notContains(array: [Int]) -> Int {
        var minimum = 1
        
        while(true){
            switch array.contains(minimum) {
            case true:
                minimum += 1
                continue
            default:
                return minimum
            }
        }
    }

//დავალება 4
    func isProperly(sequence: String) -> Bool {
        var lefterCount = 0
        var righterCount = 0
        
        for symbol in sequence {
            switch symbol {
            case "(":
                lefterCount += 1
            case ")":
                righterCount += 1
            default:
                continue
            }
            
            if righterCount>lefterCount{ //ნებისმიერ მომენტში თუ უფრო მეტი დახურვის სიმბოლოა ე.ი. არასწორია
                return false
            }
        }
        
        if lefterCount == righterCount {
            return true
        }
        else{
            return false
        }
    }

//MARK: დავალება 5
func countVariants(stairsCount: Int) -> Int {
    var minSteps = 0 // ფურცელზე ფორმულა გამოვიყვანე და  ასეთი ცვლადები ჩავსვი ;დ კოდად უფრო მარტივად ვაქცევ ასე
    var returnNumber = 0

    if stairsCount%2==0 {
        minSteps = stairsCount/2
    }
    else {
        minSteps = Int(Double(stairsCount/2) + 0.5)
    }

    switch stairsCount {
        case 0: return 0
        case 1: return 1
        case 2: return 2
        case 3: return 3
        case 4: return 5
        case 5: return 8

        default:
        for k in 0...minSteps {
            switch k {
            case 0:
                returnNumber += 1
            case 1:
                returnNumber += stairsCount-1
            case minSteps:
                if stairsCount%2==0{
                    returnNumber+=1
                }
                else{
                    returnNumber += Int(Double(stairsCount/2) + 0.5) + 1
                }
            default:
                returnNumber += getSum(stairsCount-k) //ყოველ ნაბიჯზე ერთი ელემენტიაკლდება
            }
        }
    }
    return returnNumber
}

    func getSum(_ number:Int)-> Int{
        var returnNumber = 0

        for i in 0...number {
            returnNumber += i
        }

        return returnNumber
    }

    print(countVariants(stairsCount: 10))



//MARK: დავალება 6
class MyDataStruct {
    var arrayList = Array<Int>()
    private var map: [Int: Int] = [:]
    
    init(array: Array<Int>) {
        self.arrayList = array
        
        for i in 0...arrayList.count - 1 {
            self.map[self.arrayList[i]] = i
        }
    }
    
    func removeItem(item: Int) {
        
        if (self.map[item] == nil) { return }
        let position = self.map[item]
        let lastIndex = self.arrayList.count - 1
        let itematlastindex = self.arrayList[lastIndex]
        self.arrayList[position!] = self.arrayList[lastIndex]
        self.arrayList[lastIndex] = item
        self.arrayList.removeLast()
        self.map.remove(at: map.index(forKey: item)!)
        self.map[itematlastindex] = position
        
    }
}


var arr = [1, 2, 3, 4, 5, 6, 7]
var obj = MyDataStruct(array: arr)

print("Task6")
print(obj.arrayList)
obj.removeItem(item: 6)
obj.removeItem(item: 3)
print(obj.arrayList)
