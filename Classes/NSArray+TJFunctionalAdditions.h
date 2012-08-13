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

/**
 * Category adding typical functional constructs to NSArray class.
 */
@interface NSArray (TJFunctionalAdditions)

/**
 * Enumerates each element in the array in order, passing the object to the block.
 *
 * @param block to be executed for each element
 */
- (void)each:(void(^)(id element))block;

/**
 * Returns an array of elements, each processed by the block given.
 *
 * @param block which processes each object
 * @return array of processed elements
 */
- (NSArray *)map:(id(^)(id element))block;

/**
 * Returns an array of elements passing the test.
 *
 * @param testBlock to be executed for each element
 * @return array of elements passing the test given
 */
- (NSArray *)filter:(BOOL(^)(id element))testBlock;

/**
 * Returns an array of elements removing those passing the test.
 *
 * @param testBlock to be executed for each element
 * @return array of elements with those passing the test rejected
 */
- (NSArray *)reject:(BOOL(^)(id element))testBlock;

/**
 * Reduces the array to a value, using block for each element with the inital value given.
 *
 * @param initialValue used to determine start conditions
 * @param block applied to each element
 */
- (id)reduceWithInitialValue:(id)initialValue withBlock:(id(^)(id currentValue, id element))block;

/**
 * Returns first n elements of the array.
 *
 * @param count of elements to be taken
 * @return array of first n elements. If count is greater than the length of an array, it returns all objects
 */
- (NSArray *)take:(NSUInteger)count;

/**
 * Returns last n elements of the array.
 *
 * @param count of elements to be taken
 * @return array of last n elements. If count is greater than the length of an array, it returns all objects
 */
- (NSArray *)last:(NSUInteger)count;

/**
 * Checks if all array's elements pass the test.
 *
 * @param testBlock executed for each element
 * @return YES if all elements pass the test
 */
- (BOOL)all:(BOOL(^)(id element))testBlock;

/**
 * Checks if any of array's elements passes the test.
 *
 * @param testBlock executed for each element
 * @return YES if at least one element passes the test
 */
- (BOOL)any:(BOOL(^)(id element))testBlock;

@end
