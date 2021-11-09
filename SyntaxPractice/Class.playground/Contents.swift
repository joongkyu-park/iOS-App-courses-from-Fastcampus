import UIKit

// Class
/*
 관계가 있는 것들을 묶어서 표현. 관계가 있는 것들 = Object
 Object = Data(Property) + Method
 Object는 Structure, Class 2가지로 표현할 수 있다.
 2가지는 어떤 차이가 있나?
 
 Structure           Class
 Value Types        Reference Types
 Copy               Share
 Stack              Heap
 Fast               Slow
*/

struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass{
    var firstName: String
    var lastName: String
    
    // 클래스는 생성자가 필수.
    // 구조체에서도 생성자 만들 수 있지만 필수는 아님.
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
    func uppercaseName() {  // class에서는 mutating키워드를 사용 x
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}


var personStruct1 = PersonStruct(firstName: "Jason", lastName: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Jason" , lastName: "Lee")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName


personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName


personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
personClass1.firstName
personClass2.firstName // 새로 만들어진 인스턴스를 포인팅하게 되었다.


personClass1 = personClass2 // 다시 personClass1이 personClass2을 바라보게 되었다.
personClass1.firstName
personClass2.firstName


// 언제 Class를 쓰고 Struct를 쓸까?

/*
 Struct를 쓸 때
 
 1. 두 object를 "같다, 다르다"로 비교해야하는 경우
 ex)
 let point1 = Point(x: 3, y: 5)
 let point2 = Point(x: 3, y: 5)
 -> 이럴 때, 데이터 자체를 비교할 때 서로 다른 객체지만 같다고 판단해야하므로 struct 사용.
 
 2. Copy된 각 객체들이 독립적인 상태를 가져야 하는 경우
 ex)
 var myMac = Mac(owner: "Jason")
 var yourMac = myMac
 yourMac.onwer = "Jay"
 
 myMac.owner
 yourMac.onwer
 -> 같은 맥을 나눠쓰는 게 아니라 각자의 맥은 각자 것이니까!
 
 3. 코드에서 오브젝터의 데이터를 여러 스레드에 걸쳐 사용할 경우
 Value타입의 경우에는 해당 인스턴스가 Copy된 "Unique" 인스턴스다.
 그래서 여러 스레드에 걸쳐 사용될 때 좀 더 안전하게 사용될 수 있다.
 왜 안전하냐?
 한 객체에 여러 스레드가 동시에 접근했을 때 잠재적인 위협이 있음
 Struct를 사용하면 각 스레드가 유니크 인스턴스를 가지고 있어서 잠재적인 위험을 피할 수 있다.
 
 
 Class를 쓸 때
 
 1. 두 object의 인스턴스 자체가 같음을 확인해야 할 때
 2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우
 
 
 =>
 일단 Struct로 쓰자.
 Swift는 Struct를 좋아한다.
 
 iOS 개발할 때,
 Apple 공식문서를 먼저 보자. 그 다음에 Stackoverflow 참조하기!
 공식문서가 좀 더 딱딱하지만 개발실력향상에 많은 도움과 이해를 준다.
 */


// Class 실습

struct Grade{
    var letter: Character
    var points: Double
    var credits: Double
}
class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
        self.firstName=firstName
        self.lastName=lastName
    }
    
    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student : Person {
    var grades: [Grade] = []
    
// 상속을 통하여 다음 코드들을 다 받을 수 있다.
//    var firstName: String
//    var lastName :String
//
//    init(firstName: String, lastName: String){
//        self.firstName=firstName
//        self.lastName=lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
}

let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jason", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count

/*
 Person : Super Class(Parent Class)
 Student : SubClass(Child Class)
 
 상속의 규칙
 - 자식은 한 개의 superclass만 상속 받음
 - 부모는 여러 자식들을 가질 수 있음
 - 상속의 깊이는 상관이 없음
 */


// 학생인데 운동선수
class StudentAthlete : Student{
    var minimumTrainingTime : Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer : StudentAthlete {
    var footballTeam = "FC Swift"
    
    // 오버라이드
    override func train() {
        trainedTime += 2
    }
}

// Person > Student > Athlete > Football Player

var athlete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athlete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athlete1.firstName
athlete2.firstName

athlete1.grades.append(math)
athlete2.grades.append(math)

athlete1.minimumTrainingTime
athlete2.minimumTrainingTime

athlete2.footballTeam

athlete1.train()
athlete1.trainedTime
athlete2.train()
athlete2.trainedTime


athlete1 = athlete2 as StudentAthlete // upper casting
athlete1.trainedTime
athlete1.firstName


if let son = athlete1 as? FootballPlayer {
    print("--> team : \(son.footballTeam)")
}


// 상속은 언제 하면 좋을까?
/*
 1. Single Responsibility : 단일 책임
 각 클래스는 한 가지의 고려사항만 있으면 된다.
 
 2. Type Safety : 타입이 분명해야 할 때
 클래스간의 명확한 구분을 지어줘야할 때
 
 3. Shared Base Classes : 다자녀가 있다.
 기본 동작이 다양하게 구현되어야 하는 경우
 
 4. Extensibility
 확장성이 필요한 경우
 
 5. Identity
 정체를 파악하기 위해
 */

