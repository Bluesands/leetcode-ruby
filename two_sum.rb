# frozen_string_literal: true

=begin
leetcode #1 two-sum
https://leetcode-cn.com/problems/two-sum/
时间复杂度 O(n)

分析：
  看到这道题第一反应是利用双层循环，但仔细一想这种方式的时间复杂度O(nlogn)，
  肯定不符合预期。一下两个方案利用hash的高效查询特点来实现
方案一：
  1、将数组的值为key，索引为value存入hash中
  2、遍历数组索引
  3、计算目标差值
  4、如果hash中存储目标差值的key，且索引不等于当前遍历数组索引，
    则返回当前数组索引、目标差值在hash中的值即为目标结果

方案二：
  该方案在方案一的基础上做了优化，不需要提前将数组中值】索引存入hash中，
  在将数组的值为key、索引为value存入hash之前，实现方案一第3、4步骤，
  可以减少数组遍历次数
=end
def two_sum_v1(nums, target)
  hash = {}
  nums.each_with_index { |num, index| hash[num] = index }
  nums.each_index do |index|
    diff_num = target - nums[index]
    return [index, hash[diff_num]] if hash.key?(diff_num) && hash[diff_num] != index
  end
end

def two_sum_v2(nums, target)
  hash = {}
  nums.each_with_index do |num, index|
    diff_num = target - num
    return [index, hash[diff_num]] if hash.key?(diff_num) && hash[diff_num] != index

    hash[num] = index
  end
end

=begin
验证：
  给定 nums = [2, 7, 11, 15], target = 9
  因为 nums[0] + nums[1] = 2 + 7 = 9
  所以返回 [0, 1]
=end

nums = [2, 7, 11, 15]
target = 9

p two_sum_v1(nums, target)
# [0, 1]

p two_sum_v2(nums, target)
# [1, 0]
