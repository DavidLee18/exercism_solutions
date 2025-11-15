pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let fs = factors.iter().filter(|&&f| f != 0).collect::<Vec<_>>();
    let mut res = 0;
    for i in 1..limit {
        for j in &fs {
            if i % *j == 0 {
                res += i;
                break;
            }
        }
    }
    res
}
