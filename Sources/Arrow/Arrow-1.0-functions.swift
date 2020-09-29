import CGLib
import CArrow
import GLib
import GLibObject
@inlinable public func errorQuark() -> GQuark {
    let rv = garrow_error_quark()
    return rv
}


