import "./ChainToken.sol";
import "./StakeholderRegistration.sol";
import "./Authenticate.sol";

contract AuctionCreation {
	address owner;
	uint starttime;
	uint endtime;
	address addrChainToken;
	address addrStakeholderReg;
	address[] stakeholders;
	constructor (uint stime, uint etime, address addrCToken, address addrSreg) public {
		owner = msg.sender;
		starttime = stime;
		endtime = etime;
		addrStakeholderReg = addrSreg;
		addrChainToken = addrCToken;
		//Authenticate auth = new Authenticate(stime,etime,address(this),owner);
	}
	

	function start() public {
		require(now >= starttime);
		require(now <= endtime);
		//send ChainTokens to all, this is to check if a particular address has already bid in an auction
		StakeholderRegistration sreg = StakeholderRegistration(addrStakeholderReg); //call already deployed contract
		ChainToken vt = ChainToken(addrChainToken);
		stakeholders = sreg.getstakeholders();
		for(uint i=0; i< stakeholders.length; i++)
		{
			vt.transfer(stakeholders[i],1);
		}
	}

	function getstartDate() public view returns(uint) {
		return starttime;
	}

	function getendDate() public view returns (uint) {
		return endtime;
	}
}