//
//  NSArrayAdditionsTests.m
//  TJFunctionalAdditionsTests
//
//  Created by Tomasz Janeczko on 11.08.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArrayAdditionsTests.h"
#import "NSArray+TJFunctionalAdditions.h"

@implementation NSArrayAdditionsTests

- (void)testIfEachDoesntExecuteWhenEmptyArray {
    __block int blockCount = 0;
    
    NSArray *emptyArray = [NSArray new];
    
    [emptyArray each:^(id element) {
        blockCount++;
    }];
    
    STAssertTrue(blockCount == 0, @"Should not have executed the block.");
}

- (void)testIfEachExecutesOnceWithSingleElement {
    __block int blockCount = 0;
    
    NSObject *testObject = [NSObject new];
    NSArray *arrayWithSingleElement = [NSArray arrayWithObject:testObject];
    
    [arrayWithSingleElement each:^(id element) {
        blockCount++;
        
        STAssertTrue(element == testObject, @"Object passed should be the same as test object");
    }];
    
    STAssertTrue(blockCount == 1, @"Should have executed the block once.");
}

- (void)testIfEachExecutesMultipleElementsInOrder {
    __block int blockCount = 0;
    
    NSObject *testObject1 = [NSObject new];
    NSObject *testObject2 = [NSObject new];
    
    NSArray *arrayWithSingleElement = [NSArray arrayWithObjects:testObject1, testObject2, nil];
    
    NSMutableArray *testArray = [NSMutableArray new];
    
    [arrayWithSingleElement each:^(id element) {
        blockCount++;
        
        [testArray addObject:element];
    }];
    
    STAssertTrue(blockCount == 2, @"Should have executed the block twice.");
    STAssertTrue([testArray objectAtIndex:0] == testObject1, @"Should contain object 1");
    STAssertTrue([testArray objectAtIndex:1] == testObject2, @"Should contain object 1");
}

@end
