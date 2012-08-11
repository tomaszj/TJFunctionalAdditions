//
//  NSArray+TJFunctionalAdditions.h
//  TJFunctionalAdditionsTests
//
//  Created by Tomasz Janeczko on 11.08.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface NSArray (TJFunctionalAdditions)

/**
 * Enumerates each element in the array in order, passing the object to the block.
 *
 * @param block to be executed for each element
 */
- (void)each:(void(^)(id element))block;

@end
