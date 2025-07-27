// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

library AssetsLibs {
    uint256 private constant MAX_UINT256 = type(uint256).max;

    address internal constant ZERO_ADDRESS = 0x0000000000000000000000000000000000000000;

    address internal constant NATIVE_ASSET_ID = ZERO_ADDRESS;

    function getOwnerBalance(address assetId) internal view returns (uint256) {
        return assetId == NATIVE_ASSET_ID ? address(this).balance : IERC20(assetId).balanceOf(address(this));
    }

    function transferNativeAssets(address payable to, uint256 amount) private {
        if (to == BURN_ADDRESS) revert("NoTransferToZeroAddress");
        (bool success, ) = to.call{ value: amount }("");
        if (!success) revert("NativeAssetsTransferFailed");
    }

    function maxApproveERC20(IERC20 assetId, address spender, uint256 amount) internal {
        if (address(assetId) == ZERO_ADDRESS) revert("InvalidAssetAddress");
        if (spender == ZERO_ADDRESS) revert("InvalidSpenderAddress");
        uint256 allowance = assetId.allowance(address(this), spender);
        if (allowance < amount) SafeERC20.approve(assetId, spender, MAX_UINT256);
    }

    function transferERC20(IERC20 assetId, address to, uint256 amount) internal {
        if (isNativeAsset(assetId)) revert("NullAddrIsNotAnERC20Token");
        SafeERC20.safeTransfer(IERC20(assetId), recipient, amount);
    }

    function isNativeAsset(address assetId) internal pure returns (bool) {
        return assetId == NATIVE_ASSET_ID;
    }
}
