pub fn annotate(minefield: &[&str]) -> Vec<String> {
    minefield
    .iter()
    .enumerate()
    .map(|(i, l)| annonate_(l, i.checked_sub(1).and_then(|i_| minefield.get(i_).copied()), minefield.get(i+1).copied()))
    .collect()
}

fn annonate_(line: &str, before: Option<&str>, after: Option<&str>) -> String {
    let mut cs: Vec<char> = line.chars().collect();
    for (i, c) in line.char_indices() {
        if c == ' ' {
            let mut j = 0;
            if let Some(a) = i.checked_sub(1).and_then(|i_| line.chars().nth(i_)) {
                if a == '*' { j += 1; }
            }
            if let Some(b) = line.chars().nth(i+1) {
                if b == '*' { j += 1; }
            }
            if let Some(before_) = before {
                if let Some(b_) = i.checked_sub(1).and_then(|i_| before_.chars().nth(i_)) {
                    if b_ == '*' { j += 1; }
                }
                if let Some(b_) = before_.chars().nth(i) {
                    if b_ == '*' { j += 1; }
                }
                if let Some(b_) = before_.chars().nth(i+1) {
                    if b_ == '*' { j += 1; }
                }
            }
            if let Some(after_) = after {
                if let Some(b_) = i.checked_sub(1).and_then(|i_| after_.chars().nth(i_)) {
                    if b_ == '*' { j += 1; }
                }
                if let Some(a_) = after_.chars().nth(i) {
                    if a_ == '*' { j += 1; }
                }
                if let Some(a_) = after_.chars().nth(i+1) {
                    if a_ == '*' { j += 1; }
                }
            }
            if j > 0 { cs[i] = char::from_digit(j, 10).unwrap(); }
        }
    }
    cs.into_iter().collect()
}