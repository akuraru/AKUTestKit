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
    NSInteger result = [AKUNumberGenerator between:0 end:2];
    XCTAssertTrue(result == 0 || result == 1 || result == 2, @"");
}

- (void)testAllBetweenFrom0to2 {
    NSMutableSet *set = [NSMutableSet set];
    for (int i = 0; i < 100; i++) {
        [set addObject:@([AKUNumberGenerator between:0 end:2])];
        if (set.count == 3)
            break;
    }
    NSSet *result = [NSSet setWithObjects:@0, @1, @2, nil];
    XCTAssertEqualObjects(set, result, @"");
}

- (void)testAllBetweenFrom_1to1 {
    NSMutableSet *set = [NSMutableSet set];
    for (int i = 0; i < 100; i++) {
        [set addObject:@([AKUNumberGenerator between:10 end:13])];
        if (set.count == 4)
            break;
    }
    NSSet *result = [NSSet setWithObjects:@10, @11, @12, @13, nil];
    XCTAssertEqualObjects(set, result, @"");
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
