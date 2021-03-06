//
//  Entry.m
//  Journal-C
//
//  Created by Emily Mearns on 5/31/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

#import "Entry.h"

@implementation Entry

static NSString const *timestampKey = @"timestamp";
static NSString const *titleKey = @"title";
static NSString const *bodyTextKey = @"bodytext";

- (instancetype)initWithTitle:(NSString *)title andBodyText:(NSString *)bodyText andTimestamp:(NSDate *)timestamp {
    self= [super init];
    if (self) {
        self.title = title;
        self.bodyText = bodyText;
        self.timestamp = timestamp;
    }
    return self;
}



@end
