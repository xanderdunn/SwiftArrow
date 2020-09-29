import CGLib
import CArrow
import GLib
import GLibObject
// MARK: - JSONReader Class

/// The `JSONReaderProtocol` protocol exposes the methods and properties of an underlying `GArrowJSONReader` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `JSONReader`.
/// Alternatively, use `JSONReaderRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol JSONReaderProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowJSONReader` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowJSONReader` instance.
    var json_reader_ptr: UnsafeMutablePointer<GArrowJSONReader>! { get }

}

/// The `JSONReaderRef` type acts as a lightweight Swift reference to an underlying `GArrowJSONReader` instance.
/// It exposes methods that can operate on this data type through `JSONReaderProtocol` conformance.
/// Use `JSONReaderRef` only as an `unowned` reference to an existing `GArrowJSONReader` instance.
///

public struct JSONReaderRef: JSONReaderProtocol {
        /// Untyped pointer to the underlying `GArrowJSONReader` instance.
    /// For type-safe access, use the generated, typed pointer `json_reader_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension JSONReaderRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowJSONReader>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowJSONReader>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowJSONReader>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowJSONReader>?) {
        guard let p = UnsafeMutablePointer(mutating: maybePointer) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional `gpointer`
    @inlinable init!(gpointer g: gpointer?) {
        guard let p = g else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable `gconstpointer`
    @inlinable init!(gconstpointer g: gconstpointer?) {
        guard let p = UnsafeMutableRawPointer(mutating: g) else { return nil }
        ptr = p
    }

    /// Reference intialiser for a related type that implements `JSONReaderProtocol`
    @inlinable init<T: JSONReaderProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<InputStreamT: InputStreamProtocol, JSONReadOptionsT: JSONReadOptionsProtocol>( input: InputStreamT, options: JSONReadOptionsT?) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_json_reader_new(input.input_stream_ptr, options?.json_read_options_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `JSONReader` type acts as a reference-counted owner of an underlying `GArrowJSONReader` instance.
/// It provides the methods that can operate on this data type through `JSONReaderProtocol` conformance.
/// Use `JSONReader` as a strong reference or owner of a `GArrowJSONReader` instance.
///

open class JSONReader: GLibObject.Object, JSONReaderProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowJSONReader>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowJSONReader>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowJSONReader>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowJSONReader>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowJSONReader`.
    /// i.e., ownership is transferred to the `JSONReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowJSONReader>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `JSONReaderProtocol`
    /// Will retain `GArrowJSONReader`.
    /// - Parameter other: an instance of a related type that implements `JSONReaderProtocol`
    @inlinable public init<T: JSONReaderProtocol>(jSONReader other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `JSONReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<InputStreamT: InputStreamProtocol, JSONReadOptionsT: JSONReadOptionsProtocol>( input: InputStreamT, options: JSONReadOptionsT?) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_json_reader_new(input.input_stream_ptr, options?.json_read_options_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum JSONReaderPropertyName: String, PropertyNameProtocol {
    case jsonTableReader = "json-table-reader"
}

public extension JSONReaderProtocol {
    /// Bind a `JSONReaderPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: JSONReaderPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
        func _bind(_ source: UnsafePointer<gchar>, to t: T, _ target_property: UnsafePointer<gchar>, flags f: BindingFlags = .default, holder: BindingClosureHolder, transformFrom transform_from: @convention(c) @escaping (gpointer, gpointer, gpointer, gpointer) -> gboolean, transformTo transform_to: @convention(c) @escaping (gpointer, gpointer, gpointer, gpointer) -> gboolean) -> BindingRef! {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(holder).toOpaque())
            let from = unsafeBitCast(transform_from, to: BindingTransformFunc.self)
            let to   = unsafeBitCast(transform_to,   to: BindingTransformFunc.self)
            let rv = GLibObject.ObjectRef(raw: ptr).bindPropertyFull(sourceProperty: source, target: t, targetProperty: target_property, flags: f, transformTo: to, transformFrom: from, userData: holder) {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
            }
            return rv.map { BindingRef($0) }
        }

        let rv = _bind(source_property.name, to: target, target_property.name, flags: f, holder: BindingClosureHolder(transform_from, transform_to), transformFrom: {
            let ptr = UnsafeRawPointer($3)
            let holder = Unmanaged<BindingClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            return holder.transform_from(GLibObject.ValueRef(raw: $1), GLibObject.ValueRef(raw: $2)) ? 1 : 0
        }) {
            let ptr = UnsafeRawPointer($3)
            let holder = Unmanaged<BindingClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            return holder.transform_to(GLibObject.ValueRef(raw: $1), GLibObject.ValueRef(raw: $2)) ? 1 : 0
        }
        return rv
    }

    /// Get the value of a JSONReader property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: JSONReaderPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a JSONReader property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: JSONReaderPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum JSONReaderSignalName: String, SignalNameProtocol {
    /// The notify signal is emitted on an object when one of its
    /// properties has been changed. Note that getting this signal
    /// doesn't guarantee that the value of the property has actually
    /// changed, it may also be emitted when the setter for the property
    /// is called to reinstate the previous value.
    /// 
    /// This signal is typically used to obtain change notification for a
    /// single property, by specifying the property name as a detail in the
    /// `g_signal_connect()` call, like this:
    /// (C Language Example):
    /// ```C
    /// g_signal_connect (text_view->buffer, "notify::paste-target-list",
    ///                   G_CALLBACK (gtk_text_view_target_list_notify),
    ///                   text_view)
    /// ```
    /// It is important to note that you must use
    /// [canonical](#canonical-parameter-name) parameter names as
    /// detail strings for the notify signal.
    case notify = "notify"
    case notifyJsonTableReader = "notify::json-table-reader"
}

public extension JSONReaderProtocol {
    /// Connect a `JSONReaderSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: JSONReaderSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
        func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: GLibObject.SignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer) -> Void) -> Int {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(data).toOpaque())
            let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
            let rv = GLibObject.ObjectRef(raw: ptr).signalConnectData(detailedSignal: name, cHandler: callback, data: holder, destroyData: {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
                let _ = $1
            }, connectFlags: flags)
            return rv
        }
        let rv = _connect(signal: kind.name, flags: f, data: ClosureHolder(handler)) {
            let ptr = UnsafeRawPointer($1)
            let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            holder.call(())
        }
        return rv
    }
}

