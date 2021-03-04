/*
 * @lc app=leetcode id=53 lang=swift
 *
 * [53] Maximum Subarray
 *
 * https://leetcode.com/problems/maximum-subarray/description/
 *
 * algorithms
 * Easy (47.75%)
 * Likes:    11029
 * Dislikes: 525
 * Total Accepted:    1.3M
 * Total Submissions: 2.8M
 * Testcase Example:  '[-2,1,-3,4,-1,2,1,-5,4]'
 *
 * Given an integer array nums, find the contiguous subarray (containing at
 * least one number) which has the largest sum and return its sum.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 * Output: 6
 * Explanation: [4,-1,2,1] has the largest sum = 6.
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: nums = [1]
 * Output: 1
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: nums = [0]
 * Output: 0
 * 
 * 
 * Example 4:
 * 
 * 
 * Input: nums = [-1]
 * Output: -1
 * 
 * 
 * Example 5:
 * 
 * 
 * Input: nums = [-100000]
 * Output: -100000
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 1 <= nums.length <= 3 * 10^4
 * -10^5 <= nums[i] <= 10^5
 * 
 * 
 * 
 * Follow up: If you have figured out the O(n) solution, try coding another
 * solution using the divide and conquer approach, which is more subtle.
 */

// @lc code=start
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = nums[0]
        var lastSum = nums[0]

        for i in 1..<n {
            lastSum = nums[i] + max(0, lastSum)
            ans = max(ans, lastSum)
        }
        return ans
    }
}
// @lc code=end

assert(Solution().maxSubArray([1]) == 1)
assert(Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6)


// -2  1 -3  4 -1  2  1 -5  4
// -2 -1 -6 -2 