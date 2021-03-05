/*
 * @lc app=leetcode id=67 lang=swift
 *
 * [67] Add Binary
 *
 * https://leetcode.com/problems/add-binary/description/
 *
 * algorithms
 * Easy (46.97%)
 * Likes:    2563
 * Dislikes: 331
 * Total Accepted:    571.9K
 * Total Submissions: 1.2M
 * Testcase Example:  '"11"\n"1"'
 *
 * Given two binary strings a and b, return their sum as a binary string.
 * 
 * 
 * Example 1:
 * Input: a = "11", b = "1"
 * Output: "100"
 * Example 2:
 * Input: a = "1010", b = "1011"
 * Output: "10101"
 * 
 * 
 * Constraints:
 * 
 * 
 * 1 <= a.length, b.length <= 10^4
 * a and b consist only of '0' or '1' characters.
 * Each string does not contain leading zeros except for the zero itself.
 * 
 * 
 */

// @lc code=start
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var base = a
        var target = b

        for i in 0 ... max(b.count - a.count, 0) {
            guard i > 0 else { continue }
            base = "0" + base
        }
        for i in 0 ... max(a.count - b.count, 0) {
            guard i > 0 else { continue }
            target = "0" + target
        }

        var advance = 0
        for r in 0..<target.count {
            let i = target.count - 1 - r
            let base_is_one = base[i] == "1" ? 1 : 0
            let target_is_one = target[i] == "1" ? 1 : 0
            let sum = advance + base_is_one + target_is_one
            base[i] = sum.isMultiple(of: 2) ? "0" : "1"
            advance = sum > 1 ? 1 : 0
        }
        return advance == 1 ? "1" + base : base
    }
}

extension String {
    subscript(safe i: Int) -> Character? {
        guard i < self.count else { return nil }
        return self[index(at: i)]
    }
    // "ABC"[1] -> "B"
    subscript(i: Int) -> Character {
        get {
            self[index(at: i)]
        }
        set(char) {
            var characters = Array(self)
            characters[i] = char
            self = String(characters)
        }
    }
    func index(at offset: Int) -> String.Index { index(startIndex, offsetBy: offset) }
    // "ABC".swapAt(0, 1) -> "BAC"
    mutating func swapAt(_ index1: Int, _ index2: Int) {
        var characters = Array(self)
        characters.swapAt(index1, index2)
        self = String(characters)
    }
}


// @lc code=end

func assert<Input, Output: Equatable>(_ solution: (Input) -> Output, input: Input, expect: Output) {
    let result = solution(input) == expect ? "\u{001B}[0;32m" + "[AC]" + "\u{001B}[0;0m" : "\u{001B}[0;31m" + "[WA]" + "\u{001B}[0;0m"
    print(result, "\nAnswer:         ", solution(input), "\nExpected Answer:", expect)
}

assert(Solution().addBinary, input: ("11", "1"), expect: "100")
// assert(Solution().addBinary, input: ("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"), expect: "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000")

