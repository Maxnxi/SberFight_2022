//
//  Fight_1.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

import Foundation

func getResult(cash: [Int], k: Int) -> [Int] {
    var tempArrOfThiefes: [Int] = []
    
    for index in 0..<cash.count {
        print("cash - ", cash[index])
        
        var tempArr: [Int] = []
        for ygrek in 0..<cash.count {
            if (cash[index]+k) > cash[ygrek] {
                tempArr.append(index)
            }
        }
        print("temp arr count - ", tempArr.count)
        if (tempArr.count + 1) >= cash.count {
            print("index appended - ", index)
            tempArrOfThiefes.append(index + 1 )
            tempArr = []
        }
    }
    return tempArrOfThiefes
}

// Test #1
let x = [1,3,4,2]
let k = 2
let res = getResult(cash: x, k: k)
print(res)
