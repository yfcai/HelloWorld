//
//  Hint.h
//  HelloWorld
//
//  Created by Yufei Cai on 29/03/14.
//  Copyright (c) 2014 fairlight. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SystemEvents.h"

@interface Hint : NSWindow {
    SystemEventsAction* action;
}

-(id)initWithRandomStuff;

@end
