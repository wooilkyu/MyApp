import Foundation

var answerNumbers: [Int] = [] // 정답인 숫자들의 저장공간 생성
var randomNumbers: Set<Int> = [] // 중복제거된 랜덤한 숫자들 저장공간 생성

while randomNumbers.count < 4 { // randomNumbers의 자릿수가 4자리일 때 괄호 안의 조건을 만족한다.
    var num = Int.random(in: 1 ... 9)
    randomNumbers.insert(num)
}

