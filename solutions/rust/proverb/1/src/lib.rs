pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 {
        return String::new();
    }
    let mut res: String = list.iter()
        .zip(list.iter().skip(1))
        .map(|(x, y)| format!("For want of a {} the {} was lost.\n", x, y)).collect();
    res.push_str(&format!("And all for the want of a {}.", list[0]));
    res
}
