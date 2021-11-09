import UIKit

/*
 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
 */

// 1.
func printName(firstName : String, lastName : String){
    print("Full name is \"\(firstName) \(lastName)\". ")
}
printName(firstName: "Robin", lastName: "Park")

// 2.
func printNameWithoutParam(_ firstName : String, _ lastName : String){
    print("Full name is \"\(firstName) \(lastName)\". ")
}
printNameWithoutParam("Jason", "Kim")

// 3.
func printNameWithReturn(firstName : String, lastName : String)->String{
    return "Full name is \"\(firstName) \(lastName)\". "
}
let herName = printNameWithReturn(firstName: "Ally", lastName: "Lee")
print(herName)
