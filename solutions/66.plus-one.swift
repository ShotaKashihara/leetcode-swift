/*
 * @lc app=leetcode id=66 lang=swift
 *
 * [66] Plus One
 *
 * https://leetcode.com/problems/plus-one/description/
 *
 * algorithms
 * Easy (42.32%)
 * Likes:    2157
 * Dislikes: 3039
 * Total Accepted:    789.5K
 * Total Submissions: 1.9M
 * Testcase Example:  '[1,2,3]'
 *
 * Given a non-empty array of decimal digits representing a non-negative
 * integer, increment one to the integer.
 * 
 * The digits are stored such that the most significant digit is at the head of
 * the list, and each element in the array contains a single digit.
 * 
 * You may assume the integer does not contain any leading zero, except the
 * number 0 itself.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: digits = [1,2,3]
 * Output: [1,2,4]
 * Explanation: The array represents the integer 123.
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: digits = [4,3,2,1]
 * Output: [4,3,2,2]
 * Explanation: The array represents the integer 4321.
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: digits = [0]
 * Output: [1]
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 1 <= digits.length <= 100
 * 0 <= digits[i] <= 9
 * 
 * 
 */

// @lc code=start
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        let count = digits.count
        var wrapup = true
        for i in 0..<count {
            if !wrapup {
                break
            }
            let index = count - i - 1
            if digits[index] == 9 {
                digits[index] = 0
            } else {
                digits[index] += 1
                wrapup = false
            }
        }
        if wrapup {
            // return [1] + digits
            return digits
        } else {
            return digits
        }
    }
}
// @lc code=end

func assert<Input, Output: Equatable>(_ solution: (Input) -> Output, input: Input, expect: Output) {
    let result = solution(input) == expect ? "\u{001B}[0;32m" + "[AC]" + "\u{001B}[0;0m" : "\u{001B}[0;31m" + "[WA]" + "\u{001B}[0;0m"
    print(result, "Answer:", solution(input), "Expected Answer:", expect)
}

assert(Solution()., input: , expect: )

assert(Solution().plusOne, input: [1, 2, 9, 9, 9], expect: [1, 3, 0, 0, 0])
assert(Solution().plusOne, input: [9], expect: [1, 1])
