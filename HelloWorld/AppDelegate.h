//
//  AppDelegate.h
//  HelloWorld
//
//  Created by Yufei Cai on 21/03/14.
//  Copyright (c) 2014 fairlight. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Hint.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    SystemEventsApplication *sys;
    
    Hint* dummyHint;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)logFullName:(id)sender;
- (IBAction)activateChrome:(id)sender;
- (IBAction)logUIElements:(id)sender;
- (IBAction)popUpAWindowSomewhere:(id)sender;

@end
