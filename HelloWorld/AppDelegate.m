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

    NSWindow* win = [self window];

    // initialize field sys to system-events app
    sys = [SBApplication applicationWithBundleIdentifier:@"com.apple.systemevents"];
    [sys activate];
    //NSLog(@"%@", [sys description]);

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

- (SystemEventsButton*)getDummyButton {
    SBElementArray* apps = [sys applicationProcesses];
    SystemEventsApplicationProcess *app = [apps objectWithName:@"System Preferences"];
    
    //NSArray* uis = [[app UIElements] get];
    
    NSArray *wins = [[app windows] get];
    SystemEventsWindow *win = [wins firstObject];
    
    NSArray* uis = [[win UIElements] get];
    
    return [uis objectAtIndex:4];
}

// this works only if "system preferences" is open and
- (IBAction)logUIElements:(id)sender {
    SystemEventsButton* button4 = [self getDummyButton];
    
    SystemEventsAction* press = [[[button4 actions] get] objectAtIndex:0];
    
    // press the button!
    [press perform];
    
    
    NSString* show = [press name];
    
    NSLog(@"%@", show);
}


- (IBAction)popUpAWindowSomewhere:(id)sender {
    dummyHint = [[Hint alloc] initWithRandomStuff];
}


@end
