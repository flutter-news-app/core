// Exports the network adapter configuration.
//
// **NOTE:** This file must ONLY export `http_adapter.dart`.
//
// We intentionally do not export `http_adapter_io.dart` or `http_adapter_web.dart`
// directly. Exporting them unconditionally forces the Dart compiler to parse
// platform-specific code (e.g., `package:web` or `dart:io`) regardless of the
// target platform. This leads to compilation errors (e.g., "JSArray isn't a type"
// on the VM) because the conditional import logic in `http_adapter.dart` is bypassed.
export 'http_adapter.dart';
