import UIKit


// 13. Collection

// Array
var evenNumbers: [Int] = [2, 4, 6 ,8]
// var evenNumbers: Array<Int> = [2, 4, 6 ,8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18,20])

evenNumbers.isEmpty
evenNumbers.count

print(evenNumbers.first)

// evenNumbers = []
// let fisrtItem = evenNumbers.first

if let firstElement = evenNumbers.first {
    print("--> first item is : \(firstElement)")
}

evenNumbers.min()
evenNumbers.max()

var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]


let ThreeElementsFromFist = evenNumbers[0...2]

evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers.insert(0, at:0)
evenNumbers

//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

// evenNumbers.swapAt(0, 9)

// for num in evenNumbers {
//     print(num)
// }

evenNumbers.enumerated()
for (index, num) in evenNumbers.enumerated() {
    print("idx: \(index), value: \(num)")
}

let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let lastRemoved = evenNumbers.dropLast()
lastRemoved

let firstThree = evenNumbers.prefix(3)
firstThree

let lastThree = evenNumbers.suffix(3)
lastThree

evenNumbers



// Dictionary

var scoreDic: [String: Int] = ["Jason":80, "Jay":95, "Jake":90]
//var scoreDic: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]

if let score = scoreDic["Jason"] {
    score
} else {
    //.. score 없음
}
scoreDic["Jay"]
scoreDic["Jerry"]

// scoreDic = [:]
scoreDic.isEmpty
scoreDic.count

// 기존 사용자 업데이트
scoreDic["Jason"] = 99
scoreDic

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic

// For Loop
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys {
    print(key)
}


// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
// 2. 여기서 도시를 부산으로 업데이트 하기
// 3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기

var myDic:[String : String] = ["Name" : "박중규", "Job" : "학생", "City": "인천"]
myDic["City"] = "부산"

func printMyDic (_ myDic : [String:String]) {
    for (k,v) in myDic{
        print("\(k) -> \(v)")
    }
}

printMyDic(myDic)


// Set

var someSet: Set<Int> = [1,2,3,1,2]

someSet
someSet.isEmpty
someSet.count

someSet.contains(4)
someSet.contains(1)

someSet.insert(5)
someSet

someSet.remove(1)
someSet








