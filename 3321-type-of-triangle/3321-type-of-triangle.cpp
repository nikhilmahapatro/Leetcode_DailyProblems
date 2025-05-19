class Solution {
public:
    string triangleType(vector<int>& nums) {
        ranges::sort(nums);

        if (nums[0] + nums[1] > nums[2]){
            if (nums[0]==nums[1] && nums[1]==nums[2]){
                return "equilateral";
            }
            if (nums[0]==nums[1] || nums[1]==nums[2]){
                return "isosceles";
            }
            else{
                return "scalene";
            }
        }
        else{
            return "none";
        }
        
        
    }
};