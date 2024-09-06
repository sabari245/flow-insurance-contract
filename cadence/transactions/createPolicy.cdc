import "Insurance"

transaction {
    prepare(signer: AuthAccount) {
        Insurance.CreatePolicy(beneficiary: signer.address, amount: 1000.0)
        log(signer.address)
    }

    execute {
        log("An Policy has been created for the signer")
    }
}
