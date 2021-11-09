import UIKit
import Foundation

var str = "Hello, playground"


// 1. 주석(Comment)
// c++이랑 같음.
// 커맨드 + 슬래시 단축키


// 2. Tuple
let coordinates = (4,6)
let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x:2, y:3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3,y3)=coordinatesNamed


// 3. Boolean
let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("참")
} else {
    print("거짓")
}

//if ..조건.. {
//    조건이 참일 때
//} else {
//    조건이 거짓일 때
//}

let name1 = "Jin"
let name2 = "Jason"

let isTwoNameSame = (name1 == name2)

if (isTwoNameSame) {
    print("이름이 같다")
} else {
    print("이름이 다르다")
}

let isJason = name2 == "Jason"
let isMale = true

let jasonAndMale = isJason && isMale
let jasonOrMale = (isJason || isMale) // 조건에 괄호를 붙여도, 안붙여도 됨

let greetingMessage: String = isJason ? "Hello Jason" : "Hello Somebody" // 변수뒤에 : 으로 타입을 명시가능
print("Msg : \(greetingMessage)") // \()은 js의 $()역할


// 4. Scope
// 생략


// 5. While
// 기본적인 것은 생략
var i = 10
repeat {
    print(i)
    i+=1
} while i<10
// repeat-while문은 c++의 do-while문과 같다. -> 코드수행 후 조건확인


// 6. For
let closedRange = 0...10
let halfClosedRange = 0..<10
// Int의 범위를 위와 같이 ...또는 ..<으로 표현할 수 있고, 변수로 설정할 수 있다.
// 변수의 타입은 위에껀 ClosedRage<Int>, 아래껀 Range<Int>.

var sum = 0
for i in closedRange {
    print("---> \(i)")
    sum += i
}
print("total sum : \(sum)")

var sinValue : CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Jason"
for _ in closedRange {
    print("name : \(name)")
} // 언더바(_)로 인덱스 없이 루프 사용가능


for i in closedRange {
    if i % 2 == 0 {
        print("짝수 : \(i)")
    }
}
for i in closedRange where i % 2 == 0 {
    print("짝수 : \(i)")
} // 이와같이 if를 쓰지않고 where 문을 이용하여 조건을 넣어줄 수 있다.


// 7. Switch
let num = 10

switch num {
case 0:
    print("0입니다.")
case 0..<10:  // case에 범위를 넣을 수 도 있다.
    print("0과 10사이 입니다.")
case 10:
    print("10입니다.")
default:
    print("나머지입니다.")
}

let pet = "bird"

switch pet {
case "dog", "cat", "bird":  // case에 2개 이상의 값을 넣을 수 있다.
    print("집동물이네요.")
default:
    print("야생동물이네요.")
}

let number = 5

switch number {
case _ where num % 2 == 0:  // 언더바를 넣고 where로 조건만 넣을 수도 있다.
    print("짝수")
default:
    print("홀수")
}

//튜플과 switch문
let coordinate = (x:10, y:10)

switch coordinate{
case(0,0):
    print("원점입니다.")
case(_,0):
    print("x축입니다.")
case(0,_):
    print("y축입니다.")
default:
    print("좌표어딘가")
}

let coordinate2 = (x: 10, y: 10)

switch coordinate2 {
case (0, 0):
    print("---> 원점 이네요")
case (let x, 0):
    print("---> x축 이네요, x:\(x)")
case (0, let y):
    print("---> y축 이네요, y:\(y)")
case (let x, let y) where x == y:
    print("---> x랑 y랑 같음 x,y = \(x),\(y)")
case (let x, let y):
    print("---> 좌표 어딘가 x,y = \(x),\(y)")
}
