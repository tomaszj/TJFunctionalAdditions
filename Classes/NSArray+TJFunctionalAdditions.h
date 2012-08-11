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


@interface NSArray (TJFunctionalAdditions)

/**
 * Enumerates each element in the array in order, passing the object to the block.
 *
 * @param block to be executed for each element
 */
- (void)each:(void(^)(id element))block;

/**
 * Returns an array of elements passing the test.
 *
 * @param test block to be executed for each element
 * @return array of elements passing the test given
 */
- (NSArray *)filter:(BOOL(^)(id element))testBlock;

/**
 * Returns an array of elements removing those passing the test.
 *
 * @param test block to be executed for each element
 * @return array of elements with those passing the test rejected
 */
- (NSArray *)reject:(BOOL(^)(id element))testBlock;


@end
