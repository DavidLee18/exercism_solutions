#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    NotEnoughPinsLeft,
    GameComplete,
}

#[derive(Debug)]
enum Score {
    Open(u16, u16),
    Spare(u16),
    Strike,
    Final(u16, u16, Option<u16>)
}

#[derive(Debug)]
pub struct BowlingGame {
    temp_score: Option<u16>,
    scores: Vec<Score>
}

use std::cmp::Ordering;

impl BowlingGame {
    pub fn new() -> Self {
        Self { temp_score: None, scores: Vec::new() }
    }

    pub fn roll(&mut self, pins: u16) -> Result<(), Error> {
        match (self.scores.len(), &self.temp_score, pins) {
            (_, _, 11..=u16::MAX) => Err(Error::NotEnoughPinsLeft),
            (10, None, _) => Err(Error::GameComplete),
            (10, Some(_), _) => match self.scores.get_mut(9).expect("vec's length is 10 and there's no 10th element?") {
                Score::Final(10, 10, c@None) => {
                    *c = Some(pins);
                    self.temp_score = None;
                    Ok(())
                }
                Score::Final(10, b, c@None) if pins + *b <= 10 => {
                    *c = Some(pins);
                    self.temp_score = None;
                    Ok(())
                },
                Score::Final(10, _, None) => Err(Error::NotEnoughPinsLeft),
                Score::Final(a, b, c@None) => match (*a + *b).cmp(&10) {
                    Ordering::Less => if *a + *b + pins > 10 { Err(Error::NotEnoughPinsLeft) } else {
                        *c = Some(pins);
                        self.temp_score = None;
                        Ok(())
                    },
                    Ordering::Equal => {
                        // spare
                        *c = Some(pins);
                        self.temp_score = None;
                        Ok(())
                    },
                    Ordering::Greater => Err(Error::NotEnoughPinsLeft),
                },
                _ => panic!("10th element is not Score::Final"),
            },
            (9, None, _) => { self.temp_score = Some(pins); Ok(()) },
            (9, Some(s), _) => {
                self.scores.push(Score::Final(*s, pins, None));
                if pins + s < 10 { self.temp_score = None; }
                Ok(())
            },
            (0..=8, Some(s), _) => match (pins + s).cmp(&10) {
                Ordering::Less => {
                    self.scores.push(Score::Open(*s, pins));
                    self.temp_score = None;
                    Ok(())
                },
                Ordering::Equal => {
                    self.scores.push(Score::Spare(*s));
                    self.temp_score = None;
                    Ok(())
                },
                Ordering::Greater => Err(Error::NotEnoughPinsLeft),
            },
            (0..=8, None, 10) => { self.scores.push(Score::Strike); Ok(()) },
            (0..=8, None, 0..=9) => { self.temp_score = Some(pins); Ok(()) },
            (_, _, _) => panic!("rounds exceed 10")
        }
    }

    pub fn score(&self) -> Option<u16> {
        match (self.scores.len(), self.temp_score) {
            (10, None) => Some(self.scores.iter().enumerate().map(|(i, _)| Self::score_(&self.scores, i)).sum()),
            _ => None
        }
    }

    fn score_(v: &[Score], i: usize) -> u16 {
        let s = &v[i];

        match s {
            Score::Open(a, b) => a + b,
            Score::Spare(_) => 10 + match v.get(i+1) {
                Some(Score::Open(a, _)) => *a,
                Some(Score::Spare(a)) => *a,
                Some(Score::Strike) => 10,
                Some(Score::Final(a, _, _)) => *a,
                None => 0,
            },
            Score::Strike => 10 + match v.get(i+1) {
                Some(Score::Open(a, b)) => a + b,
                Some(Score::Spare(_)) => 10,
                Some(Score::Strike) => 10 + match v.get(i+2) {
                    Some(Score::Open(a, _)) => *a,
                    Some(Score::Spare(a)) => *a,
                    Some(Score::Strike) => 10,
                    Some(Score::Final(a, _, _)) => *a,
                    None => 0,
                },
                Some(Score::Final(a, b, _)) => a + b,
                None => 0,
            },
            Score::Final(a, b, None) => a + b, // open
            Score::Final(a, b, Some(c)) => if a + b == 10 {
                // spare
                10 + c
            } else if *a == 10 {
                // strike
                10 + b + c
            } else { a + b }
        }
    }
}