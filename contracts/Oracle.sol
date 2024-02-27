// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.7/interfaces/AggregatorInterface.sol";

contract Oracle {
    // address of chainlink
    //address constant feedAddress = 0xF9680D99D6C9589e2a93a78A04A279e509205945;
    AggregatorInterface feed;

    constructor (address feedAddress) {
        feed = AggregatorInterface(feedAddress);
    }

    function getPrice() public view returns(uint256 ) {
        return feed.latestRound();
    }
}

contract MockFeed {
    function latestRound() public view returns(uint256 ) {
        return 100;
    }
}