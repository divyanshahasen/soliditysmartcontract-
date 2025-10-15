

---

# 📈 AI-Powered Trend Prediction Smart Contract

This Solidity smart contract simulates an **AI-integrated trend prediction system** on-chain. While Solidity cannot execute AI models natively, this design allows **off-chain AI systems** to push their predictions on-chain through a trusted agent.

## 🚀 Features

* 🔮 Predicts market trends: Bearish, Neutral, or Bullish
* ✅ No imports
* ✅ No constructors
* ✅ No input fields
* 🧠 Simulates AI prediction logic using block data (for demo purposes)
* 🔐 Restricts updates to a trusted AI agent address
* 📡 Supports integration with real off-chain AI systems

---

## 📜 Contract Overview

### 🔧 Initialization

```solidity
function initializeAgent() public
```

* Sets the `msg.sender` as the AI agent.
* Can only be called once.

### 🔁 Update Trend

```solidity
function updateTrend() public onlyAgent
```

* Callable only by the AI agent.
* Internally calls `_simulateAI()` (or, in production, would use real off-chain data).
* Emits a `TrendUpdated` event with the new trend and timestamp.

### 🔍 View Current Trend

```solidity
function currentTrend() public view returns (string memory trend, uint256 updatedAt)
```

* Returns the latest predicted trend as a label (`"Bearish"`, `"Neutral"`, `"Bullish"`) and the last update timestamp.

---

## 📊 Trend Types

| Code | Label   |
| ---- | ------- |
| 0    | Bearish |
| 1    | Neutral |
| 2    | Bullish |

---

## 🧪 Development / Testing

Since real AI can't run on-chain, the contract uses a simulated AI prediction:

```solidity
function _simulateAI() internal view returns (uint8)
```

You can test behavior on local testnets like Hardhat or Remix.

---

## 🤖 Real AI Integration (Optional)

To connect real AI predictions:

1. **Deploy the contract**
2. **Call `initializeAgent()` from a trusted off-chain wallet**
3. **Use off-chain AI (Python, ML model, etc.)** to:

   * Predict a trend (0, 1, or 2)
   * Trigger a transaction calling `updateTrend()` from the AI agent address

> For automation, use tools like **Chainlink Functions**, **Gelato**, or **custom bots**.
> 0xd9145CCE52D386f254917e481eB44e9943F39138

---

## 🛡 Security Considerations

* Only the assigned AI agent can push updates.
* The `initializeAgent()` function can only be called once to prevent re-assignment.
* The `updateTrend()` logic is deliberately simple and should be extended for production use (e.g. signature verification, oracle integration).

---

## 📄 License

MIT License

---


