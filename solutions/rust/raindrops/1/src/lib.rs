pub fn raindrops(n: u32) -> String {
    if n % 3 != 0 && n % 5 != 0 && n % 7 != 0 { return format!("{}", n); }
    let mut res = String::new();
    if n % 3 == 0 {
        res.push_str("Pling");
    } if n % 5 == 0 {
        res.push_str("Plang");
    } if n % 7 == 0 {
        res.push_str("Plong");
    }
    res
}
