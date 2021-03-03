/*
 * @lc app=leetcode id=20 lang=swift
 *
 * [20] Valid Parentheses
 *
 * https://leetcode.com/problems/valid-parentheses/description/
 *
 * algorithms
 * Easy (39.89%)
 * Likes:    6912
 * Dislikes: 286
 * Total Accepted:    1.3M
 * Total Submissions: 3.3M
 * Testcase Example:  '"()"'
 *
 * Given a string s containing just the characters '(', ')', '{', '}', '[' and
 * ']', determine if the input string is valid.
 * 
 * An input string is valid if:
 * 
 * 
 * Open brackets must be closed by the same type of brackets.
 * Open brackets must be closed in the correct order.
 * 
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: s = "()"
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: s = "()[]{}"
 * Output: true
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: s = "(]"
 * Output: false
 * 
 * 
 * Example 4:
 * 
 * 
 * Input: s = "([)]"
 * Output: false
 * 
 * 
 * Example 5:
 * 
 * 
 * Input: s = "{[]}"
 * Output: true
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 1 <= s.length <= 10^4
 * s consists of parentheses only '()[]{}'.
 * 
 * 
 */

// @lc code=start
extension String {
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

class Solution {
    let pair: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
    let left: [Character] = ["(", "{", "["]
    func isValid(_ s: String) -> Bool {
        guard s.count.isMultiple(of: 2) else { return false }
        var s = s
        // 先頭1文字読み込む
        // ({[ ならキューにpush再帰
        // ]}) ならキューからpop して判定
        var queue = Array<Character>()
        while !s.isEmpty {
            let f = s.removeFirst()
            if left.contains(f) {
                queue.append(f)
            } else {
                guard !queue.isEmpty else { return false }
                let q = queue.removeLast()
                if f == pair[q] {

                } else {
                    return false
                }
            }
        }
        return queue.count == 0
    }
}

// @lc code=end
Solution().isValid("){")
