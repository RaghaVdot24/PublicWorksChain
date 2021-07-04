contract StakeholderRegistration {
    address owner;
    address[] stakeholders;
    constructor () public {
        owner = msg.sender;
    }

    mapping (bytes32 => address) idmap;
	
	
	/*
		Registers stakeholders and create a mapping of stakeholder id to account address on the blockchain
	*/
    function registerStakeholders(address addrActor, string memory name, string memory location, string memory type, uint aadhar) public returns(bytes32){
        //some verification
        stakeholders.push(addrActor);
        //Assigned id
        bytes32 SId = keccak256(abi.encodePacked(name,location,type));
        
        //Calculate hash of assigned id and aadhar id and map it to address
        bytes32 storageid = keccak256(abi.encodePacked(aadhar,SId));
        idmap[storageid] = addrActor;
        return SId;
    }
    
    function getstakeholders() public view returns(address[] memory) {
        return stakeholders;
    }

    function getAddress(bytes32 SId, uint aadhar) public view returns(address) {
        bytes32 idhash = keccak256(abi.encodePacked(aadhar,SId));
        return idmap[idhash];
    }
}