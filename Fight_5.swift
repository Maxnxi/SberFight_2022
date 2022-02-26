//
//  Fight_5.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

import Foundation

func getResult(_ subArray: [String], _ k: Int) -> Bool {
    if subArray.count == 1 {
        return true
    }
    if subArray.count > k {
        return false
    }
    if subArray.count == k {
        return true
    }
        
    var tempSetOfTypeLetters: Set<String> = []
    var dictOfCountOfLetters: [String: Int] = [:]
    subArray.forEach { str in
        tempSetOfTypeLetters.insert(str)
        if !dictOfCountOfLetters.keys.contains(str) {
            dictOfCountOfLetters[str] = 1
        } else {
            dictOfCountOfLetters[str]! += 1
        }
    }
    var totalCount: Int = 0
    var tempArray: [Int] = []
    for indexA in dictOfCountOfLetters {
        tempArray.append(indexA.value)
        totalCount = totalCount + indexA.value
    }
    tempArray = tempArray.sorted{$0>$1}
    print("Well done - tempArray is - ", tempArray)

    var tempCounter: Int = 0
    while tempCounter < k {
        tempCounter += 1
        var tempArrOfInt:[Int] = []
        
        for indexE in 0..<tempArray.count-1 {
            tempArrOfInt.append(tempArray[indexE] * tempCounter)
            print("tempArrOfInt.append - ", tempArrOfInt)
            if indexE >= 0 {
                print("<<<---->>>")
                print("indexE is - ", indexE)
                for indexY in 1..<k {
                    var temp:[Int] = []
                    temp.append(tempArray[indexE+1] * (tempCounter + indexY))
                    print("temp appended - ", temp )
                    if tempArray.count == 3 {
                        print("tempArray.count == 3 - ", tempArray.count)
                        for indexK in (indexY+1)..<k {
                            temp.append(tempArray[2] * (tempCounter + indexK))
                            print("temp appended - ", temp)
                            var total = tempArrOfInt.first
                            print("total 2.1 - ", total)
                            temp.forEach{ total = total! + $0 }
                            print("total 2.2 is - ", total as Any)
                            if (k - total!) == 0 {
                                return true
                            }
                        }
                    }

                    print("temp - ", temp)
                    var total = tempArrOfInt.first
                    print("total 1.1 - ", total)
                    temp.forEach{ total = total! + $0 }
                    print("total is 1.2 - ", total as Any)
                    if (k - total!) == 0 {
                        return true
                    }
                }
            }
        }
    }
    return false

}

// Test #1
let sub_array = ["x", "x", "x", "y", "y"]
let k = 12
let result = getResult(sub_array, k)
print(result)
// = True
// Можно заменить x на 2, y на 3, тогда получится
//[2, 2, 2, 3, 3]

// Test #2
let sub_array2 = ["x", "x", "y", "y"]
let k2 = 20
let result2 = getResult(sub_array2, k2)
print(result2)

// Test #3
let sub_array4 = ["x", "x"]
let k4 = 2
let result4 = getResult(sub_array4, k4)
print(result4)

// Test #4
let sub_array5 = ["x", "x", "y"]
let k5 = 4
let result5 = getResult(sub_array5, k5)
print(result5)

// Test #5
let sub_array6 = ["x", "x", "y", "z"]
let k6 = 24
let result6 = getResult(sub_array6, k6)
print(result6)

// Test #6
let sub_array7 = ["x", "x", "y", "z"]
let k7 = 34
let result7 = getResult(sub_array7, k7)
print(result7)
