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

mustBeInt("10") // success(10)

mustBeInt("5") // success(5)

mustBeInt("swift") // failure(Error.mustBeInt)
