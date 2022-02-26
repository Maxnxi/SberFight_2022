//
//  Fight_6.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

import Foundation

// MARK: -> Задание #6
/*
 Дана строка s. Вы можете удалить из нее не более k символов.

 Определите максимально возможное количество совпадений символов с stringGoal, то есть совпадением считается s[i] = stringGoal[i].

 Например, строка "agddb" совпадает с "gdda" только одним символом. Если убрать первый символ, тогда будет уже 3 совпадения - "gddb" "gdda".

 Ввод:

 s - строка с символами, 0<length(s)<20
 k - максимальное количество удалений, 0<k<10
 stringGoal - строка для сравнения
 Вывод:

 Integer - максимальное количество совпадений s[i] = stringGoal[i]

 Пример:

 s = "agdd"
 k = 1
 stringGoal = "gdd"
 getResult(s, k, stringGoal) = 3
 */
extension String {
    var length: Int {
        return count
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func getResult(_ s: String, _ k: Int, _ stringGoal: String) -> Int {
    var maxCounterOfMatched: Int = 0
//  Первая попытка
//  проходит Тестов 6 из 10
//    var flagFromPrefixToBody: Bool = false
//    var whileCounter: Int = 0
//    while whileCounter <= k {
//        var tempMainString: String = ""
//
//        if flagFromPrefixToBody == false {
//            tempMainString = s.substring(fromIndex: whileCounter)
//            print("do it 1")
//        } else {
//            var tempString = s
//            if tempString.count > (whileCounter+1) {
//                let indexToDelete = tempString.firstIndex(of: Character(tempString[whileCounter+1]))!
//                tempString.remove(at: indexToDelete)
//                tempMainString = tempString
//            }
//            print("do it 2")
//        }
//        print("tempMainString is - ", tempMainString)
//
//        var counterOfMatched: Int = 0
//        for indexA in 0..<tempMainString.count {
//            if tempMainString[indexA] == stringGoal[indexA] {
//                counterOfMatched += 1
//            }
//        }
//        print("compare results")
//        if maxCounterOfMatched < counterOfMatched {
//            maxCounterOfMatched = counterOfMatched
//        }
//        if whileCounter == k && flagFromPrefixToBody == false {
//            flagFromPrefixToBody = true
//            whileCounter = 0
//        }
//        whileCounter += 1
//    }
//    print("Part #1 finished, maxCounterOfMatched - ", maxCounterOfMatched)

//  Вторая попытка
    print("<<---->>")
    print("Part# 2")
    
    for indexA in 0..<s.count {
        print("do it 1")
        for indexB in 0...k {
            print("do it 3")
            var tempString = s
            let startIndex = tempString.index(tempString.startIndex, offsetBy: indexA)
            //print("startIndex - ", startIndex)
            guard let endIndex = tempString.index(tempString.startIndex, offsetBy: (indexA + indexB)) as? String.Index else {
                break
            }
            //print("endIndex - ", endIndex)
            if startIndex >= endIndex {
                break
            }
            tempString.removeSubrange(startIndex...endIndex)
            print("tempString - ", tempString)
            print("do it 4")
            var counterOfMatched: Int = 0
            for indexC in 0..<tempString.count {
                if tempString[indexC] == stringGoal[indexC] {
                    counterOfMatched += 1
                }
            }
            if maxCounterOfMatched < counterOfMatched {
                maxCounterOfMatched = counterOfMatched
            }

            
        }
    }
    /*
     вторая часть проходит Тестов 6 из 10
     */

    return maxCounterOfMatched
}
// 1,2,3,6,7,8
// need - 4,5,9,10
// need - 3,7,8,10
// (stringGoal.count - 1,2,3,6,7,8)

// need - 2,6,7,8

let s = "agdd"
let k = 1
let stringGoal = "gdd"
let result = getResult(s, k, stringGoal) //= 3
print(result)

let s2 = "ababcde"
let k2 = 3
let stringGoal2 = "abcde"
let result2 = getResult(s2, k2, stringGoal2) //= 5
print(result2)


let s3 = "aqwerty"
let k3 = 3
let stringGoal3 = "qwerty"
let result3 = getResult(s3, k3, stringGoal3)
print(result3)

// Fest that fails
let s4 = "aqawerty"
let k4 = 3
let stringGoal4 = "qwerty"
let result4 = getResult(s4, k4, stringGoal4)
print(result4)
