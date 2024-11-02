validator rules {
  spend(_datum: Option<Data>, _redeemer: Data, _utxo_ref: Data, _context: Data) {
    True
  }

  else(_) {
    fail
  }
}

test rules_test() {
  let datum: Data = 1
  rules.spend(Some(datum), 1, 1, 1)
}
