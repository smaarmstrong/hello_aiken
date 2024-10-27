use aiken/crypto.{VerificationKeyHash}
use cardano/assets.{Lovelace}

// https://aiken-lang.org/language-tour/primitive-types
test integer() {
  let i: Int = 5
  let n = 6

  // 1 ADA = 1 million Lovelace
  let ada: Lovelace = 2_000_000

  // 255
  let h = 0xff

  and {
    i == 5,
    n == 6,
    ada == 2_000_000,
    h == 255,
    // plus
    i + n == 11,
    h + i == 260,
    // subtraction:
    n - i == 1,
    h - i == 250,
    // multiplication:
    i * n == 30,
    2 * h == 510,
    // division:
    i / n == 0,
    n / i == 1,
    // remainder:
    1 % 5 == 1,
    3 % 5 == 3,
    5 % 5 == 0,
    // comparison:
    5 > 3,
    3 < 5,
    5 >= 3,
    5 >= 5,
    3 <= 3,
    5 <= 5,
  }
}

test bytearray() {
  // Type annotation: Optional as long as Aiken can infer the value type
  // let abc: ByteArray = "abc"
  // let def: "def"

  let h = #"abcd"
  let i = "abcd"

  trace @"h": h
  trace @"i": i

  let pkh: VerificationKeyHash = #"00000000000000000000000000"
  let not_pkh: VerificationKeyHash = "00000000000000000000000000"
  trace @"pkh": pkh
  trace @"not_pkh": not_pkh

  let example = #[0x61, 0x62, 0x63]
  example == "abc"
}

test bool() {
  let yes: Bool = True
  let no = False

  and {
    no == False,
    yes && True,
    yes || no,
    or {
      yes,
      no,
    },
    yes?,
    !no?,
  }
}

test tuple() {
  let t2: (Int, Int) = (5, 7)

  let tz = (5, 7, 8, 9, 10)
  let t3: (Int, ByteArray) = (5, "abc")
  let t4 = (5, "abc", True)

  trace @"debug": tz, t3, t4

  // destructuring (pattern-matching)
  let (_a, b) = t2
  t2.2nd == b
}

// lists are stricter about types than tuples
test list() {
  let ls: List<Int> = [1, 2, 3]
  let ms = [4, 5, 6]
  let bs = ["abc", "def"]

  trace @"debug": ls, ms, bs

  let lls = [0, ..ls]
  lls == [0, 1, 2, 3]
  // let mms = [..ms, 7]
  // let bbs = ["123", ..bs, "zzz"]
}

// Strings
// trace @"STRING LABEL"
// todo @"TODO"
// fail @"ERROR"

// pub fn stub() {
//   todo @"I'll do this later"
// }

// pub fn exception(i: Int) {
//     if i == 0 {
//         fail @"Invalid value"
//     } else {
//         True
//     }
// }

test option() {
  let someone: Option<Int> = Some(1)
  let nobody = None
  let is_someone =
    when someone is {
      Some(_) -> True
      None -> False
    }

  let is_nobody =
    when nobody is {
      Some(_) -> False
      None -> True
    }

  is_someone || is_nobody
}

test data() {
  // Typecasting
  // - Upcasting
  // - Downcasting

  // Upcasting: from specific data type -> Data
  let i: Int = 7
  let di: Data = i

  // Upcasting
  let a = "abc"
  let da: Data = a

  // Downcasting: from a Data -> specific type
  expect downcast_i: Int = di
  expect downcast_a: ByteArray = da

  and {
    i == downcast_i,
    a == downcast_a,
  }

  True
}
