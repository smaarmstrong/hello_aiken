use cardano/assets.{PolicyId}
use cardano/transaction.{Transaction}

// https://aiken-lang.github.io/prelude/aiken.html#Void
validator when_void {
  mint(_redeemer: Void, _policy_id: PolicyId, tx: Transaction) {
    // I missed the logical operator in the lecture -- just going with ==
    tx == policy_id
  }

  else(_) {
    fail
  }
}
