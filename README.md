# TrustCast Protocol

A Bitcoin-secured SocialFi protocol built on Stacks Layer 2 that empowers creators and curators with on-chain reputation and BTC-backed rewards.

## Overview

TrustCast is a decentralized social reputation and content monetization protocol designed for content creators and curators. Users stake tokens to publish content, vote to earn rewards, and build social capital through high-quality content creation and curation. The protocol enforces fairness through programmable reputation systems and Sybil resistance mechanisms.

## Key Features

- **Programmable Reputation System**: On-chain reputation scoring based on content quality and community engagement
- **Staking-Based Publishing**: Content creators must stake STX tokens to publish, ensuring quality commitment
- **Weighted Voting**: Vote influence based on reputation score and stake amount
- **Transparent Rewards**: BTC-denominated rewards distributed based on content quality metrics
- **Social Following**: Build networks and influence through follower relationships
- **Admin Governance**: Contract owner controls for protocol management and emergency functions

## System Architecture

### Core Components

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   User Layer    │    │  Content Layer   │    │  Voting Layer   │
│                 │    │                  │    │                 │
│ • Registration  │◄──►│ • Content Hash   │◄──►│ • Vote Records  │
│ • Staking       │    │ • Metadata       │    │ • Vote Weight   │
│ • Following     │    │ • Quality Score  │    │ • Timestamps    │
│ • Reputation    │    │ • Reward Status  │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌──────────────────┐
                    │ Reward Pool &    │
                    │ Distribution     │
                    │                  │
                    │ • STX Pool       │
                    │ • Claim Logic    │
                    │ • Fee Structure  │
                    └──────────────────┘
```

### Contract Architecture

The protocol consists of several interconnected data structures:

**User Management**

- User profiles with reputation scores, stake amounts, and activity metrics
- Registration system with initial reputation allocation
- Verification system for trusted users

**Content System**

- Content creation with metadata and stake backing
- Quality scoring based on community voting
- Reward distribution mechanism

**Voting Mechanism**

- Weighted voting based on reputation and stake
- Anti-spam measures preventing self-voting and duplicate votes
- Vote tracking with timestamps and weights

**Economic Layer**

- STX token staking and unstaking
- Reward pool management
- Platform fee collection

## Data Flow

### Content Creation Flow

```
User Stakes STX → Creates Content → Content Published → Community Votes → Quality Score Calculated → Rewards Distributed
```

### Reputation Update Flow

```
User Action → Reputation Change Calculated → User Profile Updated → Reputation History Recorded
```

### Voting Flow

```
User Initiates Vote → Stake/Reputation Verified → Vote Weight Calculated → Content Score Updated → Creator Reputation Adjusted
```

## Core Functions

### User Functions

- `register-user()`: Create new user profile with initial reputation
- `stake-tokens(amount)`: Stake STX tokens to increase voting power
- `unstake-tokens(amount)`: Withdraw staked tokens
- `follow-user(user)`: Follow another user
- `unfollow-user(user)`: Unfollow a user

### Content Functions

- `create-content(hash, title, category, stake)`: Publish new content with stake backing
- `vote-content(content-id, positive)`: Vote on content (upvote/downvote)
- `claim-content-rewards(content-id)`: Claim earned rewards for content

### Administrative Functions

- `set-contract-enabled(enabled)`: Enable/disable contract functionality
- `set-min-stake-amount(amount)`: Adjust minimum staking requirements
- `verify-user(user)`: Verify users and boost their reputation
- `emergency-withdraw(amount)`: Emergency fund withdrawal

## Getting Started

### Prerequisites

- Stacks wallet with STX tokens
- Understanding of Clarity smart contracts
- Familiarity with Stacks blockchain

### Deployment

1. Deploy the contract to Stacks testnet/mainnet
2. Initialize minimum stake amount and platform parameters
3. Add initial funds to reward pool
4. Enable contract functionality

### Usage

1. **Register**: Call `register-user()` to create your profile
2. **Stake**: Use `stake-tokens()` to increase your influence
3. **Create**: Publish content with `create-content()`
4. **Vote**: Participate in content curation with `vote-content()`
5. **Earn**: Claim rewards with `claim-content-rewards()`

## Economic Model

### Staking Requirements

- Minimum stake: 1 STX (configurable)
- Content creation requires active stake
- Voting power increases with stake amount

### Reputation System

- Starting reputation: 100 points
- Reputation affects voting weight and trust score
- Reputation changes based on content quality and voting behavior

### Reward Distribution

- Quality-based rewards from community pool
- Platform fee: 0.5% (configurable)
- Rewards claimed by content creators

## Security Features

- **Sybil Resistance**: Staking requirements prevent spam accounts
- **Self-Interaction Prevention**: Users cannot vote on own content or follow themselves
- **Cooldown Mechanisms**: Prevent rapid-fire actions
- **Input Validation**: Comprehensive validation of all user inputs
- **Emergency Controls**: Admin functions for protocol management

## Technical Specifications

- **Language**: Clarity (Stacks smart contract language)
- **Blockchain**: Stacks Layer 2
- **Security**: Bitcoin-secured through Stacks consensus
- **Token Standard**: STX native token
- **Gas Optimization**: Efficient data structures and function design

## Development

### Testing

Comprehensive testing should cover:

- User registration and staking flows
- Content creation and voting mechanics
- Reputation calculation accuracy
- Reward distribution logic
- Edge cases and error conditions

### Monitoring

Key metrics to monitor:

- Total value locked (TVL)
- Active user count
- Content creation rate
- Voting participation
- Reward distribution efficiency

## License

This project is licensed under the MIT License.

## Support

For technical support and development inquiries, please refer to the Stacks documentation and community resources.
