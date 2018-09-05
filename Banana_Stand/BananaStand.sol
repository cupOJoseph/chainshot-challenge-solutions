pragma solidity ^0.4.19;

contract BananaStand {
  uint8 public bananas;

  function addBananas (uint8 amount) public{
        require(amount >= 0);
        //positive amount
        require(bananas + amount >= bananas);
       
       //do computation
        bananas = bananas + amount;
  }

  function removeBananas (uint8 amount) public{
        require(amount <= bananas);
        //negative amount
        require(bananas - amount < bananas);
       
       //do computation
        bananas = bananas - amount;
  }
}
