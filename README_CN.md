# STProof Protocol（时空确权协议）
通用链上事件确权与价值捕获协议

## 概述
STProof（时空确权）是一套面向「事件」的通用链上确权与价值捕获协议，以平权为核心，重新定义链上事实存证的底层逻辑。我们致力于打破传统链上确权以“资产”为核心的局限，回归“事实”本身，让每一个客观发生的事件都能实现低成本、不可篡改、可交叉验证的链上存证，成为Web3世界的“重型事实层”基础设施。

## 核心理念
1.  确权对象：唯事件 — 统一以「客观发生的历史事件」为确权核心，而非传统的资产/代币，回归事实本身的价值。
2.  核心理念：平权存证 — 事实记录无资金门槛，任何人只需支付Gas费即可铸造Event NFT，人人都能成为事实的见证者。
3.  价值机制：引用税 — 事件价值不依赖炒作，而是由被相信、被使用的次数决定，引用越多，价值越高。
4.  生态定位：重型事实层 — 专注高价值重型事实锚定，需多源证据、物理验证，成为Web3世界的「事实基础设施」。

### 补充说明
- 核心口号：不确权物，只确权事；凡发生，皆可存；凡存证，皆可信。
- 技术支撑：OTS时间戳 + IPFS双链锚定，实现零知识思想确权与永久存证。

## 智能合约（Sepolia 测试网）

### 当前版本（v6.1）
- **合约地址**：`0x0253f6771De9089f9dF50Ef1ed124Dd815A4a07F`
- **浏览器**：[https://sepolia.etherscan.io/address/0x0253f6771De9089f9dF50Ef1ed124Dd815A4a07F](https://sepolia.etherscan.io/address/0x0253f6771De9089f9dF50Ef1ed124Dd815A4a07F)
- **功能**：动态证据链、引用税（70/28/2）、EIP-2981 版税

### 历史版本（v5.2）
- **合约地址**：`0x037eb54EF9dae9A2Ae33bFB9ba170F1067B925CB`
- **浏览器**：[https://sepolia.etherscan.io/address/0x037eb54EF9dae9A2Ae33bFB9ba170F1067B925CB](https://sepolia.etherscan.io/address/0x037eb54EF9dae9A2Ae33bFB9ba170F1067B925CB)
- **说明**：已归档，新项目请使用 v6.1 版本。

## 创世 NFT（Polygon 链）
- 合约地址：`0x3d36ef7fdec04e2d53822052f5271b27d7b472b0`
- OpenSea 合集: https://opensea.io/collection/stproof-genesis-event
- 标准：ERC721
- 总量：100
- 已铸造：2
- 描述：这是STProof生态的创世NFT系列，每一枚都是由赛博朋克美学与区块链级完整性共同铸造的数字文物，代表用户在STProof宇宙中的早期权益。

## 实验与存证
所有实验证据已锚定IPFS，可永久验证、不可篡改，完整CID清单见项目目录 `/genesis-nft/cids.json`，核心实验包括：
1.  自指证明实验（STProof v5.2核心实验）
2.  真人跨境实验

## 项目结构
- `/` — 官网与主页面（含创世NFT板块）
- `/genesis-nft/` — 创世NFT合约信息、元数据、实验CID存证
- `/cases/` — 各类实验案例详情（有实物、无实物、混合事件）
- `/docs/` — 白皮书 v5.2（中文版本）

## 官方链接
- 官网：https://stproof.org
- GitHub：https://github.com/dule-123/stproof
- 白皮书 v5.2（中文）: 详见 `/docs/` 目录
- OpenSea 创世NFT合集: https://opensea.io/collection/stproof-genesis-event

## 开源协议
MIT License（详见项目根目录 `LICENSE` 文件）

## 贡献指南
我们欢迎开发者、研究者、社区成员参与贡献，具体贡献方式与规则详见项目根目录 `CONTRIBUTING.md` 文件。

## 专利与合规声明
本项目所有技术设计、白皮书、代码及文档均完全公开。
任何基于STProof的技术方案均不再具备新颖性，不可申请专利。
发明人自愿放弃所有相关专利权。
本项目永久开放，供社区自由使用、修改及分发。

---
