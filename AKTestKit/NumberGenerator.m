//
// Created by P.I.akura on 2013/07/31.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NumberGenerator.h"


@implementation NumberGenerator {
}
+ (NSArray *)randomArrayWithPiece:(NSUInteger)piece {
    NSMutableArray *array = [self arrayWithPiece:piece];
    for (NSUInteger i = 0; i < piece; i++) {
        [self swap:array x:i y:[self between:i end:piece]];
    }
    return array;
}

+ (void)swap:(NSMutableArray *)array x:(NSUInteger)x y:(NSUInteger)y {
    id o = array[x];
    array[x] = array[y];
    array[y] = o;
}

+ (NSMutableArray *)arrayWithPiece:(NSUInteger)piece {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < piece; i++) {
        [array addObject:@(i)];
    }
    return array;
}
+ (NSUInteger)between:(NSInteger)begin end:(NSInteger)end {
    return arc4random_uniform(end -begin) + begin;
}
@end