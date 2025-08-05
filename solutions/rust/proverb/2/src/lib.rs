use std::fmt::Write;

pub fn build_proverb(list: &[&str]) -> String {
    if list.is_empty() {
        return String::new();
    }
    let mut res = list.iter()
        .zip(list.iter().skip(1))
        .fold(String::new(), |mut s, (x, y)| { let _ = write!(s, "For want of a {} the {} was lost.\n", x, y); s });
    res.push_str(&format!("And all for the want of a {}.", list[0]));
    res
}
