//
//  Hint.m
//  HelloWorld
//
//  Created by Yufei Cai on 29/03/14.
//  Copyright (c) 2014 fairlight. All rights reserved.
//

#import "Hint.h"

@implementation Hint

- (id) initWithRandomStuff {
    NSRect frame = NSMakeRect(100, 100, 200, 200);
    NSUInteger styleMask = NSBorderlessWindowMask;
    NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
    self = [super
            initWithContentRect:rect
            styleMask:styleMask
            backing:NSBackingStoreBuffered
            defer:false
            ];
    if (self) {
        [self setBackgroundColor:[NSColor blueColor]];
        [self makeKeyAndOrderFront:NSApp];
        
        // experiment: set window without border
        // somehow this square has no shadow already
        //[self setStyleMask:NSBorderlessWindowMask];
        //[self setHasShadow:FALSE];
    }
    else {
        NSLog(@"Hint initialization failed");
    }
    return self;
}
@end
