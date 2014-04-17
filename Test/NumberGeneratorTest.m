#import "AKUNumberGenerator.h"

@interface NumberGeneratorTest : XCTestCase
@end

@implementation NumberGeneratorTest

- (void)testBetweenFrom0to0 {
    NSInteger result = [AKUNumberGenerator between:0 end:0];
    XCTAssertEqual(result, 0, @"");
}

- (void)testBetweenFrom0to1 {
    NSInteger result = [AKUNumberGenerator between:0 end:1];
    XCTAssertTrue(result == 0 || result == 1, @"");
}

- (void)testBetweenFrom0to2 {
    NSInteger result = [AKUNumberGenerator between:0 end:1];
    XCTAssertTrue(result == 0 || result == 1 || result == 2, @"");
}

- (void)testBoolean {
    NSNumber *b = [AKUNumberGenerator boolean];
    XCTAssertTrue(b.boolValue == NO || b.boolValue == YES, @"");
}

- (void)testAllBoolean {
    NSMutableSet *set = [NSMutableSet set];
    for (int i = 0; i < 100; i++) {
        [set addObject:[AKUNumberGenerator boolean]];
        if (set.count == 2)
            break;
    }
    NSSet *result = [NSSet setWithObjects:@YES, @NO, nil];
    XCTAssertEqualObjects(set, result, @"");
}
@end
