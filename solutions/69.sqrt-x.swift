/*
 * @lc app=leetcode id=69 lang=swift
 *
 * [69] Sqrt(x)
 *
 * https://leetcode.com/problems/sqrtx/description/
 *
 * algorithms
 * Easy (35.09%)
 * Likes:    1837
 * Dislikes: 2248
 * Total Accepted:    683.9K
 * Total Submissions: 1.9M
 * Testcase Example:  '4'
 *
 * Given a non-negative integer x, compute and return the square root of x.
 * 
 * Since the return type is an integer, the decimal digits are truncated, and
 * only the integer part of the result is returned.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: x = 4
 * Output: 2
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: x = 8
 * Output: 2
 * Explanation: The square root of 8 is 2.82842..., and since the decimal part
 * is truncated, 2 is returned.
 * 
 * 
 * Constraints:
 * 
 * 
 * 0 <= x <= 2^31 - 1
 * 
 * 
 */

// @lc code=start
import Foundation
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var ok = 0, ng = 1 << 31 - 1
        while abs(ok - ng) > 1 {
            let mid = ng - (ng - ok) / 2
            if mid * mid <= x {
                ok = mid
            } else {
                ng = mid
            }
        }
        return ok
    }
}
// @lc code=end

func assert<Input, Output: Equatable>(_ solution: (Input) -> Output, input: Input, expect: Output) {
    let result = solution(input) == expect ? "\u{001B}[0;32m" + "[AC]" + "\u{001B}[0;0m" : "\u{001B}[0;31m" + "[WA]" + "\u{001B}[0;0m"
    print(result, "\nAnswer:         ", solution(input), "\nExpected Answer:", expect)
}

assert(Solution().mySqrt, input: 4, expect: 2)
