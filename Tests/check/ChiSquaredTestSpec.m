//
// Created by akuraru on 2014/07/23.
//

#import "Kiwi.h"
#import "AKUChiSquaredTest.h"

@interface AKUChiSquaredTest ()
+ (double)chiSquare:(NSArray *)array probaby:(NSArray *)probaby;
+ (double)q_chi2:(NSInteger)df chi2:(double)chi2;
@end

SPEC_BEGIN(ChiSquaredTestSpec)
    describe(@"ChiSquaredTest", ^{
        describe(@"q_chi2:chi2:", ^{
            it(@"df 1, p 3.841 is about 0.05", ^{
                [[theValue([AKUChiSquaredTest q_chi2:1 chi2:3.841]) should] equal:0.05 withDelta:0.0001];
            });
            it(@"df 1, p 6.635 is about 0.01", ^{
                [[theValue([AKUChiSquaredTest q_chi2:1 chi2:6.635]) should] equal:0.01 withDelta:0.0001];
            });
            it(@"df 3, p 11.345 is about 0.01", ^{
                [[theValue([AKUChiSquaredTest q_chi2:3 chi2:11.345]) should] equal:0.01 withDelta:0.0001];
            });
        });
        describe(@"chiSquare:probaby:", ^{
            it(@"50, 50 is 0", ^{
                double o = [AKUChiSquaredTest chiSquare:@[@50, @50] probaby:@[@0.5, @0.5]];
                [[theValue(o) should] equal:0 withDelta:0.01];
            });
            it(@"62, 38 is under 6.635", ^{
                double o = [AKUChiSquaredTest chiSquare:@[@62, @38] probaby:@[@0.5, @0.5]];
                [[theValue(o) should] beLessThan:theValue(6.635)];
            });
            it(@"62, 38 is over 6.635", ^{
                double o = [AKUChiSquaredTest chiSquare:@[@63, @37] probaby:@[@0.5, @0.5]];
                [[theValue(o) should] beGreaterThan:theValue(6.635)];
            });
            it(@"blood type rate is 2.41", ^{
                double o = [AKUChiSquaredTest chiSquare:@[@37, @25, @12, @26] probaby:@[@0.4, @0.2, @0.1, @0.3]];
                [[theValue(o) should] equal:2.41 withDelta:0.01];
            });
        });
        describe(@"observeredCounts:willFit:at:", ^{
            context(@"df 1", ^{
                it(@"50, 50 is YES", ^{
                    BOOL observered = [AKUChiSquaredTest observedCounts:@[@50, @50] willFit:@[@0.5, @0.5] at:0.01];
                    [[theValue(observered) should] equal:theValue(YES)];
                });
                it(@"62, 38 is YES", ^{
                    BOOL observered = [AKUChiSquaredTest observedCounts:@[@62, @38] willFit:@[@0.5, @0.5] at:0.01];
                    [[theValue(observered) should] equal:theValue(YES)];
                });
                it(@"63, 37 is NO", ^{
                    BOOL observered = [AKUChiSquaredTest observedCounts:@[@63, @37] willFit:@[@0.5, @0.5] at:0.01];
                    [[theValue(observered) should] equal:theValue(NO)];
                });
            });
        });

    });
SPEC_END