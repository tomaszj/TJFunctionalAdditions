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
* take
* last
* any
* all

Sample usage
------------

```objective-c
NSArray *filterResult = [testArray filter:^BOOL(NSNumber *element) {
    return [element intValue] % 2 == 0;
}];

NSArray *mapResult = [testArray map:^id(NSString *string) {
    return [string uppercaseString];
}];

BOOL anyElementGreaterThan = [testArray any:^BOOL(id element) {
    return [element intValue] > 10;
}];
```

See more samples in Tests.