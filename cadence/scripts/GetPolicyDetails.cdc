import "Insurance"

pub fun main(account: Address): Insurance.Policy {
  return Insurance.activePolicies[account]!
}