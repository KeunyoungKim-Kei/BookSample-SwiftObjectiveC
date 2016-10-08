import Foundation

class MyPoint {
    var x = 0.0
    var y = 0.0
}

let startPoint = MyPoint()
let endPoint = startPoint

endPoint.x = 100
endPoint.y = 200

print("start point: {\(startPoint.x), \(startPoint.y)}")
print("end point: {\(endPoint.x), \(endPoint.y)}")
// start point: {100.0, 200.0}
// end point: {100.0, 200.0}