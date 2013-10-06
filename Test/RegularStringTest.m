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

@interface RegularBase : NSObject
- (NSString *)string;
@end
@interface RegularOneString : RegularBase
@end
@interface RegularWord : RegularBase
+ (RegularBase *)generat;
@end
@interface RegularAlphabet : RegularWord
@end
@interface RegularWords : RegularWord
@end
@interface RegularAll : RegularWord
@end
@interface RegularSpaceSet : RegularWord
@end
@interface RegularNumber : RegularWord
@end
@interface RegularHorizontalTab : RegularWord
@end
@interface RegularVerticalTab : RegularWord
@end
@interface RegularNewline : RegularWord
@end
@interface RegularReturn : RegularWord
@end
@interface RegularBackSpace : RegularWord
@end
@interface RegularFormFeed : RegularWord
@end
@interface RegularBell : RegularWord
@end
@interface RegularEscape : RegularWord
@end
@interface RegularBackslash : RegularWord
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
    XCTAssertEqualObjects([[RegularBackslash generat] string], @"\\", @"Back");
}

@end
