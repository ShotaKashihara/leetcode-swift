/*
 * @lc app=leetcode id=7 lang=swift
 *
 * [7] Reverse Integer
 *
 * https://leetcode.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (25.91%)
 * Likes:    4382
 * Dislikes: 6767
 * Total Accepted:    1.4M
 * Total Submissions: 5.5M
 * Testcase Example:  '123'
 *
 * Given a signed 32-bit integer x, return x with its digits reversed. If
 * reversing x causes the value to go outside the signed 32-bit integer range
 * [-2^31, 2^31 - 1], then return 0.
 * 
 * Assume the environment does not allow you to store 64-bit integers (signed
 * or unsigned).
 * 
 * 
 * Example 1:
 * Input: x = 123
 * Output: 321
 * Example 2:
 * Input: x = -123
 * Output: -321
 * Example 3:
 * Input: x = 120
 * Output: 21
 * Example 4:
 * Input: x = 0
 * Output: 0
 * 
 * 
 * Constraints:
 * 
 * 
 * -2^31 <= x <= 2^31 - 1
 * 
 * 
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        let r = Int(String(String(abs(x)).reversed()))!
        if (Int(Int32.min)...Int(Int32.max)).contains(r) {
            return isNegative ? -r : r
        } else {
            return 0
        }
    }
}
// @lc code=end
print(Solution().reverse(1534236469))
