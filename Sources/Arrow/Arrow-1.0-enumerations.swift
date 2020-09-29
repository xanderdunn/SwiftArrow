import CGLib
import CArrow
import GLib
import GLibObject
/// They are corresponding to `arrow`compute::CompareOperator`` values.
public typealias CompareOperator = GArrowCompareOperator

public extension CompareOperator {
    /// Cast constructor, converting any binary integer to a
    /// `CompareOperator`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToCompareOperatorInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToCompareOperatorInt(raw))
    }
    /// Equal operator.
    static let equal = GARROW_COMPARE_EQUAL // 0
    /// Not equal operator.
    static let notEqual = GARROW_COMPARE_NOT_EQUAL // 1
    /// Greater operator.
    static let greater = GARROW_COMPARE_GREATER // 2
    /// Greater equal operator.
    static let greaterEqual = GARROW_COMPARE_GREATER_EQUAL // 3
    /// Less operator.
    static let less = GARROW_COMPARE_LESS // 4
    /// Less equal operator.
    static let lessEqual = GARROW_COMPARE_LESS_EQUAL // 5
}



/// They are corresponding to `arrow`Compression::type`` values.
public typealias CompressionType = GArrowCompressionType

public extension CompressionType {
    /// Cast constructor, converting any binary integer to a
    /// `CompressionType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToCompressionTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToCompressionTypeInt(raw))
    }
    /// Not compressed.
    static let uncompressed = GARROW_COMPRESSION_TYPE_UNCOMPRESSED // 0
    /// Snappy compression.
    static let snappy = GARROW_COMPRESSION_TYPE_SNAPPY // 1
    /// gzip compression.
    static let gzip = GARROW_COMPRESSION_TYPE_GZIP // 2
    /// Brotli compression.
    static let brotli = GARROW_COMPRESSION_TYPE_BROTLI // 3
    /// Zstandard compression.
    static let zstd = GARROW_COMPRESSION_TYPE_ZSTD // 4
    /// LZ4 compression.
    static let lz4 = GARROW_COMPRESSION_TYPE_LZ4 // 5
    /// LZO compression.
    static let lzo = GARROW_COMPRESSION_TYPE_LZO // 6
    /// bzip2 compression.
    static let bz2 = GARROW_COMPRESSION_TYPE_BZ2 // 7
}



/// They are corresponding to `arrow`compute::CountOptions::mode`` values.
public typealias CountMode = GArrowCountMode

public extension CountMode {
    /// Cast constructor, converting any binary integer to a
    /// `CountMode`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToCountModeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToCountModeInt(raw))
    }
    /// Count all non-null values.
    static let all = GARROW_COUNT_ALL // 0
    /// Count all null values.
    static let null = GARROW_COUNT_NULL // 1
}



/// The error codes are used by all arrow-glib functions.
/// 
/// They are corresponding to `arrow`Status`` values.
public typealias GLibError = GArrowError

public extension Error {
    /// Cast constructor, converting any binary integer to a
    /// `Error`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToErrorInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToErrorInt(raw))
    }
    /// Out of memory error.
    static let outOfMemory = GARROW_ERROR_OUT_OF_MEMORY // 1
    /// Key error.
    static let key = GARROW_ERROR_KEY // 2
    /// Type error.
    static let type = GARROW_ERROR_TYPE // 3
    /// Invalid value error.
    static let invalid = GARROW_ERROR_INVALID // 4
    /// IO error.
    static let io = GARROW_ERROR_IO // 5
    /// Capacity error.
    static let capacity = GARROW_ERROR_CAPACITY // 6
    /// Index error.
    static let index = GARROW_ERROR_INDEX // 7
    /// Unknown error.
    static let unknown = GARROW_ERROR_UNKNOWN // 9
    /// The feature is not implemented.
    static let notImplemented = GARROW_ERROR_NOT_IMPLEMENTED // 10
    /// Serialization error.
    static let serialization = GARROW_ERROR_SERIALIZATION // 11
    /// Error generating code for expression evaluation
    ///   in Gandiva.
    static let codeGeneration = GARROW_ERROR_CODE_GENERATION // 40
    /// Validation errors in expression given for code generation.
    static let expressionValidation = GARROW_ERROR_EXPRESSION_VALIDATION // 41
    /// Execution error while evaluating the expression against a record batch.
    static let execution = GARROW_ERROR_EXECUTION // 42
    /// Item already exists error.
    static let alreadyExists = GARROW_ERROR_ALREADY_EXISTS // 45
}



