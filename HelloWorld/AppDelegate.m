//
//  AppDelegate.m
//  HelloWorld
//
//  Created by Yufei Cai on 21/03/14.
//  Copyright (c) 2014 fairlight. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    // initialize field sys to system-events app
    sys = [SBApplication applicationWithBundleIdentifier:@"com.apple.systemevents"];
    [sys activate];
    NSLog(@"%@", [sys description]);
}

- (IBAction)logFullName:(id)sender {
    NSLog(@"%@", [[sys currentUser] fullName]);
}

- (IBAction)activateChrome:(id)sender {
    SBElementArray* apps = [sys applicationProcesses];
    SystemEventsApplicationProcess *chrome = [apps objectWithName:@"Chrome"];

    NSArray *wins = [[chrome windows] get];
    SystemEventsWindow *win = [wins firstObject];
    NSLog(@"%@", [win name]);
    NSLog(@"%@", [[[win position] get] description]);

    // move window to top left
    [win setPosition:@[@0, @0]];
    
    // activate chrome
    [chrome setFrontmost:TRUE];
}
@end
