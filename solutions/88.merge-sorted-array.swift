/*
 * @lc app=leetcode id=88 lang=swift
 *
 * [88] Merge Sorted Array
 *
 * https://leetcode.com/problems/merge-sorted-array/description/
 *
 * algorithms
 * Easy (40.74%)
 * Likes:    3448
 * Dislikes: 5054
 * Total Accepted:    815K
 * Total Submissions: 2M
 * Testcase Example:  '[1,2,3,0,0,0]\n3\n[2,5,6]\n3'
 *
 * Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as
 * one sorted array.
 * 
 * The number of elements initialized in nums1 and nums2 are m and n
 * respectively. You may assume that nums1 has a size equal to m + n such that
 * it has enough space to hold additional elements from nums2.
 * 
 * 
 * Example 1:
 * Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 * Output: [1,2,2,3,5,6]
 * Example 2:
 * Input: nums1 = [1], m = 1, nums2 = [], n = 0
 * Output: [1]
 * 
 * 
 * Constraints:
 * 
 * 
 * nums1.length == m + n
 * nums2.length == n
 * 0 <= m, n <= 200
 * 1 <= m + n <= 200
 * -10^9 <= nums1[i], nums2[i] <= 10^9
 * 
 * 
 */

// @lc code=start
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else { return }
        guard m > 0 else { 
            nums1 = nums2
            return
        }
        var nums2 = nums2
        var n = n
        var m = m
        while let last = nums2.last {
            if m > 0, nums1[m - 1] > last {
                nums1.swapAt(m - 1, m - 1 + n)
                m -= 1
            } else {
                nums1[m + n - 1] = nums2.removeLast()
                n -= 1
            }
        }
    }
}
// @lc code=end

func assert<Input, Output: Equatable>(_ solution: (Input) -> Output, input: Input, expect: Output) {
    let result = solution(input) == expect ? "\u{001B}[0;32m" + "[AC]" + "\u{001B}[0;0m" : "\u{001B}[0;31m" + "[WA]" + "\u{001B}[0;0m"
    print(result, "\nAnswer:         ", solution(input), "\nExpected Answer:", expect)
}


do {
    var nums1 = [0]
    let nums2 = [1]
    Solution().merge(&nums1, 0, nums2, 1)
    print(nums1)
}


do {
    var nums1 = [1,2,3,0,0,0]
    let nums2 = [2,5,6]
    // assert(Solution().merge, input: (&nums1, 3, nums2, 3), expect: [1,2,2,3,5,6])
    Solution().merge(&nums1, 3, nums2, 3)
    print(nums1)
}
