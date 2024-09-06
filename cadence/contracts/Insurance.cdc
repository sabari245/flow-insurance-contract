pub contract Insurance {
    pub struct Policy {
        pub var beneficiary: Address
        pub var amount: UFix64
        pub var isClaimedBefore: Bool

        pub init(beneficiary: Address, amount: UFix64) {
            self.beneficiary = beneficiary
            self.amount = amount
            self.isClaimedBefore = false
        }

        pub fun ClaimPolicy() {
            self.isClaimedBefore = true
        }

        pub fun UnClaimPolicy() {
            self.isClaimedBefore = false
        }

        pub fun addAmount(amount: UFix64) {
            self.amount = self.amount + amount
        }
    }

    pub var activePolicies: {Address: Policy}
    pub var maximumClaimAmount: UFix64

    pub init() {
        self.activePolicies = {}
        self.maximumClaimAmount = 10000.0
    }

    pub fun CreatePolicy(beneficiary: Address, amount: UFix64) {
        let policy = Policy(beneficiary: beneficiary, amount: amount)
        self.activePolicies[beneficiary] = policy
    }

    pub fun GetPolicyDetails(beneficiary: Address): Policy {
        return self.activePolicies[beneficiary]!
    }

    pub fun ClaimPolicy(beneficiary: Address, claimAmmount: UFix64) {
        pre {
            self.activePolicies[beneficiary] != nil: "Policy does not exist"
            !self.activePolicies[beneficiary]!.isClaimedBefore: "Policy already claimed"
            self.maximumClaimAmount >= claimAmmount: "Claim amount exceeds maximum claim amount"
        }

        self.activePolicies[beneficiary]!.ClaimPolicy()
    }

    pub fun RenevalPolicy(beneficiary: Address, amount: UFix64) {
        pre {
            self.activePolicies[beneficiary] != nil: "Policy does not exist"
        }

        self.activePolicies[beneficiary]!.UnClaimPolicy()
        self.activePolicies[beneficiary]!.addAmount(amount: amount)
    }
}