
const { ethers } = require("hardhat")

async function main() {
  const BoardApe = await ethers.getContractFactory("BoardApeYatchClub")
  const boardape = await BoardApe.deploy("BoardApeYatchClub", "BAYC")

  try {
    await boardape.deployed()
    console.log(`Success! Contract deployed to ${boardape.address}`)
  } catch(err) {
    console.log(`deployment error: ${err.message}`)
  }
  
  // CID from Pinata for json metadata file
  try {
    const newItemId = await boardape.mint("https://ipfs.io/ipfs/QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/1022")
    console.log(`NFT succesfully minted! :::: ${newItemId}`)
  } catch(err) {
    console.log(`minting error: ${err.message}`)
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  });
