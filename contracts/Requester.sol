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
     * Network: Arbitrum Rinkeby
     * Oracle: 0x9DF1521cA42084dDFE43f8bCDB99277Af076Faa2
     * Job ID: d45b4c22d62449d3b93c5fc82adc72b5
     * Fee: 0.1 LINK
     */
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x615fBe6372676474d9e6933d310469c9b68e9726);
        oracle = 0x430b476540B63477200C6eea29Daf1c20f5545BA;
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
