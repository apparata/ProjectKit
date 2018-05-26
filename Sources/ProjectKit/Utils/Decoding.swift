
import Foundation

func decodeIDs<T: ObjectID>(_ array: Any?) -> [T] {
    return (array as? [String] ?? []).map { T(id: $0) }
}

func decodeID<T: ObjectID>(_ string: Any?) -> T? {
    if let idString = string as? String {
        return T(id: idString)
    }
    return nil
}
