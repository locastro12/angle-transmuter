// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "oz/utils/StorageSlot.sol";

/// @title LibDiamondEtherscan
/// @notice Allow to verify a diamond proxy on Etherscan
/// @dev Forked from https://github.com/zdenham/diamond-etherscan/blob/main/contracts/libraries/LibDiamondEtherscan.sol
library LibDiamondEtherscan {
    event Upgraded(address indexed implementation);

    /**
     * @dev Storage slot with the address of the current dummy-implementation.
     * This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
     */
    bytes32 internal constant IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function setDummyImplementation(address implementationAddress) internal {
        StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value = implementationAddress;

        emit Upgraded(implementationAddress);
    }

    function dummyImplementation() internal view returns (address) {
        return StorageSlot.getAddressSlot(IMPLEMENTATION_SLOT).value;
    }
}