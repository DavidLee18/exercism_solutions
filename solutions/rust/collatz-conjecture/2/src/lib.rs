pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }
    let mut m = n;
    let mut res = 0;
    while m != 1 {
        if m % 2 == 0 {
            m /= 2;
        } else {
            m = 3*m + 1;
        }
        res += 1;
    }
    Some(res)
}
