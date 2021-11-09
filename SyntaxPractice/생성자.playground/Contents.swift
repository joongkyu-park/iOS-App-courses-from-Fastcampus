import UIKit


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student: Student) {
        self.init(firstName: student.firstName, lastName:student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0

    var sports : [String]
    
    init(firstName: String, lastName:String, sports: [String]) {
        
        // 프로퍼티의 값을 세팅할 때
        // 자식클래스의 프로퍼티를 먼저 세팅하고, 그 다음 부모클래스의 프로퍼리틀 세팅해야한다.
        // 이것을 "2-phase initializtion"이라고 한다.
        
        // Phase 1. 프로퍼티 세팅 ( StudentAthlete -> Student -> Person : 자식 -> 부모 순)
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    
        // Phase 2. 프로퍼티나 메소드 등에 접근 가능( 부모 -> 자식 순)
        self.train()
    }
    
    // 자식클래스가 많아지다보면, 생성자 파라메터가 너무 많아지므로
    // 다음과 같이 필요없는 것들은 생략하면서 간략하게 생성자를 만들 수도 있다.
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports:[])
    }
    
    
    
    func train() {
        trainedTime += 1
    }
}

// 운동선인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student2 = StudentAthlete(firstName: "Jay", lastName: "Lee", sports: "Football")

let student3 = StudentAthlete(name: "Nike")

let student1_1 = Student(student: student1)


// designated(주 initialization)  vs. convenience(부 initialization)
/*
 1. di는 자신의 부모 di를 호출해야함. (designated initialization)
 2. ci는 같은 클래스의 이니셜라이저를 꼭 하나 호출해야함.
 3. ci는 궁극적으로 di를 호출해야함.
 */
