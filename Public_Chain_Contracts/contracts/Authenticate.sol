import "./ChainToken.sol";
import "./StakeholderRegistration.sol";
import "./AuctionCreation.sol";

contract Authenticate {
    address owner;
    uint starttime;
    uint endtime;
    StakeholderRegistration reg;
    AuctionCreation auction;
    ChainToken ctoken;
    
    constructor (address chaintoken, address SRegist) public {
        owner = msg.sender;
        ctoken = ChainToken(chaintoken);
        reg = StakeholderRegistration(SRegist);
    }

    function initAddr(address AuctionCreate) public
    {
        require(msg.sender == owner);
        auction = AuctionCreation(AuctionCreate);
        starttime = auction.getstartDate();
        endtime = auction.getendDate();
    }

    function auth(uint AadharId, bytes32 SId) public
    {
        require(now >= starttime);
        require(now <= endtime);
        address vaddr = reg.getAddress(SId,AadharId);
        require(ctoken.balanceOf(vaddr)>=1);
    }
}