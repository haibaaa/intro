const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    if (args.len < 2) {
        try die("Usage: {s} <server address>", .{args[0]});
    }
    // create socket
    const sockfd = try std.posix.socket(
        std.posix.AF.INET,
        std.posix.SOCK.STREAM, // use STREAM for TCP, not SOCK.DGRAM (UDP)
        0,
    );
    defer std.posix.close(sockfd);
    // parse address
    const addr = try std.net.Address.parseIp4(args[1], 80);
    // connect to server
    try std.posix.connect(sockfd, &addr.any, addr.getOsSockLen());
    // write HTTP GET request
    const req: []const u8 = "GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n";
    _ = try std.posix.write(sockfd, req);
    // read and print response
    var buf: [8192]u8 = undefined;
    while (true) {
        const n = try std.posix.read(sockfd, &buf);
        if (n == 0) break; // EOF
        try std.io.getStdOut().writeAll(buf[0..n]);
    }
}

pub fn die(comptime fmt: []const u8, args: anytype) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print(fmt, args);
    try stdout.print("\n", .{});
    std.process.exit(1);
}
