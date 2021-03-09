/*
 * @lc app=leetcode id=101 lang=swift
 *
 * [101] Symmetric Tree
 *
 * https://leetcode.com/problems/symmetric-tree/description/
 *
 * algorithms
 * Easy (48.14%)
 * Likes:    5731
 * Dislikes: 154
 * Total Accepted:    839.8K
 * Total Submissions: 1.7M
 * Testcase Example:  '[1,2,2,3,4,4,3]'
 *
 * Given the root of a binary tree, check whether it is a mirror of itself
 * (i.e., symmetric around its center).
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: root = [1,2,2,3,4,4,3]
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: root = [1,2,2,null,3,null,3]
 * Output: false
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * The number of nodes in the tree is in the range [1, 1000].
 * -100 <= Node.val <= 100
 * 
 * 
 * 
 * Follow up: Could you solve it both recursively and iteratively?
 */
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func values(_ root: TreeNode?, _ inverse: Bool, ans: [Int?] = []) -> [Int?] {
        guard let root = root else { return ans + [nil] }
        let rarray = values(root.right, inverse)
        let larray = values(root.left, inverse)
        var ans = ans
        ans += [root.val]
        ans += inverse ? rarray : larray
        ans += !inverse ? rarray : larray
        return ans
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        let right = values(root?.right, true)
        let left = values(root?.left, false)        
        return right == left
    }
}
// @lc code=end

let root = TreeNode.init(
    2, 
    .init(2, nil, .init(3)), 
    .init(2, nil, .init(3))
)
Solution().isSymmetric(root)
