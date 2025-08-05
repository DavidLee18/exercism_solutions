/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    if code.len() <= 1 || code.chars().any(|c| !c.is_digit(10) && c != ' ') { return false; }
    let mut xs = Vec::new();

    if code.trim() != code { return false; }

    for cs in code.split(' ') {
        for c in cs.chars() {
            xs.push(c.to_digit(10).unwrap());
        }
    }

    for (i, x) in xs.iter_mut().rev().enumerate() {
        if i % 2 == 1 {
            *x *= 2;
            if *x > 9 { *x -= 9; }
        }
    }

    xs.iter().sum::<u32>() % 10 == 0
}
