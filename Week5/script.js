const { ethers } = require("ethers");
require("dotenv").config();


const rpcProvider = new ethers.providers.JsonRpcProvider(process.env.myAlchemyURL);
const privateKey = process.env.myPrivateKey;


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
const myWallet = new ethers.Wallet(privateKey, rpcProvider);


const testTransfer = async() => {
	const tokenWithWallet = tokenContract.connect(myWallet);
	const tx = await tokenWithWallet.transfer("0x24298982ebc02AFf67349482eC1FF8987619b433", 40000);
	const balance = await tokenWithWallet.balanceOf("0x24298982ebc02AFf67349482eC1FF8987619b433");
	console.log(balance);
}


const getTokenName = async() => {
	let tokenName = await tokenContract.name();
	console.log(tokenName);
}
	
const getTokenSymbol = async() => {
	let tokenSymbol = await tokenContract.symbol();
	console.log(tokenSymbol);
}

const getTotalSupply = async() => {
	let totalSupply = await tokenContract.totalSupply();
	console.log(totalSupply);
}

getTokenName();
testTransfer();
