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

