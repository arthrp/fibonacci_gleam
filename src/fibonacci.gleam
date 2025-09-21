import argv
import gleam/int
import gleam/io

pub fn main() -> Nil {
  case argv.load().arguments {
    [num] ->
      case int.parse(num) {
        Ok(n) -> {
          let x = fib(n)
          io.println("Result: " <> int.to_string(x))
          Nil
        }
        Error(_) -> io.println("Error: first argument is not a valid integer")
      }
    _ -> io.println("Usage: fibonacci <sequence number>")
  }
}

fn fib(n) -> Int {
  let res = case n {
    0 -> 1
    1 -> 1
    _ -> fib(n - 1) + fib(n - 2)
  }

  res
}
