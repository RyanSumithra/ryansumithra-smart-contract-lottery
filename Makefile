-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

install :; forge install cyfrin/foundry-devops@0.2.2 && 
forge install smartcontractkit/chainlink-brownie-contract@1.1.1 &&
forge install foundry-rs/forge-std@v1.8.2 && forge install transmission11/solmate@v6

deploy-sepolia :; 
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url https://eth-sepolia.g.alchemy.com/v2/BTF2deQM7OrMyCxUljHa- --account defaultKey --broadcast --verify --ehterscan-api-key ${ETHERSCAN_API_KEY} -vvvv