// MARK: JSONReader Class: JSONReaderProtocol extension (methods and fields)
public extension JSONReaderProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowJSONReader` instance.
    @inlinable var json_reader_ptr: UnsafeMutablePointer<GArrowJSONReader>! { return ptr?.assumingMemoryBound(to: GArrowJSONReader.self) }

    @inlinable func read() throws -> TableRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = TableRef(gconstpointer: gconstpointer(garrow_json_reader_read(json_reader_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = json_reader_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - LargeBinaryArray Class

/// The `LargeBinaryArrayProtocol` protocol exposes the methods and properties of an underlying `GArrowLargeBinaryArray` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `LargeBinaryArray`.
/// Alternatively, use `LargeBinaryArrayRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol LargeBinaryArrayProtocol: ArrayProtocol {
        /// Untyped pointer to the underlying `GArrowLargeBinaryArray` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowLargeBinaryArray` instance.
    var large_binary_array_ptr: UnsafeMutablePointer<GArrowLargeBinaryArray>! { get }

}

/// The `LargeBinaryArrayRef` type acts as a lightweight Swift reference to an underlying `GArrowLargeBinaryArray` instance.
/// It exposes methods that can operate on this data type through `LargeBinaryArrayProtocol` conformance.
/// Use `LargeBinaryArrayRef` only as an `unowned` reference to an existing `GArrowLargeBinaryArray` instance.
///

public struct LargeBinaryArrayRef: LargeBinaryArrayProtocol {
        /// Untyped pointer to the underlying `GArrowLargeBinaryArray` instance.
    /// For type-safe access, use the generated, typed pointer `large_binary_array_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension LargeBinaryArrayRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowLargeBinaryArray>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowLargeBinaryArray>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowLargeBinaryArray>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowLargeBinaryArray>?) {
        guard let p = UnsafeMutablePointer(mutating: maybePointer) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional `gpointer`
    @inlinable init!(gpointer g: gpointer?) {
        guard let p = g else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable `gconstpointer`
    @inlinable init!(gconstpointer g: gconstpointer?) {
        guard let p = UnsafeMutableRawPointer(mutating: g) else { return nil }
        ptr = p
    }

    /// Reference intialiser for a related type that implements `LargeBinaryArrayProtocol`
    @inlinable init<T: LargeBinaryArrayProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<BufferT: BufferProtocol>( length: gint64, valueOffsets: BufferT, valueData: BufferT, nullBitmap: BufferT?, nNulls: gint64) {
        let rv = garrow_large_binary_array_new(length, valueOffsets.buffer_ptr, valueData.buffer_ptr, nullBitmap?.buffer_ptr, nNulls)
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `LargeBinaryArray` type acts as a reference-counted owner of an underlying `GArrowLargeBinaryArray` instance.
/// It provides the methods that can operate on this data type through `LargeBinaryArrayProtocol` conformance.
/// Use `LargeBinaryArray` as a strong reference or owner of a `GArrowLargeBinaryArray` instance.
///

open class LargeBinaryArray: Array, LargeBinaryArrayProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowLargeBinaryArray>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowLargeBinaryArray>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowLargeBinaryArray>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowLargeBinaryArray>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowLargeBinaryArray`.
    /// i.e., ownership is transferred to the `LargeBinaryArray` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowLargeBinaryArray>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `LargeBinaryArrayProtocol`
    /// Will retain `GArrowLargeBinaryArray`.
    /// - Parameter other: an instance of a related type that implements `LargeBinaryArrayProtocol`
    @inlinable public init<T: LargeBinaryArrayProtocol>(largeBinaryArray other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `LargeBinaryArrayProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<BufferT: BufferProtocol>( length: gint64, valueOffsets: BufferT, valueData: BufferT, nullBitmap: BufferT?, nNulls: gint64) {
        let rv = garrow_large_binary_array_new(length, valueOffsets.buffer_ptr, valueData.buffer_ptr, nullBitmap?.buffer_ptr, nNulls)
        super.init(gpointer: (rv))
    }


}

public enum LargeBinaryArrayPropertyName: String, PropertyNameProtocol {
    case array = "array"
    case buffer1 = "buffer1"
    case buffer2 = "buffer2"
    case nullBitmap = "null-bitmap"
    case parent = "parent"
    case valueDataType = "value-data-type"
}

public extension LargeBinaryArrayProtocol {
    /// Bind a `LargeBinaryArrayPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: LargeBinaryArrayPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
        func _bind(_ source: UnsafePointer<gchar>, to t: T, _ target_property: UnsafePointer<gchar>, flags f: BindingFlags = .default, holder: BindingClosureHolder, transformFrom transform_from: @convention(c) @escaping (gpointer, gpointer, gpointer, gpointer) -> gboolean, transformTo transform_to: @convention(c) @escaping (gpointer, gpointer, gpointer, gpointer) -> gboolean) -> BindingRef! {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(holder).toOpaque())
            let from = unsafeBitCast(transform_from, to: BindingTransformFunc.self)
            let to   = unsafeBitCast(transform_to,   to: BindingTransformFunc.self)
            let rv = GLibObject.ObjectRef(raw: ptr).bindPropertyFull(sourceProperty: source, target: t, targetProperty: target_property, flags: f, transformTo: to, transformFrom: from, userData: holder) {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
            }
            return rv.map { BindingRef($0) }
        }

        let rv = _bind(source_property.name, to: target, target_property.name, flags: f, holder: BindingClosureHolder(transform_from, transform_to), transformFrom: {
            let ptr = UnsafeRawPointer($3)
            let holder = Unmanaged<BindingClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            return holder.transform_from(GLibObject.ValueRef(raw: $1), GLibObject.ValueRef(raw: $2)) ? 1 : 0
        }) {
            let ptr = UnsafeRawPointer($3)
            let holder = Unmanaged<BindingClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            return holder.transform_to(GLibObject.ValueRef(raw: $1), GLibObject.ValueRef(raw: $2)) ? 1 : 0
        }
        return rv
    }

