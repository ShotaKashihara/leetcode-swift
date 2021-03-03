/*
 * @lc app=leetcode id=14 lang=swift
 *
 * [14] Longest Common Prefix
 *
 * https://leetcode.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (36.11%)
 * Likes:    3766
 * Dislikes: 2142
 * Total Accepted:    959.1K
 * Total Submissions: 2.7M
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * Write a function to find the longest common prefix string amongst an array
 * of strings.
 * 
 * If there is no common prefix, return an empty string "".
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: strs = ["flower","flow","flight"]
 * Output: "fl"
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: strs = ["dog","racecar","car"]
 * Output: ""
 * Explanation: There is no common prefix among the input strings.
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 0 <= strs.length <= 200
 * 0 <= strs[i].length <= 200
 * strs[i] consists of only lower-case English letters.
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let longest = strs.sorted().first else { return "" }
        var ans = ""
        for c in longest {
            let pref = ans + String(c)
            if strs.allSatisfy({ $0.hasPrefix(pref) }) {
                ans = pref
            } else {
                break
            }            
        }
        return ans
    }
}
// @lc code=end

