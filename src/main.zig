const std = @import("std");

const Color = struct {
    r: u8,
    g: u8,
    b: u8,
};

const animate: bool = true;

fn getRainbowColor(position: f64, offset: f64) Color {
    const p = position / 3.0 + offset * 3.0;
    const red = @sin(p / 10.0) * 127.0 + 128.0;
    const green = @sin(p / 10.0 + 2.0 * std.math.pi / 3.0) * 127.0 + 128.0;
    const blue = @sin(p / 10.0 + 4.0 * std.math.pi / 3.0) * 127.0 + 128.0;

    return .{ .r = @intFromFloat(red), .g = @intFromFloat(green), .b = @intFromFloat(blue) };
}

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const reader = stdin.reader();

    const stdout = std.io.getStdOut();
    const writer = stdout.writer();

    var buf: [1024]u8 = undefined;
    var fbs = std.io.fixedBufferStream(&buf);

    var lines: u32 = 0;
    try writer.print("\x1b[?25l", .{});
    while (true) {
        reader.streamUntilDelimiter(fbs.writer(), '\n', fbs.buffer.len) catch |err| switch (err) {
            error.EndOfStream => if (fbs.getWritten().len == 0) {
                break;
            },

            else => |e| return e,
        };

        const text = fbs.getWritten();

        if (animate) {
            const frames: u32 = 20;
            var frame: u32 = 0;

            try writer.print("\x1b[s", .{});
            while (frame < frames) : (frame += 1) {
                try writer.print("\x1b[u", .{});
                var idx: u32 = 0;
                for (text) |char| {
                    const color = getRainbowColor(@floatFromInt(idx), @floatFromInt(lines + frame));
                    try writer.print("\x1b[38;2;{d};{d};{d}m{c}\x1b[0m", .{ color.r, color.g, color.b, char });
                    idx += 1;
                }

                std.time.sleep(1_000_000_000 / 30);
            }
        } else {
            var idx: u32 = 0;
            for (text) |char| {
                const color = getRainbowColor(@floatFromInt(idx), @floatFromInt(lines));
                try writer.print("\x1b[38;2;{d};{d};{d}m{c}\x1b[0m", .{ color.r, color.g, color.b, char });
                idx += 1;
            }
        }

        try writer.print("\n", .{});
        lines += 1;

        fbs.reset();
    }
    try writer.print("\x1b[?25h", .{});
}
