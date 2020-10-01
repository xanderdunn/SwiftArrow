import Foundation
#if canImport(Darwin)
    import Darwin
#else
    import Glibc
#endif
import CArrow

/*func createSchema(columns: [String]) {*/
    /*if let gArrowSchema = garrow_schema_new(columns) {*/
        /*print(gArrowSchema)*/
    /*}*/
/*}*/

func simpleArrayTest() {
    if let arrayBuilder = garrow_float_array_builder_new() {
        var values: [gfloat] = [1.0, 2.0, 44.56]
        var error: UnsafeMutablePointer<GError>? = nil
        var result: gboolean
        result = garrow_float_array_builder_append_value(arrayBuilder, 1.0, &error)
        precondition(result != 0)
        if let error = error {
            fatalError("\(error)")
        }
        result = garrow_float_array_builder_append_values(arrayBuilder, &values, 3, [], 0, &error)
        precondition(result != 0)
        if let error = error {
            fatalError("\(error)")
        }
        /*let arrayBuilderFinishPointer = UnsafeMutablePointer<GArrowArrayBuilder>(OpaquePointer(arrayBuilder))*/
        let gArray = garrow_array_builder_finish(GARROW_ARRAY_BUILDER(arrayBuilder), &error)
        if let error = error {
            fatalError("\(error)")
        }
        if let gArray = gArray {
            print("gArray", gArray)
            let n = garrow_array_get_length(gArray)
            /*g_print("length: %" G_GINT64_FORMAT "\n", n);*/
            print(n)
            for i in 0..<n {
              let value: gfloat = garrow_float_array_get_value(GARROW_FLOAT_ARRAY(gArray), i)
              print(value)
              /*g_print("array[%" G_GINT64_FORMAT "] = %d\n", i, value);*/
            }
        }
        /*print(gArray)*/
        /*precondition(result != 0)*/
    }
}

/*func listArrayTest() {*/
    /*var error: UnsafeMutablePointer<GError>? = nil*/
    /*if let intArrayBuilder = garrow_int8_array_builder_new(),*/
    /*let listArrayBuilder = garrow_list_array_builder_new(intArrayBuilder as! UnsafeMutablePointer<GArrowListDataType>,*/
                                                         /*&error) {*/
    /*}*/
    // Start 0th list element: [1, 0, -1]
    /*garrow_list_array_builder_append(builder, NULL);*/
    /*garrow_int8_array_builder_append(value_builder, 1);*/
    /*garrow_int8_array_builder_append(value_builder, 0);*/
    /*garrow_int8_array_builder_append(value_builder, -1);*/
    /*// Start 1st list element: [-29, 29]*/
    /*garrow_list_array_builder_append(builder, NULL);*/
    /*garrow_int8_array_builder_append(value_builder, -29);*/
    /*garrow_int8_array_builder_append(value_builder, 29);*/
    /*{*/
    /*// [[1, 0, -1], [-29, 29]]*/
    /*GArrowArray *array = garrow_array_builder_finish(builder);*/
/*}*/

func main() {
    print("Start")
    simpleArrayTest()
    // Create arrays: 
    // Create table from arrays: garrow_table_new_arrays()
    // Save table to file: 
    // Load table from file: 
    print("Done")
}

main()
