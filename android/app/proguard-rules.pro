#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class de.prosiebensat1digital.** { *; }

-dontwarn com.google.android.play.core.**

# --- JNI / FFI 插件 keep 规则（release 开启 minify 时必需）---
# 这些插件通过 DynamicLibrary / dart:ffi 反射调用 Java 类与 native 方法，
# 被 R8 裁掉后表现为“能编过、装完启动崩”（NoClassDefFoundError / UnsatisfiedLinkError）。
-keep class com.github.dart_lang.jni.** { *; }
-keep class com.github.dart_lang.jni_flutter.** { *; }

# native 方法名不能被改名
-keepclasseswithmembernames class * {
    native <methods>;
}

# 插件注册入口
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }
-keep class * implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }

# 保留行号，便于线上崩溃定位
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile
