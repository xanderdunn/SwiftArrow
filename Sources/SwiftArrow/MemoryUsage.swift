import Foundation

#if canImport(Darwin)
enum MachError: Error {
    case FailedToGetMemory(String)
}

func getMemoryUsage() -> UInt64? {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }

    if kerr == KERN_SUCCESS {
        return taskInfo.resident_size
    } else {
        return nil
        /*let errorString = "Error with task_info(): " +*/
            /*(String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error")*/
        /*throw MachError.FailedToGetMemory(errorString)*/
    }
}

func getMemoryUsageString() -> String? {
    if let memoryUsage: UInt64 = getMemoryUsage() {
        return ByteCountFormatter().string(fromByteCount: Int64(memoryUsage))
    } else {
        return nil
    }
}

#else
func getMemoryUsageString() -> String? {
    // TODO: Implement this for Linux
    return ""
}
#endif