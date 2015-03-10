//
// Created by P.I.akura on 2013/07/29.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AKUStringGenerator.h"
#import "AKURandString.h"

@implementation AKUStringGenerator

+ (NSInteger)randBetween:(NSRange)range {
    return arc4random_uniform((u_int32_t)range.length) + range.location;
}

+ (NSString *)alphabetWithRange:(NSRange)range {
    return [self alphabetWithLength:[self randBetween:range]];
}

+ (NSString *)asciiWordWithRange:(NSRange)range {
    return [self asciiWordWithLength:[self randBetween:range]];
}
+ (NSString *)japaneseWithRange:(NSRange)range {
    return [self japaneseWithLength:[self randBetween:range]];
}

#pragma -
+ (NSString *)alphabetWithLength:(NSUInteger)length {
    return [self randomString:length instance:[Alphabet sharedInstance]];
}
+ (NSString *)asciiWordWithLength:(NSUInteger)length {
    return [self randomString:length instance:[AsciiWord sharedInstance]];
}
+ (NSString *)numberWithLength:(NSUInteger)length {
    return [self randomString:length instance:[Number sharedInstance]];
}
+ (NSString *)japaneseWithLength:(NSUInteger) length {
    return [self randomString:length instance:[Japanese sharedInstance]];
}
+ (NSString *)randomString:(NSUInteger)length instance:(AKURandString *)instance {
    // FIXME: Doesn't actually random
    NSMutableString *results = [NSMutableString string];
    for (NSUInteger i = 0; i < length; i++) {
        NSString *s = [instance nextString];
        if (s.length == 1) {
            [results appendString:s];
        } else {
            i--;
        }
    }
    return results;
}

+ (NSString *)shift:(NSMutableString *)pattern {
    NSString *result = [pattern substringWithRange:(NSRange){0, 1}];
    [pattern deleteCharactersInRange:(NSRange){0, 1}];
    return result;
}
+ (id)shiftArray:(NSMutableArray *)tree {
    id result = tree[0];
    [tree removeObjectAtIndex:0];
    return result;
}

@end