import CGLib
import CArrow
import GLib
import GLibObject
// MARK: - ReadOptions Class

/// The `ReadOptionsProtocol` protocol exposes the methods and properties of an underlying `GArrowReadOptions` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `ReadOptions`.
/// Alternatively, use `ReadOptionsRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol ReadOptionsProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowReadOptions` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowReadOptions` instance.
    var read_options_ptr: UnsafeMutablePointer<GArrowReadOptions>! { get }

}

/// The `ReadOptionsRef` type acts as a lightweight Swift reference to an underlying `GArrowReadOptions` instance.
/// It exposes methods that can operate on this data type through `ReadOptionsProtocol` conformance.
/// Use `ReadOptionsRef` only as an `unowned` reference to an existing `GArrowReadOptions` instance.
///

public struct ReadOptionsRef: ReadOptionsProtocol {
        /// Untyped pointer to the underlying `GArrowReadOptions` instance.
    /// For type-safe access, use the generated, typed pointer `read_options_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension ReadOptionsRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowReadOptions>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowReadOptions>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowReadOptions>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowReadOptions>?) {
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

    /// Reference intialiser for a related type that implements `ReadOptionsProtocol`
    @inlinable init<T: ReadOptionsProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init() {
        let rv = garrow_read_options_new()
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `ReadOptions` type acts as a reference-counted owner of an underlying `GArrowReadOptions` instance.
/// It provides the methods that can operate on this data type through `ReadOptionsProtocol` conformance.
/// Use `ReadOptions` as a strong reference or owner of a `GArrowReadOptions` instance.
///

open class ReadOptions: GLibObject.Object, ReadOptionsProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowReadOptions>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowReadOptions>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowReadOptions>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowReadOptions>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowReadOptions`.
    /// i.e., ownership is transferred to the `ReadOptions` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowReadOptions>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `ReadOptionsProtocol`
    /// Will retain `GArrowReadOptions`.
    /// - Parameter other: an instance of a related type that implements `ReadOptionsProtocol`
    @inlinable public init<T: ReadOptionsProtocol>(readOptions other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ReadOptionsProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init() {
        let rv = garrow_read_options_new()
        super.init(gpointer: (rv))
    }


}

public enum ReadOptionsPropertyName: String, PropertyNameProtocol {
    /// The maximum permitted schema nesting depth.
    case maxRecursionDepth = "max-recursion-depth"
    /// Whether to use the global CPU thread pool.
    case useThreads = "use-threads"
}

public extension ReadOptionsProtocol {
    /// Bind a `ReadOptionsPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: ReadOptionsPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a ReadOptions property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: ReadOptionsPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a ReadOptions property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: ReadOptionsPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum ReadOptionsSignalName: String, SignalNameProtocol {
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
    /// The maximum permitted schema nesting depth.
    case notifyMaxRecursionDepth = "notify::max-recursion-depth"
    /// Whether to use the global CPU thread pool.
    case notifyUseThreads = "notify::use-threads"
}

public extension ReadOptionsProtocol {
    /// Connect a `ReadOptionsSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: ReadOptionsSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: ReadOptions Class: ReadOptionsProtocol extension (methods and fields)
public extension ReadOptionsProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowReadOptions` instance.
    @inlinable var read_options_ptr: UnsafeMutablePointer<GArrowReadOptions>! { return ptr?.assumingMemoryBound(to: GArrowReadOptions.self) }

    @inlinable func getIncludedFields(nFields: UnsafeMutablePointer<gsize>!) -> UnsafeMutablePointer<CInt>! {
        let rv = garrow_read_options_get_included_fields(read_options_ptr, nFields)
        return rv
    }

    @inlinable func setIncluded(fields: UnsafeMutablePointer<CInt>!, nFields: Int) {
        garrow_read_options_set_included_fields(read_options_ptr, fields, gsize(nFields))
    
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = read_options_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatch Class

/// The `RecordBatchProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatch` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatch`.
/// Alternatively, use `RecordBatchRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RecordBatchProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatch` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatch` instance.
    var record_batch_ptr: UnsafeMutablePointer<GArrowRecordBatch>! { get }

}

/// The `RecordBatchRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatch` instance.
/// It exposes methods that can operate on this data type through `RecordBatchProtocol` conformance.
/// Use `RecordBatchRef` only as an `unowned` reference to an existing `GArrowRecordBatch` instance.
///

public struct RecordBatchRef: RecordBatchProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatch` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatch>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatch>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatch>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatch>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchProtocol`
    @inlinable init<T: RecordBatchProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<ListT: GLib.ListProtocol, SchemaT: SchemaProtocol>( schema: SchemaT, nRows: guint32, columns: ListT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_new(schema.schema_ptr, nRows, columns._ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatch` type acts as a reference-counted owner of an underlying `GArrowRecordBatch` instance.
/// It provides the methods that can operate on this data type through `RecordBatchProtocol` conformance.
/// Use `RecordBatch` as a strong reference or owner of a `GArrowRecordBatch` instance.
///

open class RecordBatch: GLibObject.Object, RecordBatchProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatch>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatch>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatch>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatch>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatch`.
    /// i.e., ownership is transferred to the `RecordBatch` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatch>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchProtocol`
    /// Will retain `GArrowRecordBatch`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchProtocol`
    @inlinable public init<T: RecordBatchProtocol>(recordBatch other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<ListT: GLib.ListProtocol, SchemaT: SchemaProtocol>( schema: SchemaT, nRows: guint32, columns: ListT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_new(schema.schema_ptr, nRows, columns._ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchPropertyName: String, PropertyNameProtocol {
    case recordBatch = "record-batch"
}

public extension RecordBatchProtocol {
    /// Bind a `RecordBatchPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatch property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatch property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatch = "notify::record-batch"
}

public extension RecordBatchProtocol {
    /// Connect a `RecordBatchSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatch Class: RecordBatchProtocol extension (methods and fields)
public extension RecordBatchProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatch` instance.
    @inlinable var record_batch_ptr: UnsafeMutablePointer<GArrowRecordBatch>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatch.self) }

    @inlinable func addColumn<ArrayTypeT: ArrayProtocol, FieldT: FieldProtocol>(i: Int, field: FieldT, column: ArrayTypeT) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_add_column(record_batch_ptr, guint(i), field.field_ptr, column.array_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func equal<RecordBatchT: RecordBatchProtocol>(otherRecordBatch: RecordBatchT) -> Bool {
        let rv = ((garrow_record_batch_equal(record_batch_ptr, otherRecordBatch.record_batch_ptr)) != 0)
        return rv
    }

    @inlinable func equalMetadata<RecordBatchT: RecordBatchProtocol>(otherRecordBatch: RecordBatchT, checkMetadata: Bool) -> Bool {
        let rv = ((garrow_record_batch_equal_metadata(record_batch_ptr, otherRecordBatch.record_batch_ptr, gboolean((checkMetadata) ? 1 : 0))) != 0)
        return rv
    }

    @inlinable func filter<BooleanArrayT: BooleanArrayProtocol>(filter: BooleanArrayT, options: FilterOptionsRef? = nil) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_filter(record_batch_ptr, filter.boolean_array_ptr, options?.filter_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }
    @inlinable func filter<BooleanArrayT: BooleanArrayProtocol, FilterOptionsT: FilterOptionsProtocol>(filter: BooleanArrayT, options: FilterOptionsT?) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_filter(record_batch_ptr, filter.boolean_array_ptr, options?.filter_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func getColumnData(i: Int) -> ArrayRef! {
        let rv = ArrayRef(gconstpointer: gconstpointer(garrow_record_batch_get_column_data(record_batch_ptr, gint(i))))
        return rv
    }

    @inlinable func getColumnName(i: Int) -> String! {
        let rv = garrow_record_batch_get_column_name(record_batch_ptr, gint(i)).map({ String(cString: $0) })
        return rv
    }

    @inlinable func getNColumns() -> Int {
        let rv = Int(garrow_record_batch_get_n_columns(record_batch_ptr))
        return rv
    }

    @inlinable func getNRows() -> gint64 {
        let rv = garrow_record_batch_get_n_rows(record_batch_ptr)
        return rv
    }

    @inlinable func getSchema() -> SchemaRef! {
        let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_get_schema(record_batch_ptr)))
        return rv
    }

    @inlinable func removeColumn(i: Int) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_remove_column(record_batch_ptr, guint(i), &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func serialize(options: WriteOptionsRef? = nil) throws -> BufferRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = BufferRef(gconstpointer: gconstpointer(garrow_record_batch_serialize(record_batch_ptr, options?.write_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }
    @inlinable func serialize<WriteOptionsT: WriteOptionsProtocol>(options: WriteOptionsT?) throws -> BufferRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = BufferRef(gconstpointer: gconstpointer(garrow_record_batch_serialize(record_batch_ptr, options?.write_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func slice(offset: gint64, length: gint64) -> RecordBatchRef! {
        guard let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_slice(record_batch_ptr, offset, length))) else { return nil }
        return rv
    }

    @inlinable func take<ArrayTypeT: ArrayProtocol>(indices: ArrayTypeT, options: TakeOptionsRef? = nil) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_take(record_batch_ptr, indices.array_ptr, options?.take_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }
    @inlinable func take<ArrayTypeT: ArrayProtocol, TakeOptionsT: TakeOptionsProtocol>(indices: ArrayTypeT, options: TakeOptionsT?) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_take(record_batch_ptr, indices.array_ptr, options?.take_options_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func toString() throws -> String! {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_to_string(record_batch_ptr, &error).map({ String(cString: $0) })
        if let error = error { throw GLibError(error) }
        return rv
    }
    @inlinable var nColumns: Int {
        get {
            let rv = Int(garrow_record_batch_get_n_columns(record_batch_ptr))
            return rv
        }
    }

    @inlinable var nRows: gint64 {
        get {
            let rv = garrow_record_batch_get_n_rows(record_batch_ptr)
            return rv
        }
    }

    @inlinable var schema: SchemaRef! {
        get {
            let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_get_schema(record_batch_ptr)))
            return rv
        }
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = record_batch_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatchBuilder Class

/// The `RecordBatchBuilderProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchBuilder` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchBuilder`.
/// Alternatively, use `RecordBatchBuilderRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RecordBatchBuilderProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchBuilder` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchBuilder` instance.
    var record_batch_builder_ptr: UnsafeMutablePointer<GArrowRecordBatchBuilder>! { get }

}

/// The `RecordBatchBuilderRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchBuilder` instance.
/// It exposes methods that can operate on this data type through `RecordBatchBuilderProtocol` conformance.
/// Use `RecordBatchBuilderRef` only as an `unowned` reference to an existing `GArrowRecordBatchBuilder` instance.
///

public struct RecordBatchBuilderRef: RecordBatchBuilderProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchBuilder` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_builder_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchBuilderRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchBuilder>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchBuilder>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchBuilder>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchBuilder>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchBuilderProtocol`
    @inlinable init<T: RecordBatchBuilderProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<SchemaT: SchemaProtocol>( schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_builder_new(schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchBuilder` type acts as a reference-counted owner of an underlying `GArrowRecordBatchBuilder` instance.
/// It provides the methods that can operate on this data type through `RecordBatchBuilderProtocol` conformance.
/// Use `RecordBatchBuilder` as a strong reference or owner of a `GArrowRecordBatchBuilder` instance.
///

open class RecordBatchBuilder: GLibObject.Object, RecordBatchBuilderProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchBuilder>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchBuilder>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchBuilder>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchBuilder>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchBuilder`.
    /// i.e., ownership is transferred to the `RecordBatchBuilder` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchBuilder>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchBuilderProtocol`
    /// Will retain `GArrowRecordBatchBuilder`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchBuilderProtocol`
    @inlinable public init<T: RecordBatchBuilderProtocol>(recordBatchBuilder other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchBuilderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<SchemaT: SchemaProtocol>( schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_builder_new(schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchBuilderPropertyName: String, PropertyNameProtocol {
    case recordBatchBuilder = "record-batch-builder"
}

public extension RecordBatchBuilderProtocol {
    /// Bind a `RecordBatchBuilderPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchBuilderPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchBuilder property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchBuilderPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchBuilder property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchBuilderPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchBuilderSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchBuilder = "notify::record-batch-builder"
}

public extension RecordBatchBuilderProtocol {
    /// Connect a `RecordBatchBuilderSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchBuilderSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchBuilder Class: RecordBatchBuilderProtocol extension (methods and fields)
public extension RecordBatchBuilderProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchBuilder` instance.
    @inlinable var record_batch_builder_ptr: UnsafeMutablePointer<GArrowRecordBatchBuilder>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchBuilder.self) }

    @inlinable func flush() throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_builder_flush(record_batch_builder_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func getColumnBuilder(i: Int) -> ArrayBuilderRef! {
        let rv = ArrayBuilderRef(gconstpointer: gconstpointer(garrow_record_batch_builder_get_column_builder(record_batch_builder_ptr, gint(i))))
        return rv
    }


    ///
    /// **get_field is deprecated:**
    /// 
    ///   Use garrow_record_batch_builder_get_column_builder() instead.
    @available(*, deprecated) @inlinable func getField(i: Int) -> ArrayBuilderRef! {
        let rv = ArrayBuilderRef(gconstpointer: gconstpointer(garrow_record_batch_builder_get_field(record_batch_builder_ptr, gint(i))))
        return rv
    }

    @inlinable func getInitialCapacity() -> gint64 {
        let rv = garrow_record_batch_builder_get_initial_capacity(record_batch_builder_ptr)
        return rv
    }

    @inlinable func getNColumns() -> Int {
        let rv = Int(garrow_record_batch_builder_get_n_columns(record_batch_builder_ptr))
        return rv
    }


    ///
    /// **get_n_fields is deprecated:**
    /// 
    ///   Use garrow_record_batch_builder_get_n_columns() instead.
    @available(*, deprecated) @inlinable func getNFields() -> Int {
        let rv = Int(garrow_record_batch_builder_get_n_fields(record_batch_builder_ptr))
        return rv
    }

    @inlinable func getSchema() -> SchemaRef! {
        let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_builder_get_schema(record_batch_builder_ptr)))
        return rv
    }

    @inlinable func setInitial(capacity: gint64) {
        garrow_record_batch_builder_set_initial_capacity(record_batch_builder_ptr, capacity)
    
    }
    @inlinable var initialCapacity: gint64 {
        get {
            let rv = garrow_record_batch_builder_get_initial_capacity(record_batch_builder_ptr)
            return rv
        }
        nonmutating set {
            garrow_record_batch_builder_set_initial_capacity(record_batch_builder_ptr, newValue)
        }
    }

    @inlinable var nColumns: Int {
        get {
            let rv = Int(garrow_record_batch_builder_get_n_columns(record_batch_builder_ptr))
            return rv
        }
    }


    ///
    /// **get_n_fields is deprecated:**
    /// 
    ///   Use garrow_record_batch_builder_get_n_columns() instead.
    @inlinable var nFields: Int {

        ///
        /// **get_n_fields is deprecated:**
        /// 
        ///   Use garrow_record_batch_builder_get_n_columns() instead.
        @available(*, deprecated) get {
            let rv = Int(garrow_record_batch_builder_get_n_fields(record_batch_builder_ptr))
            return rv
        }
    }

    @inlinable var schema: SchemaRef! {
        get {
            let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_builder_get_schema(record_batch_builder_ptr)))
            return rv
        }
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = record_batch_builder_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatchDatum Class

/// The `RecordBatchDatumProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchDatum` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchDatum`.
/// Alternatively, use `RecordBatchDatumRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RecordBatchDatumProtocol: DatumProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchDatum` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchDatum` instance.
    var record_batch_datum_ptr: UnsafeMutablePointer<GArrowRecordBatchDatum>! { get }

}

/// The `RecordBatchDatumRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchDatum` instance.
/// It exposes methods that can operate on this data type through `RecordBatchDatumProtocol` conformance.
/// Use `RecordBatchDatumRef` only as an `unowned` reference to an existing `GArrowRecordBatchDatum` instance.
///

public struct RecordBatchDatumRef: RecordBatchDatumProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchDatum` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_datum_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchDatumRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchDatum>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchDatum>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchDatum>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchDatum>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchDatumProtocol`
    @inlinable init<T: RecordBatchDatumProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<RecordBatchT: RecordBatchProtocol>( value: RecordBatchT) {
        let rv = garrow_record_batch_datum_new(value.record_batch_ptr)
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchDatum` type acts as a reference-counted owner of an underlying `GArrowRecordBatchDatum` instance.
/// It provides the methods that can operate on this data type through `RecordBatchDatumProtocol` conformance.
/// Use `RecordBatchDatum` as a strong reference or owner of a `GArrowRecordBatchDatum` instance.
///

open class RecordBatchDatum: Datum, RecordBatchDatumProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchDatum>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchDatum>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchDatum>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchDatum>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchDatum`.
    /// i.e., ownership is transferred to the `RecordBatchDatum` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchDatum>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchDatumProtocol`
    /// Will retain `GArrowRecordBatchDatum`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchDatumProtocol`
    @inlinable public init<T: RecordBatchDatumProtocol>(recordBatchDatum other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchDatumProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<RecordBatchT: RecordBatchProtocol>( value: RecordBatchT) {
        let rv = garrow_record_batch_datum_new(value.record_batch_ptr)
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchDatumPropertyName: String, PropertyNameProtocol {
    case datum = "datum"
    case value = "value"
}

public extension RecordBatchDatumProtocol {
    /// Bind a `RecordBatchDatumPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchDatumPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchDatum property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchDatumPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchDatum property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchDatumPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchDatumSignalName: String, SignalNameProtocol {
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
    case notifyDatum = "notify::datum"
    case notifyValue = "notify::value"
}

public extension RecordBatchDatumProtocol {
    /// Connect a `RecordBatchDatumSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchDatumSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchDatum Class: RecordBatchDatumProtocol extension (methods and fields)
public extension RecordBatchDatumProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchDatum` instance.
    @inlinable var record_batch_datum_ptr: UnsafeMutablePointer<GArrowRecordBatchDatum>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchDatum.self) }


    @inlinable var parentInstance: GArrowDatum {
        get {
            let rv = record_batch_datum_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatchFileReader Class

/// The `RecordBatchFileReaderProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchFileReader` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchFileReader`.
/// Alternatively, use `RecordBatchFileReaderRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// It wraps `arrow`ipc::RecordBatchFileReader``.
public protocol RecordBatchFileReaderProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchFileReader` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchFileReader` instance.
    var record_batch_file_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchFileReader>! { get }

}

/// The `RecordBatchFileReaderRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchFileReader` instance.
/// It exposes methods that can operate on this data type through `RecordBatchFileReaderProtocol` conformance.
/// Use `RecordBatchFileReaderRef` only as an `unowned` reference to an existing `GArrowRecordBatchFileReader` instance.
///
/// It wraps `arrow`ipc::RecordBatchFileReader``.
public struct RecordBatchFileReaderRef: RecordBatchFileReaderProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchFileReader` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_file_reader_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchFileReaderRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchFileReader>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchFileReader>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchFileReader>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchFileReader>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchFileReaderProtocol`
    @inlinable init<T: RecordBatchFileReaderProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<SeekableInputStreamT: SeekableInputStreamProtocol>( file: SeekableInputStreamT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_file_reader_new(file.seekable_input_stream_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchFileReader` type acts as a reference-counted owner of an underlying `GArrowRecordBatchFileReader` instance.
/// It provides the methods that can operate on this data type through `RecordBatchFileReaderProtocol` conformance.
/// Use `RecordBatchFileReader` as a strong reference or owner of a `GArrowRecordBatchFileReader` instance.
///
/// It wraps `arrow`ipc::RecordBatchFileReader``.
open class RecordBatchFileReader: GLibObject.Object, RecordBatchFileReaderProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchFileReader>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchFileReader>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchFileReader>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchFileReader>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchFileReader`.
    /// i.e., ownership is transferred to the `RecordBatchFileReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchFileReader>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchFileReaderProtocol`
    /// Will retain `GArrowRecordBatchFileReader`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchFileReaderProtocol`
    @inlinable public init<T: RecordBatchFileReaderProtocol>(recordBatchFileReader other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<SeekableInputStreamT: SeekableInputStreamProtocol>( file: SeekableInputStreamT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_file_reader_new(file.seekable_input_stream_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchFileReaderPropertyName: String, PropertyNameProtocol {
    case recordBatchFileReader = "record-batch-file-reader"
}

public extension RecordBatchFileReaderProtocol {
    /// Bind a `RecordBatchFileReaderPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchFileReaderPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchFileReader property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchFileReaderPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchFileReader property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchFileReaderPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchFileReaderSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchFileReader = "notify::record-batch-file-reader"
}

public extension RecordBatchFileReaderProtocol {
    /// Connect a `RecordBatchFileReaderSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchFileReaderSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchFileReader Class: RecordBatchFileReaderProtocol extension (methods and fields)
public extension RecordBatchFileReaderProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchFileReader` instance.
    @inlinable var record_batch_file_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchFileReader>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchFileReader.self) }

    @inlinable func getNRecordBatches() -> Int {
        let rv = Int(garrow_record_batch_file_reader_get_n_record_batches(record_batch_file_reader_ptr))
        return rv
    }


    ///
    /// **get_record_batch is deprecated:**
    /// 
    ///   Use garrow_record_batch_file_reader_read_record_batch() instead.
    @available(*, deprecated) @inlinable func getRecordBatch(i: Int) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_file_reader_get_record_batch(record_batch_file_reader_ptr, guint(i), &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func getSchema() -> SchemaRef! {
        let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_file_reader_get_schema(record_batch_file_reader_ptr)))
        return rv
    }

    @inlinable func getVersion() -> GArrowMetadataVersion {
        let rv = garrow_record_batch_file_reader_get_version(record_batch_file_reader_ptr)
        return rv
    }

    @inlinable func readRecordBatch(i: Int) throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_file_reader_read_record_batch(record_batch_file_reader_ptr, guint(i), &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }
    @inlinable var nRecordBatches: Int {
        get {
            let rv = Int(garrow_record_batch_file_reader_get_n_record_batches(record_batch_file_reader_ptr))
            return rv
        }
    }

    @inlinable var schema: SchemaRef! {
        get {
            let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_file_reader_get_schema(record_batch_file_reader_ptr)))
            return rv
        }
    }

    @inlinable var version: GArrowMetadataVersion {
        get {
            let rv = garrow_record_batch_file_reader_get_version(record_batch_file_reader_ptr)
            return rv
        }
    }

    // var parentInstance is unavailable because parent_instance is private

}



// MARK: - RecordBatchFileWriter Class

/// The `RecordBatchFileWriterProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchFileWriter` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchFileWriter`.
/// Alternatively, use `RecordBatchFileWriterRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// It wraps `arrow`ipc::RecordBatchFileWriter``.
public protocol RecordBatchFileWriterProtocol: RecordBatchStreamWriterProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchFileWriter` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchFileWriter` instance.
    var record_batch_file_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchFileWriter>! { get }

}

/// The `RecordBatchFileWriterRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchFileWriter` instance.
/// It exposes methods that can operate on this data type through `RecordBatchFileWriterProtocol` conformance.
/// Use `RecordBatchFileWriterRef` only as an `unowned` reference to an existing `GArrowRecordBatchFileWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchFileWriter``.
public struct RecordBatchFileWriterRef: RecordBatchFileWriterProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchFileWriter` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_file_writer_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchFileWriterRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchFileWriter>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchFileWriter>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchFileWriter>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchFileWriter>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchFileWriterProtocol`
    @inlinable init<T: RecordBatchFileWriterProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<OutputStreamT: OutputStreamProtocol, SchemaT: SchemaProtocol>( sink: OutputStreamT, schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_file_writer_new(sink.output_stream_ptr, schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchFileWriter` type acts as a reference-counted owner of an underlying `GArrowRecordBatchFileWriter` instance.
/// It provides the methods that can operate on this data type through `RecordBatchFileWriterProtocol` conformance.
/// Use `RecordBatchFileWriter` as a strong reference or owner of a `GArrowRecordBatchFileWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchFileWriter``.
open class RecordBatchFileWriter: RecordBatchStreamWriter, RecordBatchFileWriterProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchFileWriter>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchFileWriter>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchFileWriter>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchFileWriter>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchFileWriter`.
    /// i.e., ownership is transferred to the `RecordBatchFileWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchFileWriter>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchFileWriterProtocol`
    /// Will retain `GArrowRecordBatchFileWriter`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchFileWriterProtocol`
    @inlinable public init<T: RecordBatchFileWriterProtocol>(recordBatchFileWriter other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchFileWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<OutputStreamT: OutputStreamProtocol, SchemaT: SchemaProtocol>( sink: OutputStreamT, schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_file_writer_new(sink.output_stream_ptr, schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchFileWriterPropertyName: String, PropertyNameProtocol {
    case recordBatchWriter = "record-batch-writer"
}

public extension RecordBatchFileWriterProtocol {
    /// Bind a `RecordBatchFileWriterPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchFileWriterPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchFileWriter property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchFileWriterPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchFileWriter property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchFileWriterPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchFileWriterSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchWriter = "notify::record-batch-writer"
}

public extension RecordBatchFileWriterProtocol {
    /// Connect a `RecordBatchFileWriterSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchFileWriterSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchFileWriter Class: RecordBatchFileWriterProtocol extension (methods and fields)
public extension RecordBatchFileWriterProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchFileWriter` instance.
    @inlinable var record_batch_file_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchFileWriter>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchFileWriter.self) }


    // var parentInstance is unavailable because parent_instance is private

}



// MARK: - RecordBatchIterator Class

/// The `RecordBatchIteratorProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchIterator` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchIterator`.
/// Alternatively, use `RecordBatchIteratorRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RecordBatchIteratorProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchIterator` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchIterator` instance.
    var record_batch_iterator_ptr: UnsafeMutablePointer<GArrowRecordBatchIterator>! { get }

}

/// The `RecordBatchIteratorRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchIterator` instance.
/// It exposes methods that can operate on this data type through `RecordBatchIteratorProtocol` conformance.
/// Use `RecordBatchIteratorRef` only as an `unowned` reference to an existing `GArrowRecordBatchIterator` instance.
///

public struct RecordBatchIteratorRef: RecordBatchIteratorProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchIterator` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_iterator_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchIteratorRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchIterator>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchIterator>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchIterator>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchIterator>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchIteratorProtocol`
    @inlinable init<T: RecordBatchIteratorProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<ListT: GLib.ListProtocol>( recordBatches: ListT) {
        let rv = garrow_record_batch_iterator_new(recordBatches._ptr)
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchIterator` type acts as a reference-counted owner of an underlying `GArrowRecordBatchIterator` instance.
/// It provides the methods that can operate on this data type through `RecordBatchIteratorProtocol` conformance.
/// Use `RecordBatchIterator` as a strong reference or owner of a `GArrowRecordBatchIterator` instance.
///

open class RecordBatchIterator: GLibObject.Object, RecordBatchIteratorProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchIterator>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchIterator>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchIterator>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchIterator>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchIterator`.
    /// i.e., ownership is transferred to the `RecordBatchIterator` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchIterator>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchIteratorProtocol`
    /// Will retain `GArrowRecordBatchIterator`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchIteratorProtocol`
    @inlinable public init<T: RecordBatchIteratorProtocol>(recordBatchIterator other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchIteratorProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<ListT: GLib.ListProtocol>( recordBatches: ListT) {
        let rv = garrow_record_batch_iterator_new(recordBatches._ptr)
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchIteratorPropertyName: String, PropertyNameProtocol {
    case iterator = "iterator"
}

public extension RecordBatchIteratorProtocol {
    /// Bind a `RecordBatchIteratorPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchIteratorPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchIterator property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchIteratorPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchIterator property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchIteratorPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchIteratorSignalName: String, SignalNameProtocol {
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
    case notifyIterator = "notify::iterator"
}

public extension RecordBatchIteratorProtocol {
    /// Connect a `RecordBatchIteratorSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchIteratorSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchIterator Class: RecordBatchIteratorProtocol extension (methods and fields)
public extension RecordBatchIteratorProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchIterator` instance.
    @inlinable var record_batch_iterator_ptr: UnsafeMutablePointer<GArrowRecordBatchIterator>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchIterator.self) }

    @inlinable func equal<RecordBatchIteratorT: RecordBatchIteratorProtocol>(otherIterator: RecordBatchIteratorT) -> Bool {
        let rv = ((garrow_record_batch_iterator_equal(record_batch_iterator_ptr, otherIterator.record_batch_iterator_ptr)) != 0)
        return rv
    }

    @inlinable func next() throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_iterator_next(record_batch_iterator_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func toList() throws -> GLib.ListRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = GLib.ListRef(garrow_record_batch_iterator_to_list(record_batch_iterator_ptr, &error))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = record_batch_iterator_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatchReader Class

/// The `RecordBatchReaderProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchReader` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchReader`.
/// Alternatively, use `RecordBatchReaderRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RecordBatchReaderProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchReader` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchReader` instance.
    var record_batch_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchReader>! { get }

}

/// The `RecordBatchReaderRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchReader` instance.
/// It exposes methods that can operate on this data type through `RecordBatchReaderProtocol` conformance.
/// Use `RecordBatchReaderRef` only as an `unowned` reference to an existing `GArrowRecordBatchReader` instance.
///

public struct RecordBatchReaderRef: RecordBatchReaderProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchReader` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_reader_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchReaderRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchReader>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchReader>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchReader>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchReader>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchReaderProtocol`
    @inlinable init<T: RecordBatchReaderProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `RecordBatchReader` type acts as a reference-counted owner of an underlying `GArrowRecordBatchReader` instance.
/// It provides the methods that can operate on this data type through `RecordBatchReaderProtocol` conformance.
/// Use `RecordBatchReader` as a strong reference or owner of a `GArrowRecordBatchReader` instance.
///

open class RecordBatchReader: GLibObject.Object, RecordBatchReaderProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchReader>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchReader>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchReader>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchReader>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchReader`.
    /// i.e., ownership is transferred to the `RecordBatchReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchReader>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchReaderProtocol`
    /// Will retain `GArrowRecordBatchReader`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchReaderProtocol`
    @inlinable public init<T: RecordBatchReaderProtocol>(recordBatchReader other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }



}

public enum RecordBatchReaderPropertyName: String, PropertyNameProtocol {
    case recordBatchReader = "record-batch-reader"
}

public extension RecordBatchReaderProtocol {
    /// Bind a `RecordBatchReaderPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchReaderPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchReader property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchReaderPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchReader property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchReaderPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchReaderSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchReader = "notify::record-batch-reader"
}

public extension RecordBatchReaderProtocol {
    /// Connect a `RecordBatchReaderSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchReaderSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchReader Class: RecordBatchReaderProtocol extension (methods and fields)
public extension RecordBatchReaderProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchReader` instance.
    @inlinable var record_batch_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchReader>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchReader.self) }


    ///
    /// **get_next_record_batch is deprecated:**
    /// 
    ///   Use garrow_record_batch_reader_read_next() instead.
    @available(*, deprecated) @inlinable func getNextRecordBatch() throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_reader_get_next_record_batch(record_batch_reader_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func getSchema() -> SchemaRef! {
        let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_reader_get_schema(record_batch_reader_ptr)))
        return rv
    }

    @inlinable func readNext() throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_reader_read_next(record_batch_reader_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }


    ///
    /// **read_next_record_batch is deprecated:**
    /// 
    ///   Use garrow_record_batch_reader_read_next() instead.
    @available(*, deprecated) @inlinable func readNextRecordBatch() throws -> RecordBatchRef! {
        var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_reader_read_next_record_batch(record_batch_reader_ptr, &error)))
        if let error = error { throw GLibError(error) }
        return rv
    }

    ///
    /// **get_next_record_batch is deprecated:**
    /// 
    ///   Use garrow_record_batch_reader_read_next() instead.
    @inlinable var nextRecordBatch: RecordBatchRef! {

        ///
        /// **get_next_record_batch is deprecated:**
        /// 
        ///   Use garrow_record_batch_reader_read_next() instead.
        @available(*, deprecated) get {
            var error: UnsafeMutablePointer<GError>?
        let rv = RecordBatchRef(gconstpointer: gconstpointer(garrow_record_batch_reader_get_next_record_batch(record_batch_reader_ptr, &error)))
        g_log(messagePtr: error?.pointee.message, level: .error)
            return rv
        }
    }

    @inlinable var schema: SchemaRef! {
        get {
            let rv = SchemaRef(gconstpointer: gconstpointer(garrow_record_batch_reader_get_schema(record_batch_reader_ptr)))
            return rv
        }
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = record_batch_reader_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - RecordBatchStreamReader Class

/// The `RecordBatchStreamReaderProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchStreamReader` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchStreamReader`.
/// Alternatively, use `RecordBatchStreamReaderRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// It wraps `arrow`ipc::RecordBatchStreamReader``.
public protocol RecordBatchStreamReaderProtocol: RecordBatchReaderProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchStreamReader` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchStreamReader` instance.
    var record_batch_stream_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchStreamReader>! { get }

}

/// The `RecordBatchStreamReaderRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchStreamReader` instance.
/// It exposes methods that can operate on this data type through `RecordBatchStreamReaderProtocol` conformance.
/// Use `RecordBatchStreamReaderRef` only as an `unowned` reference to an existing `GArrowRecordBatchStreamReader` instance.
///
/// It wraps `arrow`ipc::RecordBatchStreamReader``.
public struct RecordBatchStreamReaderRef: RecordBatchStreamReaderProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchStreamReader` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_stream_reader_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchStreamReaderRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchStreamReader>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchStreamReader>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchStreamReader>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchStreamReader>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchStreamReaderProtocol`
    @inlinable init<T: RecordBatchStreamReaderProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<InputStreamT: InputStreamProtocol>( stream: InputStreamT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_stream_reader_new(stream.input_stream_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchStreamReader` type acts as a reference-counted owner of an underlying `GArrowRecordBatchStreamReader` instance.
/// It provides the methods that can operate on this data type through `RecordBatchStreamReaderProtocol` conformance.
/// Use `RecordBatchStreamReader` as a strong reference or owner of a `GArrowRecordBatchStreamReader` instance.
///
/// It wraps `arrow`ipc::RecordBatchStreamReader``.
open class RecordBatchStreamReader: RecordBatchReader, RecordBatchStreamReaderProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchStreamReader>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchStreamReader>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchStreamReader>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchStreamReader>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchStreamReader`.
    /// i.e., ownership is transferred to the `RecordBatchStreamReader` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchStreamReader>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchStreamReaderProtocol`
    /// Will retain `GArrowRecordBatchStreamReader`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchStreamReaderProtocol`
    @inlinable public init<T: RecordBatchStreamReaderProtocol>(recordBatchStreamReader other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamReaderProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<InputStreamT: InputStreamProtocol>( stream: InputStreamT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_stream_reader_new(stream.input_stream_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchStreamReaderPropertyName: String, PropertyNameProtocol {
    case recordBatchReader = "record-batch-reader"
}

public extension RecordBatchStreamReaderProtocol {
    /// Bind a `RecordBatchStreamReaderPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchStreamReaderPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchStreamReader property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchStreamReaderPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchStreamReader property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchStreamReaderPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchStreamReaderSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchReader = "notify::record-batch-reader"
}

public extension RecordBatchStreamReaderProtocol {
    /// Connect a `RecordBatchStreamReaderSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchStreamReaderSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchStreamReader Class: RecordBatchStreamReaderProtocol extension (methods and fields)
public extension RecordBatchStreamReaderProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchStreamReader` instance.
    @inlinable var record_batch_stream_reader_ptr: UnsafeMutablePointer<GArrowRecordBatchStreamReader>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchStreamReader.self) }


    // var parentInstance is unavailable because parent_instance is private

}



// MARK: - RecordBatchStreamWriter Class

/// The `RecordBatchStreamWriterProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchStreamWriter` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchStreamWriter`.
/// Alternatively, use `RecordBatchStreamWriterRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// It wraps `arrow`ipc::RecordBatchStreamWriter``.
public protocol RecordBatchStreamWriterProtocol: RecordBatchWriterProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchStreamWriter` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchStreamWriter` instance.
    var record_batch_stream_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>! { get }

}

/// The `RecordBatchStreamWriterRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchStreamWriter` instance.
/// It exposes methods that can operate on this data type through `RecordBatchStreamWriterProtocol` conformance.
/// Use `RecordBatchStreamWriterRef` only as an `unowned` reference to an existing `GArrowRecordBatchStreamWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchStreamWriter``.
public struct RecordBatchStreamWriterRef: RecordBatchStreamWriterProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchStreamWriter` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_stream_writer_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchStreamWriterRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchStreamWriter>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchStreamWriter>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchStreamWriterProtocol`
    @inlinable init<T: RecordBatchStreamWriterProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<OutputStreamT: OutputStreamProtocol, SchemaT: SchemaProtocol>( sink: OutputStreamT, schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_stream_writer_new(sink.output_stream_ptr, schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `RecordBatchStreamWriter` type acts as a reference-counted owner of an underlying `GArrowRecordBatchStreamWriter` instance.
/// It provides the methods that can operate on this data type through `RecordBatchStreamWriterProtocol` conformance.
/// Use `RecordBatchStreamWriter` as a strong reference or owner of a `GArrowRecordBatchStreamWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchStreamWriter``.
open class RecordBatchStreamWriter: RecordBatchWriter, RecordBatchStreamWriterProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchStreamWriter>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchStreamWriter>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchStreamWriter`.
    /// i.e., ownership is transferred to the `RecordBatchStreamWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchStreamWriterProtocol`
    /// Will retain `GArrowRecordBatchStreamWriter`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchStreamWriterProtocol`
    @inlinable public init<T: RecordBatchStreamWriterProtocol>(recordBatchStreamWriter other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchStreamWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<OutputStreamT: OutputStreamProtocol, SchemaT: SchemaProtocol>( sink: OutputStreamT, schema: SchemaT) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_record_batch_stream_writer_new(sink.output_stream_ptr, schema.schema_ptr, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum RecordBatchStreamWriterPropertyName: String, PropertyNameProtocol {
    case recordBatchWriter = "record-batch-writer"
}

public extension RecordBatchStreamWriterProtocol {
    /// Bind a `RecordBatchStreamWriterPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchStreamWriterPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchStreamWriter property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchStreamWriterPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchStreamWriter property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchStreamWriterPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchStreamWriterSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchWriter = "notify::record-batch-writer"
}

public extension RecordBatchStreamWriterProtocol {
    /// Connect a `RecordBatchStreamWriterSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchStreamWriterSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchStreamWriter Class: RecordBatchStreamWriterProtocol extension (methods and fields)
public extension RecordBatchStreamWriterProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchStreamWriter` instance.
    @inlinable var record_batch_stream_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchStreamWriter>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchStreamWriter.self) }


    // var parentInstance is unavailable because parent_instance is private

}



// MARK: - RecordBatchWriter Class

/// The `RecordBatchWriterProtocol` protocol exposes the methods and properties of an underlying `GArrowRecordBatchWriter` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RecordBatchWriter`.
/// Alternatively, use `RecordBatchWriterRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// It wraps `arrow`ipc::RecordBatchWriter``.
public protocol RecordBatchWriterProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchWriter` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowRecordBatchWriter` instance.
    var record_batch_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchWriter>! { get }

}

/// The `RecordBatchWriterRef` type acts as a lightweight Swift reference to an underlying `GArrowRecordBatchWriter` instance.
/// It exposes methods that can operate on this data type through `RecordBatchWriterProtocol` conformance.
/// Use `RecordBatchWriterRef` only as an `unowned` reference to an existing `GArrowRecordBatchWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchWriter``.
public struct RecordBatchWriterRef: RecordBatchWriterProtocol {
        /// Untyped pointer to the underlying `GArrowRecordBatchWriter` instance.
    /// For type-safe access, use the generated, typed pointer `record_batch_writer_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RecordBatchWriterRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowRecordBatchWriter>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowRecordBatchWriter>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowRecordBatchWriter>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowRecordBatchWriter>?) {
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

    /// Reference intialiser for a related type that implements `RecordBatchWriterProtocol`
    @inlinable init<T: RecordBatchWriterProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `RecordBatchWriter` type acts as a reference-counted owner of an underlying `GArrowRecordBatchWriter` instance.
/// It provides the methods that can operate on this data type through `RecordBatchWriterProtocol` conformance.
/// Use `RecordBatchWriter` as a strong reference or owner of a `GArrowRecordBatchWriter` instance.
///
/// It wraps `arrow`ipc::RecordBatchWriter``.
open class RecordBatchWriter: GLibObject.Object, RecordBatchWriterProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowRecordBatchWriter>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowRecordBatchWriter>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowRecordBatchWriter>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowRecordBatchWriter>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowRecordBatchWriter`.
    /// i.e., ownership is transferred to the `RecordBatchWriter` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowRecordBatchWriter>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `RecordBatchWriterProtocol`
    /// Will retain `GArrowRecordBatchWriter`.
    /// - Parameter other: an instance of a related type that implements `RecordBatchWriterProtocol`
    @inlinable public init<T: RecordBatchWriterProtocol>(recordBatchWriter other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RecordBatchWriterProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }



}

public enum RecordBatchWriterPropertyName: String, PropertyNameProtocol {
    case recordBatchWriter = "record-batch-writer"
}

public extension RecordBatchWriterProtocol {
    /// Bind a `RecordBatchWriterPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: RecordBatchWriterPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a RecordBatchWriter property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: RecordBatchWriterPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a RecordBatchWriter property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: RecordBatchWriterPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum RecordBatchWriterSignalName: String, SignalNameProtocol {
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
    case notifyRecordBatchWriter = "notify::record-batch-writer"
}

public extension RecordBatchWriterProtocol {
    /// Connect a `RecordBatchWriterSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: RecordBatchWriterSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: RecordBatchWriter Class: RecordBatchWriterProtocol extension (methods and fields)
public extension RecordBatchWriterProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowRecordBatchWriter` instance.
    @inlinable var record_batch_writer_ptr: UnsafeMutablePointer<GArrowRecordBatchWriter>! { return ptr?.assumingMemoryBound(to: GArrowRecordBatchWriter.self) }

    @inlinable func close() throws -> Bool {
        var error: UnsafeMutablePointer<GError>?
        let rv = ((garrow_record_batch_writer_close(record_batch_writer_ptr, &error)) != 0)
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func write<RecordBatchT: RecordBatchProtocol>(recordBatch: RecordBatchT) throws -> Bool {
        var error: UnsafeMutablePointer<GError>?
        let rv = ((garrow_record_batch_writer_write_record_batch(record_batch_writer_ptr, recordBatch.record_batch_ptr, &error)) != 0)
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func write<TableT: TableProtocol>(table: TableT) throws -> Bool {
        var error: UnsafeMutablePointer<GError>?
        let rv = ((garrow_record_batch_writer_write_table(record_batch_writer_ptr, table.table_ptr, &error)) != 0)
        if let error = error { throw GLibError(error) }
        return rv
    }

    // var parentInstance is unavailable because parent_instance is private

}



// MARK: - ResizableBuffer Class

/// The `ResizableBufferProtocol` protocol exposes the methods and properties of an underlying `GArrowResizableBuffer` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `ResizableBuffer`.
/// Alternatively, use `ResizableBufferRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol ResizableBufferProtocol: MutableBufferProtocol {
        /// Untyped pointer to the underlying `GArrowResizableBuffer` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowResizableBuffer` instance.
    var resizable_buffer_ptr: UnsafeMutablePointer<GArrowResizableBuffer>! { get }

}

/// The `ResizableBufferRef` type acts as a lightweight Swift reference to an underlying `GArrowResizableBuffer` instance.
/// It exposes methods that can operate on this data type through `ResizableBufferProtocol` conformance.
/// Use `ResizableBufferRef` only as an `unowned` reference to an existing `GArrowResizableBuffer` instance.
///

public struct ResizableBufferRef: ResizableBufferProtocol {
        /// Untyped pointer to the underlying `GArrowResizableBuffer` instance.
    /// For type-safe access, use the generated, typed pointer `resizable_buffer_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension ResizableBufferRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowResizableBuffer>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowResizableBuffer>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowResizableBuffer>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowResizableBuffer>?) {
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

    /// Reference intialiser for a related type that implements `ResizableBufferProtocol`
    @inlinable init<T: ResizableBufferProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init( initialSize: gint64) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_resizable_buffer_new(initialSize, &error)
        if let error = error { throw GLibError(error) }
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `ResizableBuffer` type acts as a reference-counted owner of an underlying `GArrowResizableBuffer` instance.
/// It provides the methods that can operate on this data type through `ResizableBufferProtocol` conformance.
/// Use `ResizableBuffer` as a strong reference or owner of a `GArrowResizableBuffer` instance.
///

open class ResizableBuffer: MutableBuffer, ResizableBufferProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowResizableBuffer>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowResizableBuffer>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowResizableBuffer>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowResizableBuffer>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowResizableBuffer`.
    /// i.e., ownership is transferred to the `ResizableBuffer` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowResizableBuffer>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `ResizableBufferProtocol`
    /// Will retain `GArrowResizableBuffer`.
    /// - Parameter other: an instance of a related type that implements `ResizableBufferProtocol`
    @inlinable public init<T: ResizableBufferProtocol>(resizableBuffer other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ResizableBufferProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init( initialSize: gint64) throws {
        var error: UnsafeMutablePointer<GError>?
        let rv = garrow_resizable_buffer_new(initialSize, &error)
        if let error = error { throw GLibError(error) }
        super.init(gpointer: (rv))
    }


}

public enum ResizableBufferPropertyName: String, PropertyNameProtocol {
    case buffer = "buffer"
    case data = "data"
    case parent = "parent"
}

public extension ResizableBufferProtocol {
    /// Bind a `ResizableBufferPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: ResizableBufferPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a ResizableBuffer property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: ResizableBufferPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a ResizableBuffer property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: ResizableBufferPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum ResizableBufferSignalName: String, SignalNameProtocol {
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
    case notifyBuffer = "notify::buffer"
    case notifyData = "notify::data"
    case notifyParent = "notify::parent"
}

public extension ResizableBufferProtocol {
    /// Connect a `ResizableBufferSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: ResizableBufferSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: ResizableBuffer Class: ResizableBufferProtocol extension (methods and fields)
public extension ResizableBufferProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowResizableBuffer` instance.
    @inlinable var resizable_buffer_ptr: UnsafeMutablePointer<GArrowResizableBuffer>! { return ptr?.assumingMemoryBound(to: GArrowResizableBuffer.self) }

    @inlinable func reserve(newCapacity: gint64) throws -> Bool {
        var error: UnsafeMutablePointer<GError>?
        let rv = ((garrow_resizable_buffer_reserve(resizable_buffer_ptr, newCapacity, &error)) != 0)
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable func resize(newSize: gint64) throws -> Bool {
        var error: UnsafeMutablePointer<GError>?
        let rv = ((garrow_resizable_buffer_resize(resizable_buffer_ptr, newSize, &error)) != 0)
        if let error = error { throw GLibError(error) }
        return rv
    }

    @inlinable var parentInstance: GArrowMutableBuffer {
        get {
            let rv = resizable_buffer_ptr.pointee.parent_instance
            return rv
        }
    }

}



// MARK: - Schema Class

/// The `SchemaProtocol` protocol exposes the methods and properties of an underlying `GArrowSchema` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Schema`.
/// Alternatively, use `SchemaRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol SchemaProtocol: GLibObject.ObjectProtocol {
        /// Untyped pointer to the underlying `GArrowSchema` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GArrowSchema` instance.
    var schema_ptr: UnsafeMutablePointer<GArrowSchema>! { get }

}

/// The `SchemaRef` type acts as a lightweight Swift reference to an underlying `GArrowSchema` instance.
/// It exposes methods that can operate on this data type through `SchemaProtocol` conformance.
/// Use `SchemaRef` only as an `unowned` reference to an existing `GArrowSchema` instance.
///

public struct SchemaRef: SchemaProtocol {
        /// Untyped pointer to the underlying `GArrowSchema` instance.
    /// For type-safe access, use the generated, typed pointer `schema_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension SchemaRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GArrowSchema>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GArrowSchema>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GArrowSchema>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GArrowSchema>?) {
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

    /// Reference intialiser for a related type that implements `SchemaProtocol`
    @inlinable init<T: SchemaProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

        @inlinable init<ListT: GLib.ListProtocol>( fields: ListT) {
        let rv = garrow_schema_new(fields._ptr)
        ptr = UnsafeMutableRawPointer(rv)
    }
}

/// The `Schema` type acts as a reference-counted owner of an underlying `GArrowSchema` instance.
/// It provides the methods that can operate on this data type through `SchemaProtocol` conformance.
/// Use `Schema` as a strong reference or owner of a `GArrowSchema` instance.
///

open class Schema: GLibObject.Object, SchemaProtocol {
        /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GArrowSchema>) {
        super.init(cPointer: op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GArrowSchema>) {
        super.init(raw: UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op)))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable override public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable override public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        super.init(raw: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GArrowSchema>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        super.init(cPointer: p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GArrowSchema>?) {
        guard let p = op else { return nil }
        super.init(cPointer: p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// Will retain `GArrowSchema`.
    /// i.e., ownership is transferred to the `Schema` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GArrowSchema>) {
        super.init(retainingCPointer: op)
    }

    /// Reference intialiser for a related type that implements `SchemaProtocol`
    /// Will retain `GArrowSchema`.
    /// - Parameter other: an instance of a related type that implements `SchemaProtocol`
    @inlinable public init<T: SchemaProtocol>(schema other: T) {
        super.init(retainingRaw: other.ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        super.init(cPointer: p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable override public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        super.init(retainingCPointer: cPointer)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    @inlinable override public init(retainingRaw raw: UnsafeRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable override public init(raw p: UnsafeMutableRawPointer) {
        super.init(raw: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable override public init(retainingRaw raw: UnsafeMutableRawPointer) {
        super.init(retainingRaw: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(opaquePointer p: OpaquePointer) {
        super.init(opaquePointer: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SchemaProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable override public init(retainingOpaquePointer p: OpaquePointer) {
        super.init(retainingOpaquePointer: p)
    }

    @inlinable public init<ListT: GLib.ListProtocol>( fields: ListT) {
        let rv = garrow_schema_new(fields._ptr)
        super.init(gpointer: (rv))
    }


}

public enum SchemaPropertyName: String, PropertyNameProtocol {
    case schema = "schema"
}

public extension SchemaProtocol {
    /// Bind a `SchemaPropertyName` source property to a given target object.
    /// - Parameter source_property: the source property to bind
    /// - Parameter target: the target object to bind to
    /// - Parameter target_property: the target property to bind to
    /// - Parameter flags: the flags to pass to the `Binding`
    /// - Parameter transform_from: `ValueTransformer` to use for forward transformation
    /// - Parameter transform_to: `ValueTransformer` to use for backwards transformation
    /// - Returns: binding reference or `nil` in case of an error
    @discardableResult @inlinable func bind<Q: PropertyNameProtocol, T: GLibObject.ObjectProtocol>(property source_property: SchemaPropertyName, to target: T, _ target_property: Q, flags f: BindingFlags = .default, transformFrom transform_from: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }, transformTo transform_to: @escaping GLibObject.ValueTransformer = { $0.transform(destValue: $1) }) -> BindingRef! {
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

    /// Get the value of a Schema property
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func get(property: SchemaPropertyName) -> GLibObject.Value {
        let v = GLibObject.Value()
        g_object_get_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
        return v
    }

    /// Set the value of a Schema property.
    /// *Note* that this will only have an effect on properties that are writable and not construct-only!
    /// - Parameter property: the property to get the value for
    /// - Returns: the value of the named property
    @inlinable func set(property: SchemaPropertyName, value v: GLibObject.Value) {
        g_object_set_property(ptr.assumingMemoryBound(to: GObject.self), property.rawValue, v.value_ptr)
    }
}

public enum SchemaSignalName: String, SignalNameProtocol {
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
    case notifySchema = "notify::schema"
}

public extension SchemaProtocol {
    /// Connect a `SchemaSignalName` signal to a given signal handler.
    /// - Parameter signal: the signal to connect
    /// - Parameter flags: signal connection flags
    /// - Parameter handler: signal handler to use
    /// - Returns: positive handler ID, or a value less than or equal to `0` in case of an error
    @inlinable @discardableResult func connect(signal kind: SchemaSignalName, flags f: ConnectFlags = ConnectFlags(0), to handler: @escaping GLibObject.SignalHandler) -> Int {
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

// MARK: Schema Class: SchemaProtocol extension (methods and fields)
public extension SchemaProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GArrowSchema` instance.
    @inlinable var schema_ptr: UnsafeMutablePointer<GArrowSchema>! { return ptr?.assumingMemoryBound(to: GArrowSchema.self) }

    @inlinable func addField<FieldT: FieldProtocol>(i: Int, field: FieldT) throws -> SchemaRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = SchemaRef(gconstpointer: gconstpointer(garrow_schema_add_field(schema_ptr, guint(i), field.field_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func equal<SchemaT: SchemaProtocol>(otherSchema: SchemaT) -> Bool {
        let rv = ((garrow_schema_equal(schema_ptr, otherSchema.schema_ptr)) != 0)
        return rv
    }

    @inlinable func getField(i: Int) -> FieldRef! {
        let rv = FieldRef(gconstpointer: gconstpointer(garrow_schema_get_field(schema_ptr, guint(i))))
        return rv
    }

    @inlinable func getFieldBy(name: UnsafePointer<gchar>!) -> FieldRef! {
        let rv = FieldRef(gconstpointer: gconstpointer(garrow_schema_get_field_by_name(schema_ptr, name)))
        return rv
    }

    @inlinable func getFieldIndex(name: UnsafePointer<gchar>!) -> Int {
        let rv = Int(garrow_schema_get_field_index(schema_ptr, name))
        return rv
    }

    @inlinable func getFields() -> GLib.ListRef! {
        let rv = GLib.ListRef(garrow_schema_get_fields(schema_ptr))
        return rv
    }

    @inlinable func getMetadata() -> GLib.HashTableRef! {
        let rv = GLib.HashTableRef(garrow_schema_get_metadata(schema_ptr))
        return rv
    }

    @inlinable func nFields() -> Int {
        let rv = Int(garrow_schema_n_fields(schema_ptr))
        return rv
    }

    @inlinable func removeField(i: Int) throws -> SchemaRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = SchemaRef(gconstpointer: gconstpointer(garrow_schema_remove_field(schema_ptr, guint(i), &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func replaceField<FieldT: FieldProtocol>(i: Int, field: FieldT) throws -> SchemaRef! {
        var error: UnsafeMutablePointer<GError>?
        let maybeRV = SchemaRef(gconstpointer: gconstpointer(garrow_schema_replace_field(schema_ptr, guint(i), field.field_ptr, &error)))
        if let error = error { throw GLibError(error) }
        guard let rv = maybeRV else { return nil }
        return rv
    }

    @inlinable func toString() -> String! {
        let rv = garrow_schema_to_string(schema_ptr).map({ String(cString: $0) })
        return rv
    }

    @inlinable func toStringMetadata(showMetadata: Bool) -> String! {
        let rv = garrow_schema_to_string_metadata(schema_ptr, gboolean((showMetadata) ? 1 : 0)).map({ String(cString: $0) })
        return rv
    }

    @inlinable func with<HashTableT: GLib.HashTableProtocol>(metadata: HashTableT) -> SchemaRef! {
        guard let rv = SchemaRef(gconstpointer: gconstpointer(garrow_schema_with_metadata(schema_ptr, metadata.hash_table_ptr))) else { return nil }
        return rv
    }
    @inlinable var fields: GLib.ListRef! {
        get {
            let rv = GLib.ListRef(garrow_schema_get_fields(schema_ptr))
            return rv
        }
    }

    @inlinable var metadata: GLib.HashTableRef! {
        get {
            let rv = GLib.HashTableRef(garrow_schema_get_metadata(schema_ptr))
            return rv
        }
    }

    @inlinable var parentInstance: GObject {
        get {
            let rv = schema_ptr.pointee.parent_instance
            return rv
        }
    }

}



