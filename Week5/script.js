const { ethers } = require("ethers");

const rpcProvider = new ethers.providers.JsonRpcProvider("https://eth-goerli.g.alchemy.com/v2/VlnGYOxJ5P_t_UGpT-ThXoPszJ4E_gSw");
//const rpcSigner = rpcProvider.getSigner();

/*const main = async() => {
	let blockNum;
	blockNum = await rpcProvider.getBlockNumber();
	console.log(blockNum);
}*/
const tokenAddress = "0xd56083a53553b495a7ec0c5a8481fe6b81dc3b61";
const tokenABI = [
	"function name() view returns (string)",
	"function symbol() view returns(string)",
	"function decimals() view returns(uint)",
	"function totalSupply() external view returns(uint)",
	"function balanceOf(address) external view returns(uint)",
	"function transfer(address to, uint256 amount) external returns(bool)"
]

const tokenContract = new ethers.Contract(tokenAddress, tokenABI, rpcProvider);
const main = async() => {
	let tokenName = await tokenContract.name();
	console.log(tokenName);

	let tokenSymbol = await tokenContract.symbol();
	console.log(tokenSymbol);

	let totalSupply = await tokenContract.balanceOf("0xd3fa22780f4b73564044dd9f6b4529812cc15306");
	ethers.utils.formatUnits(totalSupply, 18)
	console.log(totalSupply);

}

main();