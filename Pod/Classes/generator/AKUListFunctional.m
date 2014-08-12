//
// Created by P.I.akura on 2013/07/31.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AKUListFunctional.h"
#import "AKUNumberGenerator.h"

@implementation AKUListFunctional {
}
+ (NSArray *)randomSort:(NSArray *)array {
    NSArray *numbers = [AKUNumberGenerator randomArrayWithPiece:array.count];
    NSMutableArray *a = [NSMutableArray array];
    for (NSNumber *n in numbers) {
        [a addObject:array[n.unsignedIntegerValue]];
    }
    return a;
}
+ (NSArray *)take:(NSArray *)array length:(NSUInteger)length {
    if (array.count < length)
        return array;
    return [array subarrayWithRange:NSMakeRange(0, length)];
}

@end