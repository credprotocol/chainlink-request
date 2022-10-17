// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';

contract Requester is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 public currentScore;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    event RequestCredScoreFulfilled(bytes32 indexed requestId, uint256 indexed score);

    /**
     * Network: Arbitrum Goerli
     * Oracle: 0xAB8E43Bfc194cC1Fba6bABA2eB19CD5147DE9233
     * Job ID: 4edf5606607b4521a83ff313a09e2606
     * Fee: 0.1 LINK
     */
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0xd14838A68E8AFBAdE5efb411d5871ea0011AFd28);
        oracle = 0xAB8E43Bfc194cC1Fba6bABA2eB19CD5147DE9233;
        jobId = '4edf5606607b4521a83ff313a09e2606';
        fee = 0.1 * 10 ** 18;
    }

    function requestCredScore() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillCredScore.selector
        );
        return sendChainlinkRequestTo(oracle, req, fee);
    }

    function fulfillCredScore(bytes32 _requestId, uint256 _score) public recordChainlinkFulfillment(_requestId) {
        emit RequestCredScoreFulfilled(_requestId, _score);
        currentScore = _score;
    }

    function getChainlinkToken() public view returns (address) {
        return chainlinkTokenAddress();
    }

    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }

    function cancelRequest(
        bytes32 _requestId,
        uint256 _payment,
        bytes4 _callbackFunctionId,
        uint256 _expiration
    ) public onlyOwner {
        cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
    }
}