/// They are corresponding to `arrow`io::FileMode::type`` values.
public typealias FileMode = GArrowFileMode

public extension FileMode {
    /// Cast constructor, converting any binary integer to a
    /// `FileMode`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFileModeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFileModeInt(raw))
    }
    /// For read.
    static let read = GARROW_FILE_MODE_READ // 0
    /// For write.
    static let write = GARROW_FILE_MODE_WRITE // 1
    /// For read-write.
    static let readwrite = GARROW_FILE_MODE_READWRITE // 2
}



/// They are corresponding to `arrow`fs::FileType`` values.
public typealias FileType = GArrowFileType

public extension FileType {
    /// Cast constructor, converting any binary integer to a
    /// `FileType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFileTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFileTypeInt(raw))
    }
    /// Entry is not found
    static let notFound = GARROW_FILE_TYPE_NOT_FOUND // 0
    /// Entry exists but its type is unknown
    static let unknown = GARROW_FILE_TYPE_UNKNOWN // 1
    /// Entry is a regular file
    static let file = GARROW_FILE_TYPE_FILE // 2
    /// Entry is a directory
    static let dir = GARROW_FILE_TYPE_DIR // 3
}



/// They are corresponding to
/// `arrow`compute::FilterOptions::NullSelectionBehavior`` values.
public typealias FilterNullSelectionBehavior = GArrowFilterNullSelectionBehavior

public extension FilterNullSelectionBehavior {
    /// Cast constructor, converting any binary integer to a
    /// `FilterNullSelectionBehavior`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFilterNullSelectionBehaviorInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFilterNullSelectionBehaviorInt(raw))
    }
    /// Filtered value will be removed in the output.
    static let drop = GARROW_FILTER_NULL_SELECTION_DROP // 0
    /// Filtered value will be null in the output.
    static let emitNull = GARROW_FILTER_NULL_SELECTION_EMIT_NULL // 1
}



/// They are corresponding to `arrow`json::UnexpectedFieldBehavior`` values.
public typealias JSONReadUnexpectedFieldBehavior = GArrowJSONReadUnexpectedFieldBehavior

public extension JSONReadUnexpectedFieldBehavior {
    /// Cast constructor, converting any binary integer to a
    /// `JSONReadUnexpectedFieldBehavior`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToJSONReadUnexpectedFieldBehaviorInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToJSONReadUnexpectedFieldBehaviorInt(raw))
    }
    /// Ignore other fields.
    static let ignore = GARROW_JSON_READ_IGNORE // 0
    /// Return error.
    static let error = GARROW_JSON_READ_ERROR // 1
    /// Infer a type.
    static let inferType = GARROW_JSON_READ_INFER_TYPE // 2
}



/// They are corresponding to `arrow`ipc::MetadataVersion::type``
/// values.
public typealias MetadataVersion = GArrowMetadataVersion

public extension MetadataVersion {
    /// Cast constructor, converting any binary integer to a
    /// `MetadataVersion`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToMetadataVersionInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToMetadataVersionInt(raw))
    }
    /// Version 1.
    static let v1 = GARROW_METADATA_VERSION_V1 // 0
    /// Version 2.
    static let v2 = GARROW_METADATA_VERSION_V2 // 1
    /// Version 3.
    static let v3 = GARROW_METADATA_VERSION_V3 // 2
}



/// They are corresponding to `arrow`TimeUnit::type`` values.
public typealias TimeUnit = GArrowTimeUnit

public extension TimeUnit {
    /// Cast constructor, converting any binary integer to a
    /// `TimeUnit`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToTimeUnitInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToTimeUnitInt(raw))
    }
    /// Second.
    static let second = GARROW_TIME_UNIT_SECOND // 0
    /// Millisecond.
    static let milli = GARROW_TIME_UNIT_MILLI // 1
    /// Microsecond.
    static let micro = GARROW_TIME_UNIT_MICRO // 2
    /// Nanosecond.
    static let nano = GARROW_TIME_UNIT_NANO // 3
}



/// They are corresponding to `arrow`Type::type`` values.
public typealias Type_ = GArrowType

