import UIKit

// 8. Function
func printMultipleOfTen(value : Int){
    print("\(value) * 10 = \(value) * 10")
} // 함수정의, 매개변수 부분

printMultipleOfTen(value: 5) // 값을 명시적으로 넣어줘야한다.

func printTotalPrice( _ price : Int, _ count : Int) {
    print("Total Price : \(price * count)")
} // 매개변수 맨앞에 있는 걸 external name이라고 한다. 외부한테 보여주고 싶은 이름.
printTotalPrice(500, 7) // external name을 언더바로 넣으면 함수사용시 매개변수 명시를 안해줘도된다.

func printTotalPrice2( 가격 price : Int, 갯수 count : Int) {
    print("Total Price : \(price * count)")
}
printTotalPrice2(가격:600, 갯수:3)
// 스위프트는 한글도 지원한다. 변수명, 함수명 이런거 모두 한글 가능.

func printTotalPriceWithDefaultValue(price: Int = 1500, count : Int){
    print("Total Price: \(price * count)")
} // default 값을 줄 수 있다.
printTotalPriceWithDefaultValue(count: 10) // default 제외한 매개변수 1개
printTotalPriceWithDefaultValue(price: 2000, count: 10) // 물론 default 값도 매개변수를 넣어서 변경가능

func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
} // return 값이 있을 경우 위와 같이 표현.

let caculatdPrice = totalPrice(price: 10000, count: 77)
caculatdPrice


// 9. Overload
// 함수의 이름과 로직은 같은데 parameter type이나 parameter name이 다를 때 사용

func printTotalPrice(price: Int, count: Int){
    print("Total Price: \(price * count)")
}
func printTotalPrice(price: Double, count: Double){
    print("Total Price: \(price * count)")
}
func printTotalPrice(가격: Int, 갯수: Int){
    print("Total Price: \(가격 * 갯수)")
}


// 10. In-out parameter
// Copy in, Copy out의 뜻
// c++의 참조개념. 외부의 변수를, 함수의 매개변수로 넣어서, 함수내에서 변경시킬 수 있음.
// 매개변수 들어오는 변수는 constant라서 inout이 없으면 변경불가

var value = 3
func incremnetAndPrint(_ value: inout Int){
    value += 1
    print(value)
}
incremnetAndPrint(&value)
print(value)


// 11. Function as a param

func add(_ a : Int, _ b : Int) -> Int {
    return a + b
}
func substract(_ a : Int, _ b : Int) -> Int {
    return a - b
}

var function = add  // 함수도 값이다. 변수에 할당시킬 수 있다.
function(4 ,2)
function = substract
function(4,2)

// 함수도 값이기 때문에 인자로 전달할 수 있다.
func printResult(_ function: (Int, Int)->Int ,_ a : Int, _ b : Int) {
    let result = function(a,b)
    print(result)
}

printResult(add,10,5)
printResult(substract,10,5)

/*
 최대한 함수1개에 1개의 기능만 넣자! (함수형 프로그래밍)
 -> 그러기 위해서는 함수를 10줄 이내로 짜자.
 
 함수가 길어져서 50줄, 100줄이 되면 함수를 작은 함수들로 쪼개는 훈련을 해야한다.
 */


// 12. Optional
// 변수나 상수에 값을 할당할 때 값이 있을 수도, 없을 수도 있음을 나타낼 수 있다.
// Java에도 Optional 기능이 있는데, 목적은 NPE(NullPointerException을 방지하기 위해서.)

var carName:String?  // 변수 carName은 String타입이 아닌 String Optional타입이 된다. 값이 없을 경우 nil이다.
carName = nil  // 명시적으로 nil을 할당시켜도된다.

let num = Int("10")  // 변수 num의 타입은? Int Optional.
let num2 = Int("10하이")  // 이렇게 캐스팅이 올바르게 되지 않을경우 값이 없어야 하기 때문에(nil) Int Optional.

// Optional 고급기능 4가지

// Forced unwrapping - 강제로 박스열기
// Optional binding (if let) - 부드럽게 박스열기1
// Optional binding (guard) - 부드럽게 박스열기2
// Nil coalescing - 박스를 열었더니 값이 없으면 디폴트값 주기

carName = "porsche"
print(carName)  // Optional String을 그냥 출력하면 Optional 형태로 출력된다.
print(carName!)  // 강제로 박스열기, 값이 없으면(nil) error를 반환.

let hi = carName
print(hi)

// if let 문법으로 좀 더 안전하게 optional 타입을 출력할 수 있다. (else문으로 nil일 때도 출력)
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else{
    print("Car Name이 없습니다.")
}

func printParsedInt(from : String){
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else{
        print("Int타입으로 컨버팅 실패.")
    }
} // 이처럼 if, else문을 쓰면 함수가 좀 복잡해질 가능성이 있음.
printParsedInt(from: "100")
printParsedInt(from: "안녕")

func printParsedInt2(from : String){
    guard let parsedInt = Int(from) else{  // guard문으로 nil 거르기.
        print("Int로 컨버팅 실패.")
        return
    }
    
    print(from)
}
printParsedInt(from: "100")
printParsedInt(from: "안녕")

// nil일 경우 디폴트값 주기
carName = "sonota"
let myCarName:String = carName ?? "이름없음"
carName = nil


// 도전과제
// 1. 최애음식 이름을 담는 변수작성(String ?)
// 2. 옵셔널 바인딩을 이용해 값 확인하기
// 3. 닉네임을 받아서 출력하는 함수만들기, 조건 입력 파라미터는 String ?

var myFood : String? = "Chiken"

if let CheckMyFood = myFood {
    print("My favorite food is \(CheckMyFood).")
} else {
    print("I don't have favorits foods.")
}

func printNickname(nickname : String?){
    guard let checkNickname = nickname else{
        print("I don't have a nickname.")
        return
    }
    print("My nickname is \(checkNickname).")
}
printNickname(nickname: "Robin")
printNickname(nickname: nil)
