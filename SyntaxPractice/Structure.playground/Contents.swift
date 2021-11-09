import UIKit

// Structure

/*
 Structure vs. Class ?
 
 Structure : Value Types -> Copy : Stack 메모리에 생성됨
 Class : Reference Types -> Share : Heap 메모리에 생성됨
 
 */
 // ex)
 class PersonClass {
    var name:String
    var age: Int
    
    init(name:String, age: Int){
        self.name = name
        self.age = age
    }
 }

struct PersonStruct {
    var name:String
    var age: Int
    
    init(name: String, age:Int){
        self.name = name
        self.age = age
    }
}
 let pClass1 = PersonClass(name: "Jason", age: 5)
 let pClass2 = pClass1  // ==> referecne(pointing same instance)
 pClass2.name = "Hey"
 
 pClass1.name
 pClass2.name
 
 
 var pStruct1 = PersonStruct(name: "Jason", age: 5)
 var pStruct2 = pStruct1
 pStruct2.name = "Hey" // ==> copying value and creating new instance
 
 pStruct1.name
 pStruct2.name
 




// 문제 : 가장 가까운 편의점 찾기

// 맨처음 시작시.... 코드



// 거리를 구하는 함수
func getDistance(current:Location, target: Location)
-> Double {
 // by 피타고라스..
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX*distanceX+distanceY*distanceY)
    return distance
}
struct Location {
    let x: Int
    let y: Int
}

struct Store {
    let loc: Location
    let name: String
    
    let deliveryRange = 2.0
    func isDeliverable(userLoc: Location) -> Bool{
        let distanceToStore = getDistance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}


// 현재 스토어 위치들

// let store1 = (x:3, y:5, name:"gs")  -> 재사용성, 가독성 등등 bad
let store1 = Store(loc: Location(x:3, y:5), name:"gs")
let store2 = Store(loc: Location(x:4, y:6), name: "seven")
let store3 = Store(loc: Location(x:1, y:7), name:"cu")



// 가장 가까운 스토어 구해서 프린트하는 함수
func printClosestStore(currentLocation:Location, stores:[Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores{
        let distanceToStore = getDistance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore{
            closestStoreName = store.name
            isDeliverable =  store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closest store is : \(closestStoreName), isDeliverable : \(isDeliverable)")
}

// Stores Array 세팅, 현재 내 위치 세팅
let myLocation = Location(x:2, y:5)
let stores = [store1, store2, store3]


// princClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore(currentLocation: myLocation, stores: stores)


// Improve Code
// - make Location struct
// - make Store struct




// Property
// 1. Stored Property : 일반적인 프로퍼티. 저장된 값.
// 2. Computed Property : 저장된 정보를 이용해서 가공 혹은 계산된 정보 제공. 프로토콜에서 description같은.

struct Person {
    
    // stored property
    var firstName: String {
        
        // Stored Property에서만 가능. 데이터가 변경될 때마다 관찰가능
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
        willSet {
            print("willSet: \(firstName) --> \(newValue)")
        }
        
    }
    var lastName: String
    
    /*
    lazy property
    엔지니어링 측면에서 최적화하기 위해.
    이니셜 밸류를 생성할때(구조체를 생성할 때) 코스트가 드는데,
    지금 당장 코스트를 들여서 알아야되는 것이 아니면 최대한 미루고
    사용자가 접근할 때 쓸 수 있게 만드는 것.
    또는 모든사용자에게 접근되지 않을 때 효율화 차원에서 사용.
    */
    lazy var isPopular: Bool = {
        if fullName == "Jay Pakr" {
            return true
        }else{
            return false
        }
    }()
    
    
    // computed property
    var fullName: String{
        get{
            return "\(firstName) \(lastName)"
        }
        set {
            if let firstName = newValue.components(separatedBy: " ").first{
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last{
                self.lastName = lastName
            }
        }
        // get과 set이 없으면 Computed Property로 Stored Property를 변경할 수 없다.
    }
    
    /*
     computed property에서 한 가지 의문.
     메소드로 호출하는거랑 뭐가 다르지? 메소드가 그냥 값을 리턴하는 작업을 한다면?
     
     Setter가 필요한가? --> 네 ----------------------------------------> Computed Property
     
                     --> 아니오 -- 계산이 많이필요한가?         --> 네 ----> Method
                                 or DB access나 File io가
                                 필요한가?                 --> 아니오 --> Computed Property
     */
    
    
    // type property
    // 생성된 인스턴스와 상관없이 구조체의 타입, 클래스의 타입자체의 속성을 정하고 싶을 때 사
    static let isAlien: Bool = false
}

var p1 = Person(firstName: "Jason", lastName: "Lee")

p1.firstName
p1.lastName

p1.firstName = "Jim"
p1.lastName = "Kim"
// 프로퍼티가 let이라면 업데이트할 수 없다.

p1.firstName
p1.lastName

p1.fullName
p1.fullName = "Jay Park"

p1.firstName
p1.lastName

Person.isAlien
p1.isPopular



// Method

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numeOfRegisterd: Int = 0
    
    func remainSeats() -> Int {
        let remainSets = maxStudents-numeOfRegisterd
        return remainSets
    }
    
    mutating func register() {  // 메소드가 stored property를 변경시킬 경우에는 mutating 키워드를 사용해야 한다.
        numeOfRegisterd += 1
    }
    
    static let target: String = "Anybodoy who wanna learn something"
    
    // type method
    static func 소속학원이름()-> String {
        return "패스트캠퍼스"
    }
}

var lec = Lecture(title: "iOS Basic")

lec.remainSeats()

lec.register()
lec.register()
lec.register()
lec.register()
lec.register()

lec.remainSeats()

Lecture.target
Lecture.소속학원이름()



// extension
// method를 추가할 때 사용

struct Math {
    static func abs(_ value: Int) -> Int {
        if value>0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(-20)

extension Math {
    static func square(_ value: Int)-> Int{
        return value * value
    }
    static func half(_ value: Int)-> Int {
        return value/2
    }
}

Math.square(5)
Math.half(490)

// 심지어 Int라는 구조체에도 메소드를 확장시킬 수 있다.
var value:Int = 10

extension Int{
    func square()-> Int{
        return self * self
    }
    func half()-> Int {
        return self/2
    }
}

value.square()
value.half()
