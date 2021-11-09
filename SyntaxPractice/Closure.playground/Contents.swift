import UIKit

// 14. Closure
// 이름이 없는 메소드, 함수라고 생각하면 된다. 익명함수랑 같음.

var multiplyClosure: (Int, Int) ->  Int = {a, b in
    return a * b
}
let result = multiplyClosure(4,2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int{
    let result = operation(a,b)
    return result
}

operateTwoNum(a:4, b:2, operation: multiplyClosure)


var addClosure:(Int, Int)->Int = {a,b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 4, b: 2) {a, b in
    return a/b
}

let voidClosure: () -> Void = {     // Void는 리턴값이 없다는 명시적 표현
    print("ios 개발자 짱!")
}

voidClosure()


// Capturing Values

var count = 0

let incrementer = {
    count += 1
}
// closure은 바깥 scope의 변수를 가져와서 값을 변경시킬 수 있다.
// 이걸 capturing values 라고 한다.

incrementer()
incrementer()
incrementer()
incrementer()

count


// 클로져 보강

/*
 
 * What is Closure?
 아주 정확히는, 함수는 Closure의 한 가지 타입.
 Closure은 크게 3가지 타입이 있다.
 - Global 함수
 - Nested 함수
 - Closure Expressions => 이게 우리가 흔히 부르는 클로져.
 스위프트 공홈 정의.
 Closure expressions are unnamed closures written in a lightweight
 syntax that can capture values from their surrounding context.
 
 * 함수(Global)와 클로져의 공통점, 차이점
 공통점 :
 - 인자를 받을 수 있다.
 - 값 리턴할 수 있다.
 - 변수로 할당할 수 있다.
 - First Class Type 이다
 차이점 :
 함수 : 이름있다, func 키워드 필요
 클로져 : 이름없다, func 키워드 필요 없음
 
 * First Class Type?
 -> 함수를 다른 자료형(int, string 등)처럼 다룰 수 있다는 뜻.
 - 변수에 할당할 수 있다.
 - 인자로 받을 수 있다.
 - 리턴할 수 있다.
 
 * 실무에서 Closure가 자주 쓰이는 경우 2가지
 - Completion Block
 어떤 태스크가 완료되고 실행시키고 싶은 코드를 짤 때.
 ex) 네트워크에서 파일을 다운로드하는데, 파일은 언제 다 다운받아질지 알 수 없으므로
 파일 다운로드가 끝나면 화면에 띄우는 코드를 실행시킬 때.
 이러한 비동기적인 태스크가 완료하고 실행시킬 코드들을 클로져로 작성.
 
 - High Order Functions
 고계함수. 함수인데 인자를 함수로 받는 녀석.
 인풋으로 함수를 넘겨줄 때, 함수를 만들어서 넘겨줘도 되지만
 클로져로 즉시 넘겨줄 수 있다.
 
 * Closure Expression Syntax(general form)
 {("parameters") -> "return type" in
    "statements"
 }
 
 */

// Example 1: 초심플 Closure

let SimpleClosure = {
    // 끝
}
SimpleClosure()


// Example 2: 코드블록을 구현한 Closure

let SimpleClosure2 = {
    print("Hell, Closure!")
}
SimpleClosure2()


// Example 3: 인풋 파라미터를 받는 Closure

let SimpleClosure3: (String) -> Void = { name in
    print("나의 이름은 \(name) 입니다.")
}
SimpleClosure3("코로나가 제일 싫어")


// Example 4: 값을 리턴하는 Closure

let SimpleClosure4: (String) -> String = { name in
    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요."
    return message
}
let tmp = SimpleClosure4("중규")
print(tmp)


// Example 5: Closure를 파라미터로 받는 함수 구현

func SimpleFunction(num: Int, message: String, SimpleClosure: () -> Void) {
    print("함수에서 호출되었습니다. 메세지는 : \(message) * \(num)")
    SimpleClosure()
}

SimpleFunction(num:100, message: "너 잘할 수 있어!",SimpleClosure: {
    print("클로져에서 실행되었습니다.")
})


// Example 6: Trailing Closure
// 인자가 여러 개 있고, 클로져도 인자로 받을 때, 그런데 클로져가 마지막 인자일 때
// 다음과 같이 생략할 수 있다.
// 가독성 올라간다!

SimpleFunction(num: 999, message: "너 잘할 수 있어!"){
    print("클로져에서 실행되었습니다.")
}
