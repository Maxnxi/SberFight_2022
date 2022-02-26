//
//  Fight_4.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

import Foundation

func getResult(invitedList: Int, dislikeList: [String]) -> Bool {
    if invitedList == 0 {
        return true
    } else if invitedList == 1 {
        return true
    }
    let allGuest = [Int](1...invitedList)
    print("allGuest created - ", allGuest)
    var badPairs:[Int:[Int]] = [:]
    for indexB in 0..<invitedList {
        var tempBadPairs:[Int: [Int]] = [:]
        for indexK in 0..<dislikeList.count {
            let guestArr = dislikeList[indexK].components(separatedBy: "-")
            let keyElement = Int(guestArr.first!)!
            let dislikeElements = guestArr.last!.components(separatedBy: ",")
            let valueElement = dislikeElements.map{Int($0)!}
            tempBadPairs[keyElement] = valueElement
        }
        if tempBadPairs.keys.contains(indexB+1) {
            let newValue = tempBadPairs[indexB+1]
            badPairs[indexB+1] = newValue
        } else {
            badPairs[indexB+1] = [0]
        }
    }
    print("Done well - ", badPairs)
    
    var sortedGuests: [Int] = []
    sortedGuests.append(1)
    var flag = 0
    while flag<invitedList {
        flag += 1
        
        for indexQ in 2...badPairs.count {
            print("x is - ", indexQ)
            if !badPairs[sortedGuests.last!]!.contains(indexQ) {
                if !sortedGuests.contains(indexQ) {
                    sortedGuests.append(indexQ)
                    print("sortedGuests.append(x.key) - ", indexQ)
                }
            }
        }
        
        if sortedGuests.count == invitedList {
            print("sorted guests - ", sortedGuests)
            return true
        }
        print("sorted guests - ", sortedGuests)
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


// Sber Tests
// 2 и 4 - false
// 1 и 3 - true