public extension Type {
    /// Cast constructor, converting any binary integer to a
    /// `Type`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToTypeInt(raw))
    }
    /// A degenerate NULL type represented as 0 bytes/bits.
    static let na = GARROW_TYPE_NA // 0
    /// A boolean value represented as 1 bit.
    static let boolean = GARROW_TYPE_BOOLEAN // 1
    /// Little-endian 8bit unsigned integer.
    static let uint8 = GARROW_TYPE_UINT8 // 2
    /// Little-endian 8bit signed integer.
    static let int8 = GARROW_TYPE_INT8 // 3
    /// Little-endian 16bit unsigned integer.
    static let uint16 = GARROW_TYPE_UINT16 // 4
    /// Little-endian 16bit signed integer.
    static let int16 = GARROW_TYPE_INT16 // 5
    /// Little-endian 32bit unsigned integer.
    static let uint32 = GARROW_TYPE_UINT32 // 6
    /// Little-endian 32bit signed integer.
    static let int32 = GARROW_TYPE_INT32 // 7
    /// Little-endian 64bit unsigned integer.
    static let uint64 = GARROW_TYPE_UINT64 // 8
    /// Little-endian 64bit signed integer.
    static let int64 = GARROW_TYPE_INT64 // 9
    /// 2-byte floating point value.
    static let halfFloat = GARROW_TYPE_HALF_FLOAT // 10
    /// 4-byte floating point value.
    static let float = GARROW_TYPE_FLOAT // 11
    /// 8-byte floating point value.
    static let double = GARROW_TYPE_DOUBLE // 12
    /// UTF-8 variable-length string.
    static let string = GARROW_TYPE_STRING // 13
    /// Variable-length bytes (no guarantee of UTF-8-ness).
    static let binary = GARROW_TYPE_BINARY // 14
    /// Fixed-size binary. Each value occupies
    ///   the same number of bytes.
    static let fixedSizeBinary = GARROW_TYPE_FIXED_SIZE_BINARY // 15
    /// int32 days since the UNIX epoch.
    static let date32 = GARROW_TYPE_DATE32 // 16
    /// int64 milliseconds since the UNIX epoch.
    static let date64 = GARROW_TYPE_DATE64 // 17
    /// Exact timestamp encoded with int64 since UNIX epoch.
    ///   Default unit millisecond.
    static let timestamp = GARROW_TYPE_TIMESTAMP // 18
    /// Exact time encoded with int32, supporting seconds or milliseconds
    static let time32 = GARROW_TYPE_TIME32 // 19
    /// Exact time encoded with int64, supporting micro- or nanoseconds
    static let time64 = GARROW_TYPE_TIME64 // 20
    /// YEAR_MONTH interval in SQL style.
    static let intervalMonths = GARROW_TYPE_INTERVAL_MONTHS // 21
    /// DAY_TIME interval in SQL style.
    static let intervalDayTime = GARROW_TYPE_INTERVAL_DAY_TIME // 22
    /// Precision- and scale-based decimal
    ///   type. Storage type depends on the parameters.
    static let decimal = GARROW_TYPE_DECIMAL // 23
    /// A list of some logical data type.
    static let list = GARROW_TYPE_LIST // 24
    /// Struct of logical types.
    static let `struct` = GARROW_TYPE_STRUCT // 25
    /// Sparse unions of logical types.
    static let sparseUnion = GARROW_TYPE_SPARSE_UNION // 26
    /// Dense unions of logical types.
    static let denseUnion = GARROW_TYPE_DENSE_UNION // 27
    /// Dictionary aka Category type.
    static let dictionary = GARROW_TYPE_DICTIONARY // 28
    /// A repeated struct logical type.
    static let map = GARROW_TYPE_MAP // 29
    /// Custom data type, implemented by user.
    static let `extension` = GARROW_TYPE_EXTENSION // 30
    /// Fixed size list of some logical type.
    static let fixedSizeList = GARROW_TYPE_FIXED_SIZE_LIST // 31
    /// Measure of elapsed time in either seconds,
    ///   milliseconds, microseconds or nanoseconds.
    static let duration = GARROW_TYPE_DURATION // 32
    /// 64bit offsets UTF-8 variable-length string.
    static let largeString = GARROW_TYPE_LARGE_STRING // 33
    /// 64bit offsets Variable-length bytes (no guarantee of UTF-8-ness).
    static let largeBinary = GARROW_TYPE_LARGE_BINARY // 34
    /// A list of some logical data type with 64-bit offsets.
    static let largeList = GARROW_TYPE_LARGE_LIST // 35
}

