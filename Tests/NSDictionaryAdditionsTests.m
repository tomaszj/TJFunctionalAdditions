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

#import "NSDictionaryAdditionsTests.h"
#import "NSDictionary+TJFunctionalAdditions.h"

@implementation NSDictionaryAdditionsTests

#pragma mark - - [NSDictionary each:] tests
- (void)testIfEachDoesntExecuteWhenEmptyDictionary {
    __block int blockCount = 0;
    
    NSDictionary *emptyDict = [NSDictionary new];
    
    [emptyDict each:^(id key, id value) {
        blockCount++;
    }];
    
    STAssertTrue(blockCount == 0, @"Should not have executed the block.");
}

- (void)testIfEachExecutesOnceWithSingleElement {
    __block int blockCount = 0;
    
    NSObject *testObject = [NSObject new];
    NSObject *testKey = @"1";
    NSDictionary *singlePairDict = [[NSDictionary alloc] initWithObjectsAndKeys:testObject, testKey, nil];
    
    [singlePairDict each:^(id key, id value) {
        blockCount++;
        
        STAssertEquals(testKey, key, @"Keys should be the same");
        STAssertEquals(testObject, value, @"Values should be the same");        
    }];
    
    STAssertTrue(blockCount == 1, @"Should have executed the block once.");
}

- (void)testIfEachAllowsTypedArgumentInBlock {
    __block int blockCount = 0;
    
    NSNumber *testObject = [NSNumber numberWithInt:1];
    NSString *testKey = @"1";

    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:testObject, testKey, nil];
    
    [dictionary each:^(NSString *key, NSNumber *value) {
        blockCount++;
        
        STAssertTrue([testKey isEqualToString:key], @"Key passed should be the same as test key");
        STAssertTrue([testObject intValue] == [value intValue], @"Values should be the same");
    }];
        
    STAssertTrue(blockCount == 1, @"Should have executed the block once.");
}


@end
