pragma solidity 0.5.10;

import "./ERC20Detailed.sol";
import "./ERC20Burnable.sol";
import "./ERC20Mintable.sol";

/**
  * @notice Represents value that will be stored in a MCD
  * @dev inherits IERC20, ERC20 and MinterRole
  * @dev inherits ERC20Detailed, ERC20Burnable, ERC20Mintable
  * @dev deployer is the owner to start
  */
contract ColTea is ERC20Detailed, ERC20Burnable, ERC20Mintable {

    // Parameters provided in the constructor
    bytes9 public cusip;
    uint256 public totalFaceValue;
    uint256 public maturityDate;
    address public custodianAddress;     // TODO this might have to be a bytes32 for an alphanumeric string
    uint256 public custodianIdentifier; // TODO determine the length to see if uint256 can be smaller

    /**
    * @notice The constructor for the ColTea.
    * @param _name name of the token (per ERC20Detailed)
    * @param _symbol symbol of the token (per ERC20Detailed)
    * @param _decimals decimals of the token (per ERC20Detailed)
    * @param _cusip standard identifier of Treasury Bills
    * @param _totalFaceValue overal value of TBills in USD
    * @param _maturityDate the date that the TBill is matured
    * @param _custodianAddress The address of the custodian
    * @param _custodianIdentifier The numeric identifier of the custodian
    */
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        bytes9 _cusip,
        uint256 _totalFaceValue,
        uint256 _maturityDate,
        address _custodianAddress,
        uint256 _custodianIdentifier
    )
    public
    ERC20Detailed(_name, _symbol, _decimals) {
        cusip = _cusip;
        totalFaceValue = _totalFaceValue;
        maturityDate = _maturityDate;
        custodianAddress = _custodianAddress;
        custodianIdentifier = _custodianIdentifier;
    }
}