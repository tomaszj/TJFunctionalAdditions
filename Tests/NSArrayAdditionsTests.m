/**
 * TJFunctionalAdditionsTests
 *
 * Created by Tomasz Janeczko 2012
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#import "NSArrayAdditionsTests.h"
#import "NSArray+TJFunctionalAdditions.h"

@implementation NSArrayAdditionsTests

#pragma mark - - [NSArray each:] tests
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

#pragma mark - - [NSArray map:] tests

- (void)testIfMapReturnsAnEmptyArrayOnEmptyArray {
    NSArray *testArray = [NSArray new];
    
    id result = [testArray map:^id(id element) {
        return element;
    }];
    
    STAssertNotNil(result, @"Should not be nil");
    STAssertTrue([result isKindOfClass:[NSArray class]], @"Should have returned a NSArray instance");
}

- (void)testIfMapExecutesForEachObject {
    NSArray *testArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    
    NSMutableArray *executedObjects = [NSMutableArray new];
    
    [testArray map:^id(id element) {
        [executedObjects addObject:element];
        return element;
    }];
    
    STAssertEqualObjects(testArray, executedObjects, @"Arrays should be equal");
}

- (void)testIfProcessesObjects {
    NSNumber *number1 = [NSNumber numberWithInt:1];
    NSNumber *number2 = [NSNumber numberWithInt:2];
    NSNumber *number3 = [NSNumber numberWithInt:3];
    NSNumber *number4 = [NSNumber numberWithInt:4];
    
    NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];

    NSNumber *result1 = [NSNumber numberWithInt:1];
    NSNumber *result2 = [NSNumber numberWithInt:4];
    NSNumber *result3 = [NSNumber numberWithInt:9];
    NSNumber *result4 = [NSNumber numberWithInt:16];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:result1, result2, result3, result4, nil];
    
    NSArray *resultArray = [testArray map:^id(id element) {
        int value = [element intValue];
        int squaredValue = value * value;
        return [NSNumber numberWithInt:squaredValue];
    }];

    STAssertEqualObjects(resultArray, expectedArray, @"Arrays should be the same");
}

#pragma mark - - [NSArray filter:] tests

- (void)testIfFilterReturnsEmptyArrayOnEmptyArray {
    NSArray *testArray = [NSArray new];
    
    id resultArray = [testArray filter:^BOOL(id element) {
        return YES;
    }];
    
    STAssertNotNil(resultArray, @"Result should not be nil");
    STAssertTrue([resultArray isKindOfClass:[NSArray class]], @"Should be of type NSArray");
}

- (void)testIfFilterLeavesObjectsPassingTheTest {
    NSNumber *number1 = [NSNumber numberWithInt:1];
    NSNumber *number2 = [NSNumber numberWithInt:2];
    NSNumber *number3 = [NSNumber numberWithInt:3];
    NSNumber *number4 = [NSNumber numberWithInt:4];
    
    NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];
    
    NSArray *resultArray = [testArray filter:^BOOL(id element) {
        return [element intValue] % 2 == 0;
    }];
    
    STAssertTrue([resultArray containsObject:number2], @"Should have left number 2");
    STAssertTrue([resultArray containsObject:number4], @"Should have left number 4");
}

- (void)testIfFilterRemovesObjectsFailingTheTest {
    NSNumber *number1 = [NSNumber numberWithInt:1];
    NSNumber *number2 = [NSNumber numberWithInt:2];
    NSNumber *number3 = [NSNumber numberWithInt:3];
    NSNumber *number4 = [NSNumber numberWithInt:4];
    
    NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];
    
    NSArray *resultArray = [testArray filter:^BOOL(id element) {
        return [element intValue] % 2 == 0;
    }];
    
    STAssertTrue([resultArray containsObject:number2], @"Should have left number 2");
    STAssertTrue([resultArray containsObject:number4], @"Should have left number 4");
    STAssertTrue([resultArray count] == 2, @"Should have reduced the number of elements");

    STAssertFalse([resultArray containsObject:number1], @"Should have removed number 1");
    STAssertFalse([resultArray containsObject:number3], @"Should have removed number 3");
}

#pragma mark - - [NSArray reject:] tests

- (void)testIfRejectReturnsEmptyArrayOnEmptyArray {
    NSArray *testArray = [NSArray new];
    
    id resultArray = [testArray reject:^BOOL(id element) {
        return YES;
    }];
    
    STAssertNotNil(resultArray, @"Result should not be nil");
    STAssertTrue([resultArray isKindOfClass:[NSArray class]], @"Should be of type NSArray");
}

- (void)testIfRejectLeavesObjectsFailingTheTest {
    NSNumber *number1 = [NSNumber numberWithInt:1];
    NSNumber *number2 = [NSNumber numberWithInt:2];
    NSNumber *number3 = [NSNumber numberWithInt:3];
    NSNumber *number4 = [NSNumber numberWithInt:4];
    
    NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];
    
    NSArray *resultArray = [testArray reject:^BOOL(id element) {
        return [element intValue] % 2 == 0;
    }];
    
    STAssertTrue([resultArray containsObject:number1], @"Should have left number 1");
    STAssertTrue([resultArray containsObject:number3], @"Should have left number 3");
}

- (void)testIfRejectRemovesObjectsPassingTheTest {
    NSNumber *number1 = [NSNumber numberWithInt:1];
    NSNumber *number2 = [NSNumber numberWithInt:2];
    NSNumber *number3 = [NSNumber numberWithInt:3];
    NSNumber *number4 = [NSNumber numberWithInt:4];
    
    NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];
    
    NSArray *resultArray = [testArray reject:^BOOL(id element) {
        return [element intValue] % 2 == 0;
    }];
    
    STAssertTrue([resultArray containsObject:number1], @"Should have left number 1");
    STAssertTrue([resultArray containsObject:number3], @"Should have left number 3");
    STAssertTrue([resultArray count] == 2, @"Should have reduced the number of elements");
    
    STAssertFalse([resultArray containsObject:number2], @"Should have removed number 2");
    STAssertFalse([resultArray containsObject:number4], @"Should have removed number 4");
}
@end
