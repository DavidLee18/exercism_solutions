pub fn is_armstrong_number(num: u32) -> bool {
    let n = ((num as f32).log10() + 1.0) as u32;

    let mut num_ = num;
    let mut sum: u64 = 0;

    while num_ > 0 {
        let d = num_ / 10;
        let m = num_ % 10;
        sum += m.pow(n) as u64;
        num_ = d;
    }

    sum == num as u64
}
