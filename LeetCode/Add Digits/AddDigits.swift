//
//  AddDigits.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 09/03/26.
//

func addDigits(_ num: Int) -> Int {
    // digital root of a number (in base 10) is the remainder of the number when divided by 9
    // there are three cases -
    // for num == 0, return 0
    // if the num is divisible by 9, then the result will be always 9
    // otherwise the result is num%9

    if num == 0 { return 0 }
    if num % 9 == 0 { return 9 }
    return num % 9

}

func addDigitsRecursive(_ num: Int) -> Int {
    func helper(_ num: Int) -> Int {
        if "\(num)".count == 1 {
            return num
        }
        var n = num, sum = 0
        while n > 0 {
            sum += n%10
            n /= 10
        }
        return helper(sum)
    }
    return helper(num)
}

//print(addDigits(38))
