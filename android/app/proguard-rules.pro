# Preserve Flutter-specific classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep classes used in reflection
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Add rules for any third-party libraries you're using that may be affected by R8
# Example: If you are using a barcode scanner library:
-keep class com.flutter.barcode_scanner.** { *; }