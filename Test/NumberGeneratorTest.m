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

@end
