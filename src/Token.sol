pragma solidity ^0.8.24;

contract Token {
    string public name = "My Hardhat Token"; // 代币名称
    string public symbol = "MBT"; // 代币符号
    uint8 public decimals = 18; // 标准ERC-20代币的小数位
    uint256 public totalSupply = 1000000000000000000; // 1个代币，具有18个小数位

    address public owner; // 合约拥有者

    mapping(address => uint256) balances; // 存储每个账户的余额
    mapping(address => mapping(address => uint256)) allowed; // 记录授权金额

    event Transfer(address indexed from, address indexed to, uint256 value); // 转账事件
    event Approval(address indexed owner, address indexed spender, uint256 value); // 授权事件

    constructor() {
        balances[msg.sender] = totalSupply; // 将总供应量分配给合约部署者
        owner = msg.sender; // 设置合约拥有者
    }

    // 查询账户余额
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    // 转账功能
    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0), "Transfer to zero address"); // 检查转账地址是否为零地址
        require(balances[msg.sender] >= amount, "The balance is not enough."); // 检查余额是否足够

        balances[msg.sender] -= amount; // 扣除发送者余额
        balances[to] += amount; // 增加接收者余额

        emit Transfer(msg.sender, to, amount); // 触发转账事件
        return true;
    }

    // 授权功能
    function approve(address spender, uint256 amount) external returns (bool) {
        allowed[msg.sender][spender] = amount; // 设置授权金额
        emit Approval(msg.sender, spender, amount); // 触发授权事件
        return true;
    }

    // 代为转账功能
    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        require(to != address(0), "Transfer to zero address"); // 检查转账地址是否为零地址
        require(balances[from] >= amount, "The balance is not enough"); // 检查发送者余额是否足够
        require(allowed[from][msg.sender] >= amount, "Allowance is not enough"); // 检查授权额度是否足够

        balances[from] -= amount; // 扣除发送者余额
        balances[to] += amount; // 增加接收者余额
        allowed[from][msg.sender] -= amount; // 扣除授权额度

        emit Transfer(from, to, amount); // 触发转账事件
        return true;
    }

    // 查询授权额度
    function allowance(address tokenOwner, address spender) external view returns (uint256) {
        return allowed[tokenOwner][spender];
    }
}
