//
//  Fight_3.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

// somewhere Error in code


import Foundation


func getResult(invitedList: Int, dislikeList: [String]) -> Bool {
    if invitedList == 0 {
        return true
    } else if invitedList == 1 {
        return true
    }
    let allGuest = [Int](1...invitedList)
    print("allGuest created - ", allGuest)
    var dictionaryOfAllGuests:[Int:[Int]] = [:]
    for indexB in 0..<invitedList {
        var tempArrayForDislikeList:[Int: [Int]] = [:]
        for indexK in 0..<dislikeList.count {
            let myString = dislikeList[indexK]
            let guestArr = myString.components(separatedBy: "-")
            let keyElement = Int(guestArr.first!)!
            let tempValue = guestArr.last
            let dislikeElements = tempValue!.components(separatedBy: ",")
            let valueElement = dislikeElements.map{Int($0)!}
            tempArrayForDislikeList[keyElement] = valueElement
            //print("Filling tempArrayForDislikeList - ", tempArrayForDislikeList)
        }
        if tempArrayForDislikeList.keys.contains(indexB+1) {
            let newValue = tempArrayForDislikeList[indexB+1]
            dictionaryOfAllGuests[indexB+1] = newValue
        } else {
            dictionaryOfAllGuests[indexB+1] = [0]
        }
        //print("filling dictionaryOfAllGuests - ", dictionaryOfAllGuests)
    }
    print("Done well - ", dictionaryOfAllGuests)

    var sortedGuests: [Int] = []
    sortedGuests.append(1)
    var temparrOfTempUnsorted:[Int:[Int]] = [:]

    var flag = true
    while flag {
        flag = false
        for elementX in 2...allGuest.count {

            var tempArrToDeletefromTemUnsorted:[Int] = []
            if !temparrOfTempUnsorted.isEmpty {
                if !(dictionaryOfAllGuests[elementX-1]?.contains(elementX))! {

                    for elementZ in temparrOfTempUnsorted {
                        //let listOfdislikeGuestsOfGuest = elementZ

                        var tempCounter: Int = 0
                        for elementY in elementZ.value {
                            if sortedGuests.last/*allGuest[elementX-1]*/ != elementY {
                                //flag = true
                                tempCounter += 1
                            } else {
                                //temparrOfTempUnsorted[elementZ.key] = elementZ.value
                            }
                            if tempCounter == elementZ.value.count {
                                sortedGuests.append(elementZ.key)
                                tempArrToDeletefromTemUnsorted.append(elementZ.key)
                                flag = true
                            }
                        }
                    }
                }
            }
            if !tempArrToDeletefromTemUnsorted.isEmpty {
                tempArrToDeletefromTemUnsorted.forEach { valueInt in
                    temparrOfTempUnsorted.removeValue(forKey: valueInt)
                }
            }

            // 1 проверка числа до
            if !(dictionaryOfAllGuests[elementX-1]?.contains(elementX))! {
                // 2 проверка добавляемого числа
                var tempCounter: Int = 0
                for indexZ in dictionaryOfAllGuests[elementX]! {
                    if indexZ != elementX {
                        tempCounter += 1
                    } else {
                        temparrOfTempUnsorted[elementX] = dictionaryOfAllGuests[elementX]
                    }
                    if tempCounter == dictionaryOfAllGuests[elementX]!.count {
                        sortedGuests.append(elementX)
                    }
                    flag = true
                }
            } else {
                temparrOfTempUnsorted[elementX] = dictionaryOfAllGuests[elementX]
                flag = true
            }
            if sortedGuests.count == invitedList {
                print("sotred 1 guests - ", sortedGuests)
                return true
            }
        }
    print("sotred 2 guests - ", sortedGuests)
    }
    return false
}
            
// Test #1
let invited_list1 = 4
let dislike_list1 = ["1-2,3", "3-4"]
let intT1 = getResult(invitedList: invited_list1, dislikeList: dislike_list1)
print(intT1)
// Test #2
let invited_list2 = 5
let dislike_list2 = ["1-2,3", "3-4,5", "2-3"]
let intT2 = getResult(invitedList: invited_list2, dislikeList: dislike_list2)
print(intT2)

//Sber Tests
// 2 и 4 - false
// 1 и 3 - true
