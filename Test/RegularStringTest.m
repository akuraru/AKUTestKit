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
}

@end
