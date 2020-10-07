import Foundation

extension Date {

    var nanosecondsSince1970: Int64 {
        let value = Int64((self.timeIntervalSince1970 * 1e9).rounded())
        return value
    }

    init(nanoseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(Double(nanoseconds) / 1e9))
    }

    /**
    Test that dates are the same down to millisecond precision
    */
    static func datesEqual(array1: [Date], array2: [Date]) -> Bool {
        assert(array1.count == array2.count)
        for i in 0..<array1.count {
            let diff = abs(array1[i].timeIntervalSince1970 - array2[i].timeIntervalSince1970)
            if diff >= 0.001 {
                print("FALSE:")
                print(array1[i].timeIntervalSince1970)
                print(array2[i].timeIntervalSince1970)
                return false
            }
        }
        return true
    }
}
