func validPalindrome2(_ s: String) -> Bool {
    var l = 0
    var r = s.count - 1
    var strs = Array(s)
    while l < r {
        if strs[l] != strs[r] {
            return checkPalindrome(Array(strs[(l+1)...r]))
            || checkPalindrome(Array(strs[l...(r-1)]))
        }
        l += 1
        r -= 1
    }
    return true
}


func checkPalindrome(_ strs: [Character]) -> Bool {
    var l = 0
    var r = strs.count - 1
    while l < r {
        if strs[l] != strs[r] {
            return false
        }
        l += 1
        r -= 1
    }
    return true
}
