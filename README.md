TJFunctionalAdditions
=====================

Library simplifying the use of collection iterations through functional constructs like map, select, reject, etc.

They are simply used as categories, without the need for some cumbersome wrappers.

Methods
-------

Added to NSArray:
* each
* map
* filter
* reject
* reduce
* take
* last
* any
* all

Added to NSDictionary:
* each

Sample usage
------------

**NSArray**
```objective-c
// Filter
NSArray *filterResult = [testArray filter:^BOOL(NSNumber *element) {
    return [element intValue] % 2 == 0;
}];

// Map
NSArray *mapResult = [testArray map:^id(NSString *string) {
    return [string uppercaseString];
}];

// Any
BOOL anyElementGreaterThan = [testArray any:^BOOL(id element) {
    return [element intValue] > 10;
}];

// Reduce
NSNumber *number1 = [NSNumber numberWithInt:1];
NSNumber *number2 = [NSNumber numberWithInt:2];
NSNumber *number3 = [NSNumber numberWithInt:3];
NSNumber *number4 = [NSNumber numberWithInt:4];

NSArray *testArray = [NSArray arrayWithObjects:number1, number2, number3, number4, nil];

NSNumber *factorial = [testArray reduceWithInitialValue:[NSNumber numberWithInt:1] withBlock:^id(NSNumber *currentValue, NSNumber *element) {
    int factorial = [currentValue intValue] * [element intValue];
    return [NSNumber numberWithInt:factorial];
}];

```

**NSDictionary**
```objective-c
// Each
[dictionary each:^(NSString *key, NSNumber *value) {
    NSLog(@"There's value %i for key %@!", [value intValue], key);
}];

```

See more samples in Tests.