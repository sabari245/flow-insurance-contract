import "Insurance"

transaction {
    prepare(signer: AuthAccount) {
        Insurance.ClaimPolicy(beneficiary: signer.address, claimAmmount: 5000.0)
    }

    execute {
        log("Successfully claimed the policy of the signer")
    }
}
