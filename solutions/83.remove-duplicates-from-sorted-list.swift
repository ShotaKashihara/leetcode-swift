/*
 * @lc app=leetcode id=83 lang=swift
 *
 * [83] Remove Duplicates from Sorted List
 *
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
 *
 * algorithms
 * Easy (46.54%)
 * Likes:    2313
 * Dislikes: 143
 * Total Accepted:    563.6K
 * Total Submissions: 1.2M
 * Testcase Example:  '[1,1,2]'
 *
 * Given the head of a sorted linked list, delete all duplicates such that each
 * element appears only once. Return the linked list sorted as well.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: head = [1,1,2]
 * Output: [1,2]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: head = [1,1,2,3,3]
 * Output: [1,2,3]
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * The number of nodes in the list is in the range [0, 300].
 * -100 <= Node.val <= 100
 * The list is guaranteed to be sorted in ascending order.
 * 
 * 
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    var prev = Int.min
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        if prev == head.val {
            return deleteDuplicates(head.next)
        }
        prev = head.val
        head.next = deleteDuplicates(head.next)
        return head
    }
}
// @lc code=end

func assert<Input, Output: Equatable>(_ solution: (Input) -> Output, input: Input, expect: Output) {
    let result = solution(input) == expect ? "\u{001B}[0;32m" + "[AC]" + "\u{001B}[0;0m" : "\u{001B}[0;31m" + "[WA]" + "\u{001B}[0;0m"
    print(result, "\nAnswer:         ", solution(input), "\nExpected Answer:", expect)
}
