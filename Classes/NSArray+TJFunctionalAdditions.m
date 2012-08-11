//
//  NSArray+TJFunctionalAdditions.m
//  TJFunctionalAdditionsTests
//
//  Created by Tomasz Janeczko on 11.08.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+TJFunctionalAdditions.h"

@implementation NSArray (TJFunctionalAdditions)

- (void)each:(void (^)(id element))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

@end
