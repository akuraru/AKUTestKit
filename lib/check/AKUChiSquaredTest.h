//
// Created by akuraru on 2014/07/22.
//

#import <Foundation/Foundation.h>


@interface AKUChiSquaredTest : NSObject
// NSArray[@(NSInteger)] and NSArray[@(CGFloat)], CGFloat
+ (BOOL)observedCounts:(NSArray *)counts willFit:(NSArray *)expectedProbabilities at:(CGFloat)significanceLevel;
@end