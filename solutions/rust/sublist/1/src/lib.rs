use std::cmp::Ordering;

#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.is_empty(), second_list.is_empty()) {
        (true, true) => Comparison::Equal,
        (true, false) => Comparison::Sublist,
        (false, true) => Comparison::Superlist,
        (false, false) => match first_list.len().cmp(&second_list.len()) {
            std::cmp::Ordering::Less => {
                for i in 1..=(second_list.len() - first_list.len()) {
                    let c = second_list.iter().skip(i).take(first_list.len());
                    if c.clone().zip(first_list.iter()).all(|(x, y)| *x == *y) && c.zip(first_list.iter()).count() > 0 {
                        return Comparison::Sublist;
                    }
                }
                for i in 1..=(second_list.len() - first_list.len()) {
                    let c = second_list.iter().rev().skip(i).take(first_list.len()).rev();
                    if c.clone().zip(first_list.iter()).all(|(x, y)| *x == *y) && c.zip(first_list.iter()).count() > 0 {
                        return Comparison::Sublist;
                    }
                }
                Comparison::Unequal
            },
            std::cmp::Ordering::Equal => if first_list.iter().zip(second_list.iter()).all(|(x, y)| *x == *y) && first_list.iter().zip(second_list.iter()).count() > 0 {
                Comparison::Equal
            } else { Comparison::Unequal },
            std::cmp::Ordering::Greater => {
                for i in 1..=(first_list.len() - second_list.len()) {
                    let c = first_list.iter().skip(i).take(second_list.len());
                    if c.clone().zip(second_list.iter()).all(|(x, y)| *x == *y) && c.zip(second_list.iter()).count() > 0 {
                        return Comparison::Superlist;
                    }
                }
                for i in 1..=(first_list.len() - second_list.len()) {
                    let c = first_list.iter().rev().skip(i).take(second_list.len()).rev();
                    if c.clone().zip(second_list.iter()).all(|(x, y)| *x == *y) && c.zip(second_list.iter()).count() > 0 {
                        return Comparison::Superlist;
                    }
                }
                Comparison::Unequal
            },
        },
    }
}