    /// Get the value of a LargeBinaryArray property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: LargeBinaryArrayPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a LargeBinaryArray property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: LargeBinaryArrayPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum LargeBinaryArraySignalName: String, SignalNameProtocol {
    /// The notify signal is emitted on an object when one of its
    /// properties has been changed. Note that getting this signal
    /// doesn't guarantee that the value of the property has actually
    /// changed, it may also be emitted when the setter for the property
    /// is called to reinstate the previous value.
    /// 
    /// This signal is typically used to obtain change notification for a
    /// single property, by specifying the property name as a detail in the
    /// `g_signal_connect()` call, like this:
    /// (C Language Example):
    /// ```C
    /// g_signal_connect (text_view->buffer, "notify::paste-target-list",
    ///                   G_CALLBACK (gtk_text_view_target_list_notify),
    ///                   text_view)
    /// ```
    /// It is important to note that you must use
    /// [canonical](#canonical-parameter-name) parameter names as
    /// detail strings for the notify signal.
    case notify = "notify"
    case notifyArrayType = "notify::array"
    case notifyBuffer1 = "notify::buffer1"
    case notifyBuffer2 = "notify::buffer2"
    case notifyNullBitmap = "notify::null-bitmap"
    case notifyParent = "notify::parent"
    case notifyValueDataType = "notify::value-data-type"
}

public extension LargeBinaryArrayProtocol {
    /// Connect a `LargeBinaryArraySignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: LargeBinaryArraySignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
        func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: GLibObject.SignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer) -> Void) -> Int {
            let holder = UnsafeMutableRawPointer(Unmanaged.passRetained(data).toOpaque())
            let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
            let rv = GLibObject.ObjectRef(raw: ptr).signalConnectData(detailedSignal: name, cHandler: callback, data: holder, destroyData: {
                if let swift = UnsafeRawPointer($0) {
                    let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(swift)
                    holder.release()
                }
                let _ = $1
            }, connectFlags: flags)
            return rv
        }
        let rv = _connect(signal: kind.name, flags: f, data: ClosureHolder(handler)) {
            let ptr = UnsafeRawPointer($1)
            let holder = Unmanaged<GLibObject.SignalHandlerClosureHolder>.fromOpaque(ptr).takeUnretainedValue()
            holder.call(())
        }
        return rv
    }
}

// MARK: LargeBinaryArray Class: LargeBinaryArrayProtocol extension (methods and fields)
public extension LargeBinaryArrayProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowLargeBinaryArray` instance.
    @inlinable var large_binary_array_ptr: UnsafeMutablePointer<GArrowLargeBinaryArray>! { return ptr?.assumingMemoryBound(to: GArrowLargeBinaryArray.self) }


    ///
    /// **get_buffer is deprecated:**
    /// Use garrow_large_binary_array_get_data_buffer() instead.
    @available(*, deprecated) @inlinable func getBuffer() -> BufferRef! {
        let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_buffer(large_binary_array_ptr)))
        return rv
    }

    @inlinable func getDataBuffer() -> BufferRef! {
        let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_data_buffer(large_binary_array_ptr)))
        return rv
    }

    @inlinable func getOffsetsBuffer() -> BufferRef! {
        let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_offsets_buffer(large_binary_array_ptr)))
        return rv
    }

    @inlinable func getValue(i: gint64) -> GLib.BytesRef! {
        let rv = GLib.BytesRef(garrow_large_binary_array_get_value(large_binary_array_ptr, i))
        return rv
    }

    ///
    /// **get_buffer is deprecated:**
    /// Use garrow_large_binary_array_get_data_buffer() instead.
    @inlinable var buffer: BufferRef! {

        ///
        /// **get_buffer is deprecated:**
        /// Use garrow_large_binary_array_get_data_buffer() instead.
        @available(*, deprecated) get {
            let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_buffer(large_binary_array_ptr)))
            return rv
        }
    }

    @inlinable var dataBuffer: BufferRef! {
        get {
            let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_data_buffer(large_binary_array_ptr)))
            return rv
        }
    }

    @inlinable var offsetsBuffer: BufferRef! {
        get {
            let rv = BufferRef(gconstpointer: gconstpointer(garrow_large_binary_array_get_offsets_buffer(large_binary_array_ptr)))
            return rv
        }
    }

    @inlinable var parentInstance: GArrowArray {
        get {
            let rv = large_binary_array_ptr.pointee.parent_instance
            return rv
        }
    }

}



