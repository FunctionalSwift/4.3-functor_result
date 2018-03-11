//: Playground - Functor Result

enum Result<A, E> {
    case success(A)
    case failure(E)
    
    func map<B>(_ transform: (A) -> B) -> Result<B, E> {
        switch self {
        case let .success(value):
            return .success(transform(value))
        case let .failure(reason):
            return .failure(reason)
        }
    }
}

enum Error {
    case mustBeInt
}

func mustBeInt(_ string: String) -> Result<Int, Error> {
    return Int(string).map { .success($0) } ?? .failure(.mustBeInt)
}

func add2(_ number: Int) -> Int {
    return number + 2
}

func double(_ number: Int) -> Int {
    return number * 2
}

mustBeInt("10").map(add2) // Success(12)

mustBeInt("5").map(double) // Success(10)

mustBeInt("swift").map(add2) // Failure(Error.MustBeInt)

