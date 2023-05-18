// The zig standard library, required to print to the console
const std = @import("std");
// A local zig file can be imported using the relative path
const test_suite = @import("./test.zig");

// The main function is the entry point of the program
// Functions are declared with fn, and are private by default
// Public functions are declared with the pub specifier; main MUST be public
// The return type is void, and the bang (!) allows for errors to be returned as well
// In zig, errors are often derived from an error set (more on those later)
pub fn main() !void {

    // Zig has no explicit string type, but strings can be created in multiple ways
    // A string literal is a constant pointer to a null-terminated array of bytes.
    // An array of bytes is considered null terminated if it has the type [_:0]u8
    // Where _ represents the size of the array in bytes
    // The u8 datatype represents a unsigned 8 bit value, which allows for most UTF-8 characters
    const my_literal = "Hello world!"; // *const [12:0]u8
    const my_string: [3:0]u8 = .{ 'F', 'o', 'o' }; // [3]u8
    const my_infer = [_:0]u8{ 'B', 'a', 'r', '!' }; // [4]u8
    // The standard output stream can be accessed from the standard library (std)
    const stdout = std.io.getStdOut().writer();
    // Writing to standard output can fail, so we must use the try keyword

    // print can be formatted using {x} where x represents the type to be printed
    // in this case, 's' is used as we are printing strings
    try stdout.print("{s}\n", .{my_literal});
    try stdout.print("{s} {s}\n", .{ my_string, my_infer });
}

// test "simple test" {
//     var list = std.ArrayList(i32).init(std.testing.allocator);
//     defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
//     try list.append(42);
//     try std.testing.expectEqual(@as(i32, 42), list.pop());
// }
