use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut set = HashSet::new();
    let mut chars: Vec<char> = word.to_lowercase().chars().collect();
    chars.sort();
    let word_: String = chars.iter().collect();

    for &s in possible_anagrams {
        let mut s_: Vec<char> = s.to_lowercase().chars().collect();
        let s__: String = s_.iter().collect();
        s_.sort();
        if word_ == s_.iter().collect::<String>() && word.to_lowercase() != s.to_lowercase() {
            set.insert(s);
        }
    }

    set
}
