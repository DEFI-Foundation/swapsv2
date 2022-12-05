// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

import './NFTGeneratorSupport.sol';
import './NFTBaseChips.sol';
import './NFTDescriptor.sol';
import '@openzeppelin/contracts/utils/Base64.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

contract NFTGenerator {
    constructor() {}

    function generateSVG(
        NFTDescriptor.nftParam memory nftParamGenerate,
        string memory chip,
        uint256 tokenId
    ) public pure returns (string memory SVGImage) {
        SVGImage = string(
            abi.encodePacked(
                '<svg id="nft-v2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 480 280" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">'
                '<style>',
                NFTGeneratorSupport.gearAnimationStyle
            )
        );
        {
            SVGImage = string(
                abi.encodePacked(
                    SVGImage,
                    nftParamGenerate.raritySparkleAnimation,
                    nftParamGenerate.rarityWaveAnimation,
                    '</style>'
                    '<defs>',
                    NFTGeneratorSupport.generateDefinitions(
                        nftParamGenerate.color1,
                        nftParamGenerate.color2
                    ),
                    '</defs>'
                    '<g id="nft-v2-base" transform="translate(.000001 0.000001)">'
                    '<path id="nft-v2-base2" d="M0,10C0,4.47715,4.47715,0,10,0h445c13.807,0,25,11.1929,25,25v245c0,5.523-4.477,10-10,10h-460.00001C4.47714,280,0,275.523,0,270L0,10Z" fill="',
                    nftParamGenerate.rarityBorder,
                    '"/>'
                    '<path id="nft-v2-base-light" style="mix-blend-mode:soft-light" d="M0,10C0,4.47715,4.47715,0,10,0h445c13.807,0,25,11.1929,25,25v245c0,5.523-4.477,10-10,10h-460.00001C4.47714,280,0,275.523,0,270L0,10Z" fill="url(#nft-v2-base-light-fill)"/>'
                    '<path id="nft-v2-outer-border" d="M1,10c0-4.97057,4.02944-9,9-9h445c13.255,0,24,10.7452,24,24v245c0,4.971-4.029,9-9,9h-460.00001C5.02943,279,1,274.971,1,270L1,10Z" fill="none" stroke="#000" stroke-width="2" stroke-opacity="0.25"/>'
                    '<path id="nft-v2-color" d="M10,17c0-3.866,3.134-7,7-7h433c11.046,0,20,8.9543,20,20v233c0,3.866-3.134,7-7,7h-446c-3.866,0-7-3.134-7-7v-246Z" fill="url(#nft-v2-color-fill)"/>'
                    '<path id="nft-v2-color-light" style="mix-blend-mode:soft-light" d="M10,17c0-3.866,3.134-7,7-7h433c11.046,0,20,8.9543,20,20v233c0,3.866-3.134,7-7,7h-446c-3.866,0-7-3.134-7-7v-246Z" fill="url(#nft-v2-color-light-fill)"/>'
                    '<path id="nft-v2-inner-border" d="M11,17c0-3.3137,2.6863-6,6-6h433c10.493,0,19,8.5066,19,19v233c0,3.314-2.686,6-6,6h-446c-3.3137,0-6-2.686-6-6v-246Z" fill="none" stroke="#000" stroke-width="2" stroke-opacity="0.25"/>',
                    nftParamGenerate.raritySparkle
                )
            );
        }

        {
            SVGImage = string(
                abi.encodePacked(
                    SVGImage,
                    NFTGeneratorSupport.buildTokenId(tokenId),
                    '<g id="nft-v2-chip" transform="translate(25, 195)">',
                    chip
                )
            );
        }

        SVGImage = (
            string(
                abi.encodePacked(
                    SVGImage,
                    '</g>'
                    '<g id="nft-2-0-final-version-1-2-u-logo" transform="matrix(.288901 0 0 0.288901 52.647701 103.448703)">'
                    '<g id="nft-2-0-final-version-1-2-u-1_to" transform="translate(235,50)">'
                    '<g id="nft-2-0-final-version-1-2-u-1_ts" transform="scale(1,1)">'
                    '<path id="nft-2-0-final-version-1-2-u-1" d="M470,100h-470L112.981,0L470,0v100Z" transform="translate(-235,-50)" fill="url(#nft-2-0-final-version-1-2-u-1-fill)"/>'
                    '</g>'
                    '</g>'
                    '<g id="nft-2-0-final-version-1-2-u-2_to" transform="translate(705,50)">'
                    '<g id="nft-2-0-final-version-1-2-u-2_ts" transform="scale(1,1)">'
                    '<path id="nft-2-0-final-version-1-2-u-2" d="M940,100h-470L582.981,0L940,0v100Z" transform="translate(-705,-50)" fill="url(#nft-2-0-final-version-1-2-u-2-fill)"/>'
                    '</g>'
                    '</g>'
                    '<g id="nft-2-0-final-version-1-2-u-3_to" transform="translate(1062.000003,150)">'
                    '<g id="nft-2-0-final-version-1-2-u-3_ts" transform="scale(1,1)">'
                    '<path id="nft-2-0-final-version-1-2-u-3" d="M1297,200h-470L939.981,100h357.019v100Z" transform="translate(-1062,-150)" fill="url(#nft-2-0-final-version-1-2-u-3-fill)"/>'
                    '</g>'
                    '</g>'
                    '<g id="nft-2-0-final-version-1-2-u-4_to" transform="translate(589.431821,250)">'
                    '<g id="nft-2-0-final-version-1-2-u-4_ts" transform="scale(1,1)">'
                    '<path id="nft-2-0-final-version-1-2-u-4" d="M357,200h470L714.019,300L357,300v-100Z" transform="translate(-592,-250)" fill="url(#nft-2-0-final-version-1-2-u-4-fill)"/>'
                    '</g>'
                    '</g>'
                    '</g>',  
                    NFTGeneratorSupport.metalSwapTitle,
                    '</g>'
                    '<g id="nft-v2-clip-group" clip-path="url(#nft-v2-clipping-paths)">',
                    NFTGeneratorSupport.lightWaves,
                    '</g>',
                    NFTGeneratorSupport.buildBorder(
                        nftParamGenerate.rarityBorder
                    ),
                    '<path id="nft-v2-angle" d="M380,0h75c13.807,0,25,11.1929,25,25v75L380,0Z" fill="#232a3a"/>',
                    nftParamGenerate.rarityGem,
                    '</svg>'
                )
            )
        );

        string memory image = Base64.encode(bytes(SVGImage));
        return image;
    }
}
