/*
 * @lc app=leetcode id=35 lang=swift
 *
 * [35] Search Insert Position
 *
 * https://leetcode.com/problems/search-insert-position/description/
 *
 * algorithms
 * Easy (42.80%)
 * Likes:    3232
 * Dislikes: 285
 * Total Accepted:    777.3K
 * Total Submissions: 1.8M
 * Testcase Example:  '[1,3,5,6]\n5'
 *
 * Given a sorted array of distinct integers and a target value, return the
 * index if the target is found. If not, return the index where it would be if
 * it were inserted in order.
 * 
 * 
 * Example 1:
 * Input: nums = [1,3,5,6], target = 5
 * Output: 2
 * Example 2:
 * Input: nums = [1,3,5,6], target = 2
 * Output: 1
 * Example 3:
 * Input: nums = [1,3,5,6], target = 7
 * Output: 4
 * Example 4:
 * Input: nums = [1,3,5,6], target = 0
 * Output: 0
 * Example 5:
 * Input: nums = [1], target = 0
 * Output: 0
 * 
 * 
 * Constraints:
 * 
 * 
 * 1 <= nums.length <= 10^4
 * -10^4 <= nums[i] <= 10^4
 * nums contains distinct values sorted in ascending order.
 * -10^4 <= target <= 10^4
 * 
 * 
 */

// @lc code=start
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums + [Int.max]
        var ok = 0
        var ng = nums.count - 1
        while abs(ok - ng) > 1 {
            let mid = ng + (ok - ng) / 2
            if nums[mid] < target {
                ok = mid
            } else {
                ng = mid
            }
        }
        return nums[ok] >= target ? ok : ok + 1
    }
}
// @lc code=end


assert(Solution().searchInsert([1,3,5,6], 0) == 0)
assert(Solution().searchInsert([1,3,5,6], 5) == 2)