//
//  RegularStringTest.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/10/05.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "RegularString.h"

@interface RegularStringTest : XCTestCase
@end

@implementation RegularStringTest

- (void)testRegularTest {
    NSString *sample = @"hoge";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertEqualObjects(result, sample, @"eq");
}
- (void)testRegularTestW {
    NSString *sample = @"hoge\\w";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertNotEqualObjects(result, sample, @"\\wはパターン");
    XCTAssertTrue(result.length == 5, @"length 5");
}
- (void)testRegularTestDot {
    NSString *sample = @"hoge.";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertNotEqualObjects(result, sample, @"\\wはパターン");
    XCTAssertTrue(result.length == 5, @"length 5");
}
- (void)testRegularTestNewline {
    NSString *sample = @"hoge\\n";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertEqualObjects(result, @"hoge\n", @"\\nを\nに変換");
}
- (void)testRegularBackslash {
    NSString *sample = @"hoge\\\\";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertEqualObjects(result, @"hoge\\", @"\\\\を\\に変換");
}
- (void)testRegularAst {
    NSString *sample = @"\\\\*";
    NSString *result = [[RegularString alloc] stringForRefular:sample];
    XCTAssertNotEqualObjects(result, @"\\*", @"そのままではない");
    XCTAssertTrue(0 <= result.length && result.length <= 16, @"repeat");
}

@end
