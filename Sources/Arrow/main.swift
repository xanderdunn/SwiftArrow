import Foundation
import CArrow

/*func createSchema(columns: [String]) {*/
    /*if let gArrowSchema = garrow_schema_new(columns) {*/
        /*print(gArrowSchema)*/
    /*}*/
/*}*/

enum ArrowError: Error {
    case invalidArrayCreation(String)
}

func doubleArrayToGArray(values: [Double]) throws -> UnsafeMutablePointer<GArrowArray>? {
    if let arrayBuilder = garrow_double_array_builder_new() {
        var values = values
        var error: UnsafeMutablePointer<GError>? = nil
        var result: gboolean
        result = garrow_double_array_builder_append_values(arrayBuilder, &values, Int64(values.count), [], 0, &error)
        if result == 0 {
            let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
            g_error_free(error)
            g_object_unref(arrayBuilder)
            throw ArrowError.invalidArrayCreation(errorString)
        }
        let gArray: UnsafeMutablePointer<GArrowArray>? = garrow_array_builder_finish(GARROW_ARRAY_BUILDER(arrayBuilder),
                                                                                     &error)
        if result == 0 {
            let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
            g_error_free(error)
            g_object_unref(arrayBuilder)
            throw ArrowError.invalidArrayCreation(errorString)
        }
        if let gArray = gArray {
            let n: Int64 = garrow_array_get_length(gArray)
            for i in 0..<n {
              let value: Double = garrow_double_array_get_value(GARROW_DOUBLE_ARRAY(gArray), i)
              print(value)
            }
        }
        g_object_unref(arrayBuilder)
        return gArray
    }
    throw ArrowError.invalidArrayCreation("Couldn't make new garrow_array_builder")
}

func main() {
    print("Start")
    // Create arrays
    do {
        let values: [Double] = [1.0, 2.22, 45.66, 916661.17171]
        if let result = try doubleArrayToGArray(values: values) {
            print(result)
        }
    } catch {
        print("Failed \(error)")
    }
    // TODO: Create table from arrays: garrow_table_new_arrays()
    // TODO: Save table to file: 
    // TODO: Load table from file: 
    print("Done")
}

main()
