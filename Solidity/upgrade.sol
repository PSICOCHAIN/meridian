pragma solidity ^0.4.26;

//Contract for upgrading Meridian Network tokens from MRDN to LOCK

import "./IERC20.sol";
import "./SafeMath.sol";

contract MeridianUpgrade{
  using SafeMath for uint;

  ERC20 public oldToken;
  ERC20 public newToken;
  uint public CONVERSION_PERCENT=100; //100%, percentage of new tokens you receive from putting in old tokens
  constructor(address tokenAddr1,address tokenAddr2) public{
    oldToken=ERC20(tokenAddr1);
    newToken=ERC20(tokenAddr2);
  }
  function upgrade(uint amount) public{
    //transfer old tokens
    oldToken.transferFrom(msg.sender,address(this),amount);
    //user recieves tokens at given ratio
    uint amountNew=amount;//.mul(CONVERSION_PERCENT).div(100);
    newToken.transfer(msg.sender,amountNew);
  }
}
