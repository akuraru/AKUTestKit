#import "Kiwi.h"
#import "AKUNumberGenerator.h"

SPEC_BEGIN(NumberSpec)
    describe(@"NumberrGenerator", ^{
        describe(@"-between:end:", ^{
            let(from, ^{return @0;});
            let(to, ^{return @0;});
            let(expected, ^{return @([AKUNumberGenerator between:[from integerValue] end:[to integerValue]]);});
            context(@"form 0 ", ^{
                context(@"to 0", ^{
                    it(@"is 0", ^{[[expected should] equal:@0];});
                });
                context(@"to 1", ^{
                    let(to, ^{return @1;});
                    it(@"is 0 or 1", ^{[[@[@0, @1] should] contain:expected];});
                });
                context(@"to 2", ^{
                    let(to, ^{return @2;});
                    context(@"is 0,1 or 2", ^{
                        specify(^{[[@[@0, @1, @2] should] contain:expected];});
                    });
                    context(@"come up 0,1 and 2", ^{
                        let(expected, ^{
                            NSMutableSet *set = [NSMutableSet set];
                            for (int i = 0; i < 100; i++) {
                                [set addObject:@([AKUNumberGenerator between:[from integerValue] end:[to integerValue]])];
                            }
                            return [[set allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) { return [obj1 compare:obj2];}];
                        });
                        specify(^{[[@[@0, @1, @2] should] equal:expected];});
                    });
                });
                context(@"form 10 to 13", ^{
                    let(from, ^{return @10;});
                    let(to, ^{return @13;});
                    context(@"is 10, 11, 12 or 13", ^{
                        specify(^{[[@[@10, @11, @12, @13] should] contain:expected];});
                    });
                    context(@"come up 10, 11, 12 and 13", ^{
                        let(expected, ^{
                            NSMutableSet *set = [NSMutableSet set];
                            for (int i = 0; i < 100; i++) {
                                [set addObject:@([AKUNumberGenerator between:[from integerValue] end:[to integerValue]])];
                            }
                            return [[set allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) { return [obj1 compare:obj2];}];
                        });
                        specify(^{[[@[@10, @11, @12, @13] should] equal:expected];});
                    });
                });
            });
        });
        describe(@"-boolean", ^{
            context(@"is YES or NO", ^{
                let(expected, ^{return [AKUNumberGenerator boolean];});
                specify(^{[[@[@YES, @NO] should] contain:expected];});
            });
            context(@"come up YES and NO", ^{
                let(expected, ^{
                    NSMutableSet *set = [NSMutableSet set];
                    for (int i = 0; i < 100; i++) {
                        [set addObject:[AKUNumberGenerator boolean]];
                    }
                    return [[set allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) { return [obj1 compare:obj2];}];
                });
                specify(^{[[@[@NO, @YES] should] equal:expected];});
            });
        });
    });
SPEC_END