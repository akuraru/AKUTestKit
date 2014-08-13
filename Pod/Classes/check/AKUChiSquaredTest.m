//
// Created by akuraru on 2014/07/22.
//

#import "AKUChiSquaredTest.h"

@implementation AKUChiSquaredTest {

}
+ (BOOL)observedCounts:(NSArray *)counts willFit:(NSArray *)expectedProbabilities at:(double)significanceLevel {
    NSUInteger degreesOfFreedom = counts.count - 1;
    if ((degreesOfFreedom + 1) != expectedProbabilities.count) {
        @throw([NSError errorWithDomain:[NSString stringWithFormat:@"Is not same count %d ans %d", degreesOfFreedom + 1, expectedProbabilities.count] code:0 userInfo:nil]);
    }
    double chiSquare = [self chiSquare:counts probaby:expectedProbabilities];
    double upperLimitOfChiSquareValue = [self q_chi2:degreesOfFreedom chi2:chiSquare];
    return significanceLevel <= upperLimitOfChiSquareValue;
}

+ (double)chiSquare:(NSArray *)array probaby:(NSArray *)probaby {
    NSUInteger allCount = [self allCount:array];
    double result = 0;
    for (NSUInteger i = 0, _len = array.count; i < _len; i++) {
        NSUInteger o = [array[i] unsignedIntegerValue];
        double e = [probaby[i] doubleValue] * allCount;
        result += (o - e) * (o - e) / e;
    }
    return result;
}

+ (NSUInteger)allCount:(NSArray *)array {
    NSUInteger result = 0;
    for (NSNumber *c in array) {
        result += c.unsignedIntegerValue;
    }
    return result;
}


+ (double)q_chi2:(NSInteger)df chi2:(double)chi2 {
    NSInteger k;
    double s, t, chi;

    if (df & 1) {  /* 自由度が奇数 */
        chi = sqrt(chi2);
        if (df == 1) return 2 * [self q_nor:chi];
        s = t = chi * exp(-0.5 * chi2) / sqrt(2 * M_PI);
        for (k = 3; k < df; k += 2) {
            t *= chi2 / k;
            s += t;
        }
        return 2 * ([self q_nor:chi] + s);
    } else {      /* 自由度が偶数 */
        s = t = exp(-0.5 * chi2);
        for (k = 2; k < df; k += 2) {
            t *= chi2 / k;
            s += t;
        }
        return s;
    }
}

+ (double)p_nor:(double)z {
    NSInteger i;
    double z2, prev, p, t;

    z2 = z * z;
    t = p = z * exp(-0.5 * z2) / sqrt(2 * M_PI);
    for (i = 3; i < 200; i += 2) {
        prev = p;
        t *= z2 / i;
        p += t;
        if (p == prev) return 0.5 + p;
    }
    return (z > 0);
}

+ (double)q_nor:(double)z {
    return 1 - [self p_nor:z];
}

@end