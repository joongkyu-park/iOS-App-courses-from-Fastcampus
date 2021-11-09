import UIKit

// 도전과제
// 1. 강의 이름, 강사 이름, 학생 수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 Array와 강사이름을 받아서 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의를 3개 만들고 강사이름으로 강의 찾기


// Protocol
// 규약, 지켜야할 약속 -> 꼭 구현되어야하는 메소드나 프로퍼티의 목록
// 어느 서비스를 이용할 때 해야할일들 -> 이걸 준수해야 사용할 수 있다.
// ex) 음악서비스이용 -> 아이디생성, 결제,... 와같은 꼭 해야하는일들
// CustomStringConvertible
struct Lecture : CustomStringConvertible { // 프로토콜 추가
    var description: String { // 서비스를 사용하기위해서 해야할일.
        return "Title: \(lectureName), Instructor: \(teacherName)"
    }
    // 원래는 해당 구조체로 만든 객체를 print 하면 프로퍼티들을 열거해주는데,
    // 프로토콜로 decription을 직접 만들 수 있다.
    
    var lectureName: String
    var teacherName: String
    var numberOfStudents : Int
    
}


func printLectureOfTeacher(lectures:Array<Lecture>, who : String){
//    for lecture in lectures{
//        if(lecture.teacherName ==  who){
//            print("\(who)'s lecture is \(lecture.lectureName)")
//        }
//    }
    
    // 클로져 사용
    let lectureName = lectures.first{
        (lec)-> Bool in return lec.teacherName == who // .first(where:)문
        // $0.teacherName == who}?.lectureName ?? ""   -> 위와 같은뜻
        
    }?.lectureName ?? ""   // return 값이 옵셔널타입임. 값이 nil일때 빈문자열("")로 출력.
    
    print("\(who)'s lecture is \(lectureName)")
    
}


var lec1 = Lecture(lectureName: "국어", teacherName: "김", numberOfStudents: 3)
var lec2 = Lecture(lectureName: "수학", teacherName: "박", numberOfStudents: 10)
var lec3 = Lecture(lectureName: "영어", teacherName: "최", numberOfStudents: 599)

var arrayOfLectures : Array<Lecture> = [lec1,lec2,lec3]

printLectureOfTeacher(lectures: arrayOfLectures, who: "박")
