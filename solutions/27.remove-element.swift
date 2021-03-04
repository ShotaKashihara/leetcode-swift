/*
 * @lc app=leetcode id=27 lang=swift
 *
 * [27] Remove Element
 *
 * https://leetcode.com/problems/remove-element/description/
 *
 * algorithms
 * Easy (49.29%)
 * Likes:    1957
 * Dislikes: 3364
 * Total Accepted:    792.9K
 * Total Submissions: 1.6M
 * Testcase Example:  '[3,2,2,3]\n3'
 *
 * Given an array nums and a value val, remove all instances of that value
 * in-place and return the new length.
 * 
 * Do not allocate extra space for another array, you must do this by modifying
 * the input array in-place with O(1) extra memory.
 * 
 * The order of elements can be changed. It doesn't matter what you leave
 * beyond the new length.
 * 
 * Clarification:
 * 
 * Confused why the returned value is an integer but your answer is an array?
 * 
 * Note that the input array is passed in by reference, which means a
 * modification to the input array will be known to the caller as well.
 * 
 * Internally you can think of this:
 * 
 * 
 * // nums is passed in by reference. (i.e., without making a copy)
 * int len = removeElement(nums, val);
 * 
 * // any modification to nums in your function would be known by the caller.
 * // using the length returned by your function, it prints the first len
 * elements.
 * for (int i = 0; i < len; i++) {
 * print(nums[i]);
 * }
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: nums = [3,2,2,3], val = 3
 * Output: 2, nums = [2,2]
 * Explanation: Your function should return length = 2, with the first two
 * elements of nums being 2.
 * It doesn't matter what you leave beyond the returned length. For example if
 * you return 2 with nums = [2,2,3,3] or nums = [2,2,0,0], your answer will be
 * accepted.
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: nums = [0,1,2,2,3,0,4,2], val = 2
 * Output: 5, nums = [0,1,4,0,3]
 * Explanation: Your function should return length = 5, with the first five
 * elements of nums containing 0, 1, 3, 0, and 4. Note that the order of those
 * five elements can be arbitrary. It doesn't matter what values are set beyond
 * the returned length.
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 0 <= nums.length <= 100
 * 0 <= nums[i] <= 50
 * 0 <= val <= 100
 * 
 * 
 */

// @lc code=start
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var right_cursor = nums.count - 1
        var left_cursor = 0
        while right_cursor != left_cursor {
            if nums[left_cursor] == val {
                nums.swapAt(left_cursor, right_cursor)
                right_cursor -= 1
            } else {
                left_cursor += 1
            }
        }
        return nums[left_cursor] == val ? left_cursor : left_cursor + 1
    }
}
// @lc code=end

var arr = [3, 2, 2, 3]
Solution().removeElement(&arr, 3)
