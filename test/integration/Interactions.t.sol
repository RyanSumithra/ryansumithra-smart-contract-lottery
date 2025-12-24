// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "script/Interactions.s.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";
import {LinkToken} from "test/mocks/LinkToken.sol";
import {Raffle} from "src/Raffle.sol";

contract InteractionsTest is Test{
    CreateSubscription createSub;
    FundSubscription fundSub;
    AddConsumer addConsumer;
    HelperConfig helperConfig;

    address vrfCoordinator;
    address linkToken;
    address account;

    function setUp() external{
        // Deploy helper + scripts
        helperConfig = new HelperConfig();
        createSub = new CreateSubscription();
        fundSub = new FundSubscription();
        addConsumer = new AddConsumer();

        // Read config
        vrfCoordinator = helperConfig.getConfig().vrfCoordinator;
        linkToken = helperConfig.getConfig().link;
        account = helperConfig.getConfig().account;
    }

    function testCreateSubscription() public{
        // Create Subscription
        // Arrange 
        (uint256 subId,) = createSub.createSubscription(vrfCoordinator, account);

        // Act / Assert
        assertGt(subId, 0);
    }

//     function testFundSubscription() public{
//         // Arrange
//         (uint256 subId,) = createSub.createSubscription(vrfCoordinator, account);
//         vm.expectEmit(true, false, false, true);
//         emit SubscriptionFunded(subId, 0, FUND_AMOUNT);

// fundSub.fundSubscription(
//     vrfCoordinator,
//     subId,
//     linkToken,
//     account
// );
//     }

    function testAddConsumer() public{
        (uint256 subId,) = createSub.createSubscription(vrfCoordinator, account);
         Raffle raffle = new Raffle(
            /* Entrance Fee */ 0.01 ether,
            /*Interval */ 30,
            vrfCoordinator,
            /* gasLane */ bytes32(0),
            subId,
            /* callbackGasLimit */ 500000
        );
        
        addConsumer.addConsumer(
            address(raffle),
            vrfCoordinator,
            subId,
            account
        );

        // --------------------------------------------------
        // 4. VERIFY CONSUMER WAS ADDED (PUBLIC API)
        // --------------------------------------------------
        bool isAdded = VRFCoordinatorV2_5Mock(vrfCoordinator)
            .consumerIsAdded(subId, address(raffle));

        assertTrue(isAdded);

    }
    

}
