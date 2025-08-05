pub fn nth(n: u32) -> u32 {
    (2..)
    .filter(is_prime)
    .nth(n as usize)
    .unwrap_or_else(|| panic!("no {}th prime..?", n))
}

fn is_prime(n: &u32) -> bool {
    for i in 2..*n {
        if n % i == 0 {
            return false;
        }
    }
    true
}
