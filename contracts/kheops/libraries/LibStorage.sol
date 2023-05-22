// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.17;

import "../../utils/Constants.sol";
import { DiamondStorage, KheopsStorage } from "../Storage.sol";

/// @title LibStorage
/// @author Angle Labs, Inc.
library LibStorage {
    /// @notice Returns the storage struct stored at the `DIAMOND_STORAGE_POSITION` slot
    /// @dev This struct handles the logic of the different facets used in the diamond proxy
    function diamondStorage() internal pure returns (DiamondStorage storage ds) {
        bytes32 position = DIAMOND_STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }

    /// @notice Returns the storage struct stored at the `KHEOPS_STORAGE_POSITION` slot
    /// @dev This struct handles the particular logic of the Kheops system
    function kheopsStorage() internal pure returns (KheopsStorage storage ds) {
        bytes32 position = KHEOPS_STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }
}