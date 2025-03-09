const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const extra = b.dependency("zig_extras", .{}).module("extras");


    
    const trace = b.addModule("zig-tracer", .{
        .root_source_file = b.path("src/mod.zig"),
        .target = target,
        .optimize = optimize,
    });

    trace.addImport("extras", extra);
}
