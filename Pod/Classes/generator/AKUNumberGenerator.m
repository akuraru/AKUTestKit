//
// Created by P.I.akura on 2013/07/31.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AKUNumberGenerator.h"


@implementation AKUNumberGenerator {
}
+ (NSArray *)randomArrayWithPiece:(NSUInteger)piece {
    NSMutableArray *array = [self arrayWithPiece:piece];
    for (NSUInteger i = 0; i < piece; i++) {
        [array exchangeObjectAtIndex:i withObjectAtIndex:[self between:i end:piece]];
    }
    return array;
}

+ (NSMutableArray *)arrayWithPiece:(NSUInteger)piece {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:piece];
    for (int i = 0; i < piece; i++) {
        [array addObject:@(i)];
    }
    return array;
}
+ (NSInteger)between:(NSInteger)begin end:(NSInteger)end {
    if (begin >= end) {
        return begin;
    } else {
        u_int32_t i = (u_int32_t)(end + 1 - begin);
        return (NSInteger)arc4random_uniform(i) + begin;
    }
}

+ (NSNumber *)boolean {
    return @((BOOL)arc4random_uniform(2));
}

+ (double)doubleBetween:(double)from and:(double)to {
    if (from >= to) {
        return from;
    } else {
        double diff = (to - from);
        return arc4random() / (double)UINT32_MAX * diff + from;
    }
}
@end