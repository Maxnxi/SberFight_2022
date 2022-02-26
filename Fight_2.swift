//
//  Fight_2.swift
//  
//
//  Created by Maksim Ponomarev on 26.02.2022.
//

import Foundation

func getResult(nums: [Int], k: Int) -> Int {
    if k == 0 {
        return 0
    }
    var tempInt: Int = 0
    var tempArr = nums
    var tempK = k
    
    repeat {

        for index in 0..<tempArr.count{
            if tempArr[index] <= tempK {
                tempArr[index] = 0
                tempArr.sort()
                tempK += 1
                tempInt += 1
            }
        }

    } while (tempK < tempArr.min()!)
    
    
    return tempInt
}

// Test #1
let x = [1,2,3,4,5]
let k = 1
let res = getResult(nums: x, k: k)
print(res)
