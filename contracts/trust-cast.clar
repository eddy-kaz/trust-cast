;; TrustCast - Decentralized Social Reputation & Content Monetization Protocol
;; A Bitcoin-secured SocialFi protocol on Stacks Layer 2
;;
;; Summary:
;; TrustCast empowers creators and curators with on-chain reputation and BTC-backed rewards.
;; Stake to publish, vote to earn, and build social capital through high-quality content.
;;
;; Description:
;; TrustCast is a decentralized social reputation and monetization protocol designed 
;; for content creators and curators. Built on Stacks and secured by Bitcoin, it introduces 
;; programmable reputation, staking-based engagement, and transparent reward distribution.
;; Users earn trust and BTC-denominated rewards through content quality, peer validation, 
;; and platform interaction. The protocol includes mechanisms for on-chain voting, staking, 
;; following, and administrative governance, while enforcing fairness and Sybil resistance.

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-insufficient-funds (err u103))
(define-constant err-unauthorized (err u104))
(define-constant err-invalid-amount (err u105))
(define-constant err-self-interaction (err u106))
(define-constant err-already-voted (err u107))
(define-constant err-invalid-score (err u108))
(define-constant err-stake-required (err u109))
(define-constant err-cooldown-active (err u110))
(define-constant err-invalid-input (err u111))

;; Data variables
(define-data-var contract-enabled bool true)
(define-data-var min-stake-amount uint u1000000) ;; 1 STX in microSTX
(define-data-var reputation-multiplier uint u100)
(define-data-var content-reward-pool uint u0)
(define-data-var platform-fee-rate uint u50) ;; 0.5% (50/10000)

;; Data maps
(define-map users
  principal
  {
    reputation-score: uint,
    total-content: uint,
    total-earnings: uint,
    stake-amount: uint,
    last-action-block: uint,
    verified: bool,
    join-block: uint,
  }
)

(define-map content
  uint
  {
    creator: principal,
    content-hash: (string-ascii 64),
    title: (string-utf8 100),
    category: (string-ascii 20),
    timestamp: uint,
    total-votes: uint,
    positive-votes: uint,
    quality-score: uint,
    reward-claimed: bool,
    stake-backing: uint,
  }
)

(define-map votes
  {
    content-id: uint,
    voter: principal,
  }
  {
    vote-type: bool, ;; true for upvote, false for downvote
    stake-weight: uint,
    timestamp: uint,
  }
)

(define-map user-following
  {
    follower: principal,
    following: principal,
  }
  bool
)

(define-map reputation-history
  {
    user: principal,
    block: uint,
  }
  {
    old-score: uint,
    new-score: uint,
    reason: (string-ascii 50),
  }
)