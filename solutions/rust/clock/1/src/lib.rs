#[derive(PartialEq, Debug)]
pub struct Clock(u32);

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut m = hours * 60 + minutes;
        while m < 0 { m += 24*60; }
        while m >= 24*60 { m -= 24*60; }
        Self(m as u32)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let mut m = self.0 as i32 + minutes;
        while m < 0 { m += 24*60; }
        while m >= 24*60 { m -= 24*60; }
        Self(m as u32)
    }
}

impl std::fmt::Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.0 / 60, self.0 % 60)
    }
}
