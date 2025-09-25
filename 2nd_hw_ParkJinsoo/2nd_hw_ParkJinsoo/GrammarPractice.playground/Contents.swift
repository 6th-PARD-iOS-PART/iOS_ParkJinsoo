import UIKit
import Foundation

//MARK: - if문
//문제 1: if 문
//문자열 변수 fruit이 "apple", "banana", "cherry" 중 하나일 때, 해당하는 과일을 출력하세요.
var fruit = "banana" // 이 값을 "banana"나 "cherry"로 바꿔보세요.

//MARK: - if문 답안 작성란

if fruit == "banana"{ //banana일때 fruit 출력
    print(fruit)
}else if fruit == "apple"{ //apple일때
    print(fruit)
}else if fruit == "cherry"{ //cherry일때
    print(fruit)
}






//MARK: - guard문
//문제 2: guard 문
//함수 printPositiveNumber를 작성하세요. 이 함수는 하나의 정수 인자를 받아, 그 값이 양수일 경우에만 그 값을 출력합니다. 만약 값이 양수가 아니라면, "The number is not positive."를 출력합니다.
//
//func printPositiveNumber(_ number: Int) {
    
//}
//
//printPositiveNumber(5)  // 5를 출력해야 함
//printPositiveNumber(-3) // "The number is not positive." 출력해야 함

//MARK: - guard문 답안 작성란

func printPositiveNumber(_ number: Int) { //함수에서 정수를 받아요
    guard number > 0 else{ //0보다 크다면 리턴, 작다면 문구 출력
        print("The number is not positive.")
        return
    }
    print(number)
}

printPositiveNumber(5)
printPositiveNumber(-3)





//MARK: - enum 연관값

//문제 1: 연관값 사용하기
//"책(Book)", "비디오(Video)", "음악(Music)" 등의 미디어 아이템을 나타내는 열거형을 작성하세요. 각 아이템에는 타이틀(title)이라는 연관값을 부여합니다.

//MARK: - enum 연관값 답안 작성란

enum item { //아이템을 나타내는 열거형
    case book(title: String) //아이템별 title이라는 연관값 부여
    case video(title: String)
    case music(title: String)
}

let media: item = .book(title: "scupi")




//MARK: - enum 원시값

//문제 2: 원시값 사용하기
//열거형을 사용해 주중(sunday to saturday)을 나타내세요. 각 요일에는 1부터 7까지의 원시값을 부여합니다.

//MARK: - enum 원시값 답안 작성란

enum sundayToSaturday: Int {
    case sunday = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
}

let day: sundayToSaturday = .tuesday
day.rawValue





//MARK: - function overloading

//문제 1: 함수 오버로딩 (Overloading)
//printArea라는 함수를 작성해보세요. 이 함수는 사각형의 가로와 세로 길이를 받아 면적을 출력하고, 또 다른 버전의 함수는 원의 반지름을 받아 면적을 출력합니다.


//MARK: - function overloading 답안 작성란

func printArea(width a: Double, length b: Double) -> Double { //사각형의 가로 세로 받아서 면적 출력, Argument Label이 있는 경우
    return a * b
}

func printArea(_ r: Double) -> Double{ //원의 반지름 받아 면적 출력, 파라미터 개수가 다른 경우
    return r * r * 3.14
}

let rectangle = printArea(width: 3, length: 4)
let circle = printArea(3)




//MARK: - function If문사용 / guard문 사용

//문제: 로그인 상태 확인
//함수 checkLoginStatus를 작성해보세요. 이 함수는 로그인 상태를 나타내는 Bool 변수와 사용자 이름을 나타내는 String? 변수를 받습니다. 만약 로그인 상태가 true이면 사용자 이름을 출력하고, false이면 "로그인이 필요합니다."를 출력하세요. 사용자 이름이 nil이라면 "알 수 없는 사용자"를 출력하세요.

//MARK: - function If문사용 답안 작성란

func checkLoginStatus2(_ status: Bool, _ username: String?){ //로그인 상태를 나타내는 Bool 변수, 사용자 이름을 나타내는 String? 변수 받기
    if status == true{ //로그인 상태가 true일 때
        if username == nil{ //nil 값이 있다면 종료
            print("알 수 없는 사용자")
        }else{
            print(username!) //nil이 아니면 username 출력
        }
    }else if status == false{ //로그인 상태가 false일 때
        print("로그인이 필요합니다.")
    }
}

checkLoginStatus2(true, "jinsoo")
checkLoginStatus2(false, "jinsoo")
checkLoginStatus2(true,nil)




//MARK: - function guard문 사용 답안 작성란

func checkLoginStatus(_ status: Bool, _ username: String?){ //로그인 상태 Bool, 사용자 이름 String? 받기
    guard status == true else{ //로그인 상태면 return
        print("로그인이 필요합니다.") //아니면 문구 출력
        return
    }
    guard username == nil else{ //username이 nil이면 return
        print(username!) //아니면 nil이 아닌 경우로 가정하고 username 출력
        return
    }
    print("알 수 없는 사용자")
    
}

checkLoginStatus(true, "jinsoo")
checkLoginStatus(false, "jinsoo")
checkLoginStatus(true, nil)





//MARK: - Optional Nil-coalescing 사용

//문제 1: Nil-coalescing 연산자 ?? 사용하기
//문자열 배열 names에 이름이 몇 개 들어있습니다. 배열의 첫 번째 요소를 출력하세요. 만약 배열이 비어 있다면 "No name found"를 출력하세요.
var names: [String] = ["Alice", "Bob", "Charlie"]

//MARK: - Optional Nil-coalescing 사용 답안 작성란

let firstName = names.first ?? "No Name Found" //.first로 첫 번째 요소 출력, ??로 nil 일 경우 문구 출력
print(firstName)





//MARK: - Optional if-let 사용

//문제 2: if-let을 사용한 옵셔널 바인딩
//문자열 옵셔널 optionalString에 값이 있을 수도, 없을 수도 있습니다. 값이 있으면 "The string is:"와 함께 값을 출력하세요. 값이 없으면 "The string is nil."을 출력하세요.
var optionalString: String? = "Hello"


//MARK: - Optional if-let 사용 답안 작성란

if let check = optionalString { //optionalString에 담긴 변수가 nil이 아니라면 변수 출력 가능
    print("The string is: \(check)")
}else{ //nil인 경우의 문구 출력
    print("The string is nil.")
}

    

//MARK: - Optional guard-let 사용 답안 작성란

func insideFunction(){ //함수 내에서만 구동
    var optionalString2: String? = "Hello" //함수 내 변수
    
    guard let check = optionalString2 else{ //check에 변수가 담기면 리턴
        print("The string is nil.") //아니면 문구 출력
        return
    }
    print("The string is: \(check)")
}

insideFunction()
