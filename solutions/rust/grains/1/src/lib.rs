pub fn square(s: u32) -> u64 {
    2u64.pow(s - 1)
}

pub fn total() -> u64 {
    (2u128.pow(64) - 1) as u64
}
