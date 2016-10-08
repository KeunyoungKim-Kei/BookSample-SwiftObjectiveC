//: Playground - noun: a place where people can play

import UIKit

struct Stat {
    let sum: Double
    let avg: Double
}

func statistics(_ numbers: Int...) -> Stat {
    var sum = 0
    
    for n in numbers {
        sum += n
    }
    
    return Stat(sum: Double(sum), avg: Double(sum) / Double(numbers.count))
}

let result = statistics(1, 2, 3, 4, 5)
print("sum: \(result.sum)")
print("avg: \(result.avg)")
// sum: 15.0
// avg: 3.0