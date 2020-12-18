import Foundation

import PenguinTables
#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

func gArrowTableColumnToSwift<T: ArrowArrayElement>(gArray: UnsafeMutablePointer<GArrowArray>) -> [T] {
    return T.self.fromGArrowArray(gArray)
}
