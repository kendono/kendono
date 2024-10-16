
fn flush() {
    use std::io::Write;
    std::io::stdout().flush().unwrap();
}

macro_rules! printfl {
    () => {{
        flush();
    }};
    ($($arg:tt)*) => {{
        print!($($arg)*);
        flush();
    }};
}

fn get_line() -> String {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    s.trim().to_string()
}

macro_rules! msg_line {
    () => {{
        flush();
        get_line()
    }};
    ($($arg:tt)*) => {{
        printfl!($($arg)*);
        get_line()
    }};
}

fn main() {
    let name = msg_line!("Enter your name: ");
    println!("Hello {name}");
}
