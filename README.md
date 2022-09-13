[![Cred][cred-shield]][cred-url]
[![Cred Protocol API][cred-api-shield]][cred-api]
[![Cred Protocol on LinkedIn][linkedin-shield]][linkedin-url]
[![Cred Protocol on Twitter][cred-twitter-shield]][cred-twitter]
[![Cred Protocol on Github][cred-github-shield]][cred-github]

<div align="center">
<h1>Cred Protocol Chainlink Requester</h1>
</div>

##  📖 What is the aim of this repository?

You can use this repo to integrate with our Cred Score oracle on-chain in a few easy steps.

This allows you to provide a quantification of creditworthiness for any wallet - leveraging the machine learning models we have developed over the last year to power this score. Once integrated, the continual improvements we make to this score will automatically benefit your application without any further work required on your end. Happy buidling!

## 💡 How does it work?

In this repo, you can find a `Requester` smart contract which can be deployed on-chain where it can create a fetch request to our oracle and get your Cred score on-chain.
The whole background process is automatic and there is only a couple of steps explained in more detail in the rest of this README.

##  ⛓️ What chain is this supported by?

For now, our code is supported by Arbitrum Rinkeby. 
We plan to switch to Arbitrum Goerli right after Chainlink starts supporting that testnet and we will also deploy on Arbitrum One in the near future.

##  🔨️ How to use the Cred Protocol Chainlink Requester
###  🚁 Smart contract deployment
Open up our repo in Remix:

<add_link>

1. On the Compile tab, click the Compile button for `Requester.sol`. Remix automatically selects the compiler version and language from the pragma line in the smart contract unless you select a specific version manually.
2. On the Deploy and Run tab, configure the following settings:
   1. Select "Injected Provider" as your Environment. The Javascript VM environment cannot access your oracle node. 
   2. Select the `Requester` contract from the Contract menu.
3. Click Deploy. MetaMask prompts you to confirm the transaction.
4. After you deploy the contract, a link to Etherscan displays at the bottom. Open that link in a new tab to keep track of the transaction.
5. If the transaction is successful, a new address displays in the Deployed Contracts section.

###  ✋ Request your Cred score

In order to get the request fulfilled, you need to send some LINK to your smart contract.
One request is 0.1 LINK so the amount is up to you - it works like a top-up phone, you can pay for your requests in advance. 
If you try to request your Cred score and the smart contract does not have enough LINK, it will give you a gasEstimation error.
The address of the smart contract can be found in the Deployed Contracts section - you can copy it into your clipboard from there.

You can learn how to get LINK testnet tokens in your Metamask in the first guide of our Cred Oracle Integration series: 
https://credprotocol.medium.com/how-to-get-arbitrum-testnet-eth-and-other-tokens-in-5-minutes-28b6851cb4af.

In Remix, call the `requestCredScore` function and sign the transaction in your MetaMask.
After you see a successful transaction message in Remix, the background process have started and you should have your score on-chain soon.  

###  📚 Read your Cred score
(Wait for around 30 seconds from the point when the ``requestCredScore`` function was successfully called - it takes some time to pass the information to the API, wait for the response and to put that response back on chain)
After waiting, click on 'currentScore' and your Cred score should be visible on-chain.

If your Cred score is 0, there are several reasons that might be causing this:
- your wallet has 0 transactions, or
- your Cred score has not updated yet to the chain
- general error of our endpoint

You can check your Cred score for free at https://app.credprotocol.com/ and that can help you double check whether the value on-chain is correct. 


[linkedin-shield]: https://img.shields.io/badge/-Cred%20Protocol-335EEB?&logo=linkedin&style=for-the-badge&labelColor=414141
[linkedin-url]: https://www.linkedin.com/company/credprotocol/
[cred-shield]: https://img.shields.io/badge/Sign%20up-Cred%20Protocol%20Beta-335EEB?style=for-the-badge&labelColor=414141
[cred-shield2]: https://img.shields.io/badge/Stay%20Up%20To%20Date%20With-Cred%20Protocol%20Beta-414141?style=for-the-badge&labelColor=414141
[cred-url]: https://credprotocol.typeform.com/cred-waitlist?utm_source=github
[cred-api-shield]: https://img.shields.io/badge/DOCS-Cred%20Protocol%20API-335EEB?style=for-the-badge&labelColor=414141
[cred-api]: https://beta.credprotocol.com/docs/api?utm_source=github
[cred-twitter-shield]: https://img.shields.io/badge/-@Cred__Protocol-335EEB?&logo=twitter&style=for-the-badge&logoColor=white&labelColor=414141
[cred-twitter]: https://twitter.com/cred_protocol
[cred-github-shield]: https://img.shields.io/badge/-credprotocol-335EEB?&logo=github&style=for-the-badge&logoColor=white&labelColor=414141
[cred-github]: https://github.com/credprotocol
[cred-sample]: https://github.com/credprotocol/health-factor-dataset/blob/main/data/0x01acb3804ba9c42111c6e9c127831eb486ca1ac7.csv
[cred-sample-shield]: https://img.shields.io/badge/Browser%20View-Aave%20Health%20Factor%20Sample%20Dataset-335EEB?style=for-the-badge&labelColor=414141
[cred-full]: https://bit.ly/aave-health-factor-dataset
[cred-full-shield]: https://img.shields.io/badge/Dropbox-Aave%20Health%20Factor%20Complete%20Dataset-335EEB?style=for-the-badge&labelColor=414141&logo=dropbox&logoColor=white
[cred-sample2]: https://bit.ly/aave-health-factor-dataset-sample
[cred-sample-shield2]: https://img.shields.io/badge/Dropbox-Aave%20Health%20Factor%20Sample%20Dataset-335EEB?style=for-the-badge&labelColor=414141&logo=dropbox&logoColor=white
[cred-sample3]: https://drive.google.com/uc?export=download&id=1nzDJ6T51avrOexboV1ZARUNEg1g--KlE
[cred-sample-shield3]: https://img.shields.io/badge/Download%20Link-Aave%20Health%20Factor%20Sample%20Dataset-335EEB?style=for-the-badge&labelColor=414141
