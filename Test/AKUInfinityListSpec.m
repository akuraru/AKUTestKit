#import "Kiwi.h"
#import "AKUInfinityList.h"

SPEC_BEGIN(InfinityListSpec)
    describe(@"InfinityList", ^{
        let(list, ^{
            return [AKUInfinityList listWithBlock:^id(NSUInteger index) {
                return @(index);
            }];
        });
        describe(@"-take", ^{
            context(@"1", ^{
                let(expected, ^{return [list take:1];});
                specify(^{[[expected should] equal:@[@0]];});
            });
            context(@"5", ^{
                let(expected, ^{return [list take:5];});
                specify(^{[[expected should] equal:@[@0, @1, @2, @3, @4]];});
            });
        });
        describe(@"-objectAtIndexedSubscript:", ^{
            context(@"0", ^{
                let(expected, ^{return list[0];});
                specify(^{[[expected should] equal:@0];});
            });
        });
    });
SPEC_END