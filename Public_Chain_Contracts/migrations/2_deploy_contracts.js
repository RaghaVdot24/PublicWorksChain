const AuctionCreation = artifacts.require("AuctionCreation");
const StakeholderRegistration = artifacts.require("StakeholderRegistration");
const AuctionToken = artifacts.require("AuctionToken");
const Authenticate = artifacts.require("Authenticate");

module.exports = function(deployer) {

	deployer.deploy(AuctionToken, 1000);
	deployer.deploy(StakeholderRegistration);
}
