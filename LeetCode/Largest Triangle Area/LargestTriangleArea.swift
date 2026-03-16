//
//  LargestTriangleArea.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func largestTriangleArea(_ points: [[Int]]) -> Double {
    //$$A = \frac{1}{2} |x_1(y_2 - y_3) + x_2(y_3 - y_1) + x_3(y_1 - y_2)|
    var maxArea = 0.0
    for i in 0..<points.count {
        for j in (i+1)..<points.count {
            for k in (j+1)..<points.count {
                let p1 = points[i], p2 = points[j], p3 = points[k]
                let area = 0.5 * abs(
                    Double(
                        p1[0] * (p2[1] - p3[1]) +
                        p2[0] * (p3[1] - p1[1]) +
                        p3[0] * (p1[1] - p2[1])
                    )
                )
                maxArea = max(maxArea, area)
            }
        }
    }
    return maxArea
}
