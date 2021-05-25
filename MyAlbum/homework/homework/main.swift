//
//  main.swift
//  homework
//
//  Created by 우일규 on 2021/04/23.
//

import Swift
import Foundation

print("숫자를 입력해 주세요 : ", terminator: "")
var input = readLine()
var inputNum = Int(input!)
var randomNumbers : [Int] = []

for _ in 0...29 {
    let randomNumber = Int(arc4random_uniform(UInt32(inputNum!))) + 1
    randomNumbers.append(randomNumber)
}

repeat {
    if inputNum! <= 1 {
        print("입력값이 잘못되었습니다. 다시 입력해주세요 : ", terminator: "")
        _ = readLine()
    } else {
        print("1 ~ \(inputNum!) 사이의 무작위 숫자열이 생성되었습니다.")
        print(randomNumbers)
    }
} while inputNum! <= 1


print("중복 제거 및 오름차순 정렬 후")
var setA : Set<Int> = Set(randomNumbers)
print(setA)
randomNumbers.sort()
print(randomNumbers)

var sum = 0
for num in randomNumbers {
    sum += num
}
print("총합 => \(sum)")

print("숫자를 입력해 주세요 : ", terminator: "")
_ = readLine()

func exit() {
    let inputs = readLine()
    if inputs == "exit" {
        exit(0)
    } else {
        print("숫자를 입력해 주세요 : ", terminator: "")
        _ = readLine()
    }
}
