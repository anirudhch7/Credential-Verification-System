# Blockchain-based Credential Verification System

Designed and implemented a decentralized application using Solidity, Truffle, and Ganache to securely issue and verify academic certificates.

- Start Ganache (local blockchain).
- In the root directory, compile and migrate the smart contracts:
```bash
truffle compile
truffle migrate --reset --network development
```

## Testing
Run the smart contract tests using Truffle:
```bash
truffle test
```

## Deployment to Live Network
- Update `truffle-config.js` with the configuration for your desired network (e.g., Ethereum Testnet).
- Deploy contracts using:
```bash
truffle migrate --network <network-name>
```

## Contributing
Feel free to submit issues or pull requests. Contributions are welcome!

## License
This project is licensed under the MIT License.

## Acknowledgments
- [Truffle Suite](https://www.trufflesuite.com/)
- [OpenZeppelin](https://openzeppelin.com/)
