
# EthCA

*Verifiable Trust based on Smart Contracts.*

EthCA is a tool that can help with issuing digital certificates and verifing *hierarchical trust*. Based on smart contracts.

**Trust once, verify everything else**
### How it works

 With EthCA, you can verify the ***chain of trust*** by tracing an address up the chain of previously recorded and verified records on the blockchain. 

Let's say you trust R, who owns address *r*, to be the ***root authority*** and you want to know whether A is telling the truth since A is trusted by someone who owns the address *b*. 

To verify that A is telling the truth, A will first produce a proof that she owns the address *a*. Then by looking up *a* on the blockchain, one can verify that *a* is trusted by *b*, and that *b* is trusted by *c*, and that *c* is trusted by *r*. Since *c* is trusted by *r*, we can deduce that A has ultimately been given trust by R as the chain of trust remains valid.

### How to use


The current test version of the smart contract is live on Ropsten Testnet

Contract Address: `0xE1C07CB890e372E8A0D8d9fB685a6B5bf2ae081e`



