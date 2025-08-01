const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const argc = args.len;
    if (argc < 2) {
        std.debug.print("not enough arguments", .{});
    }
    const filename = args[1];

    const file = try std.fs.cwd().openFile(filename, .{});
    defer file.close();

    const stat = try file.stat();
    const fsize = stat.size;

    const contents = try file.readToEndAlloc(allocator, fsize);
    defer allocator.free(contents);

    var line_itr = std.mem.splitScalar(u8, contents, '\n');

    var _1 = std.ArrayList(i32).init(allocator);
    var _2 = std.ArrayList(i32).init(allocator);
    while (line_itr.next()) |slice| {
        var slice_itr = std.mem.tokenizeScalar(u8, slice, ' ');
        if (slice_itr.next()) |first| {
            const num = try std.fmt.parseInt(i32, first, 10);
            try _1.append(num);
        }
        if (slice_itr.next()) |sec| {
            const num = try std.fmt.parseInt(i32, sec, 10);
            try _2.append(num);
        }
    }

    std.sort.pdq(i32, _1.items, {}, std.sort.asc(i32));
    std.sort.pdq(i32, _2.items, {}, std.sort.asc(i32));

    var ans: u32 = 0;
    for (0.._1.items.len) |i| {
        ans += @abs(_1.items[i] - _2.items[i]);
    }
    std.debug.print("{}", .{ans});
}
