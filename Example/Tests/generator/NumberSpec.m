#import "AKUNumberGenerator.h"
#import "AKUChiSquaredTest.h"


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
                    it(@"check all contein", ^{
                        NSArray *values = [self countValue:@[@0, @1] block:^id{
                            return @([AKUNumberGenerator between:[from integerValue] end:[to integerValue]]);
                        } count:100];
                        BOOL expr = [AKUChiSquaredTest observedCounts:values willFit:@[@0.5, @0.5] at:0.01];
                        [[theValue(expr) should] equal:theValue(YES)];
                    });
                });
                context(@"to 2", ^{
                    let(to, ^{return @2;});
                    context(@"is 0,1 or 2", ^{
                        specify(^{[[@[@0, @1, @2] should] contain:expected];});
                    });
                    it(@"check all contein", ^{
                        NSArray *values = [self countValue:@[@0, @1, @2] block:^id{
                            return @([AKUNumberGenerator between:[from integerValue] end:[to integerValue]]);
                        } count:100];
                        BOOL expr = [AKUChiSquaredTest observedCounts:values willFit:@[@0.333, @0.333, @0.334] at:0.01];
                        [[theValue(expr) should] equal:theValue(YES)];
                    });
                });
            });
            context(@"form 10 to 13", ^{
                let(from, ^{return @10;});
                let(to, ^{return @13;});
                context(@"is 10, 11, 12 or 13", ^{
                    specify(^{[[@[@10, @11, @12, @13] should] contain:expected];});
                });
                it(@"check all contein", ^{
                    NSArray *values = [self countValue:@[@10, @11, @12, @13] block:^id{
                        return @([AKUNumberGenerator between:[from integerValue] end:[to integerValue]]);
                    } count:100];
                    BOOL expr = [AKUChiSquaredTest observedCounts:values willFit:@[@0.25, @0.25, @0.25, @0.25] at:0.01];
                    [[theValue(expr) should] equal:theValue(YES)];
                });
            });
            context(@"from -1", ^{
                let(from, ^{return @-1;});
                context(@"to 0", ^{
                    let(to, ^{return @0;});
                    context(@"is -1 or 0", ^{
                        specify(^{[[@[@-1, @0] should] contain:expected];});
                    });
                    it(@"check all contein", ^{
                        NSArray *values = [self countValue:@[@-1, @0] block:^id{
                            return @([AKUNumberGenerator between:[from integerValue] end:[to integerValue]]);
                        } count:100];
                        BOOL expr = [AKUChiSquaredTest observedCounts:values willFit:@[@0.5, @0.5] at:0.01];
                        [[theValue(expr) should] equal:theValue(YES)];
                    });
                });
            });
        });
        describe(@"-boolean", ^{
            context(@"is YES or NO", ^{
                let(expected, ^{return [AKUNumberGenerator boolean];});
                specify(^{[[@[@YES, @NO] should] contain:expected];});
            });
            it(@"check all contein", ^{
                NSArray *values = [self countValue:@[@NO, @YES] block:^id{
                    return [AKUNumberGenerator boolean];
                } count:100];
                BOOL expr = [AKUChiSquaredTest observedCounts:values willFit:@[@0.5, @0.5] at:0.01];
                [[theValue(expr) should] equal:theValue(YES)];
            });
        });
        describe(@"-double", ^{
            let(from, ^{return @0;});
            let(to, ^{return @0;});
            let(expected, ^{return @([AKUNumberGenerator doubleBetween:[from doubleValue] and:[to doubleValue]]);});
            context(@"form 0 ", ^{
                context(@"to 0", ^{
                    it(@"is 0", ^{[[expected should] equal:@0];});
                });
                context(@"to 1", ^{
                    let(to, ^{return @1;});
                    it(@"is between 0 and 1", ^{[[expected should] beBetween:theValue(0) and:theValue(1)];});
                });
            });
            context(@"from 0.1", ^{
                let(from, ^{return @0.1;});
                context(@"to 0.9", ^{
                    let(to, ^{return @0.9;});
                    it(@"is between 0 and 1", ^{[[expected should] beBetween:theValue(0) and:theValue(1)];});
                    it(@"is not 0", ^{[[expected shouldNot] equal:@0];});
                    it(@"is not 1", ^{[[expected shouldNot] equal:@1];});
                });
            });
            context(@"from -0.9", ^{
                let(from, ^{return @-0.9;});
                context(@"to 0", ^{
                    let(to, ^{return @0;});
                    it(@"is between -1 and 1", ^{[[expected should] beBetween:theValue(-1) and:theValue(0)];});
                    it(@"is not -1", ^{[[expected shouldNot] equal:@-1];});
                    it(@"is not 0", ^{[[expected shouldNot] equal:@0];});
                });

            });
        });
    });
}

+ (NSArray *)countValue:(NSArray *)keys block:(id(^)())block count:(NSInteger)count {
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        d[obj] = @0;
    }];
    for (int i = 0; i < 100; ++i) {
        id k = block();
        d[k] = @([d[k] integerValue] + 1);
    }
    return d.allValues;
SPEC_END