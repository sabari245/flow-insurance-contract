import "Insurance"

transaction {
    prepare(signer: AuthAccount) {
        Insurance.RenevalPolicy(beneficiary: signer.address, amount: 1000.0)
    }

    execute {
        log("successfully renewed the policy of the signer")
    }
}
