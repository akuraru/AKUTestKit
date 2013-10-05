//
// Created by P.I.akura on 2013/07/29.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface StringGenerator : NSObject

+ (NSString *)alphabetWithRange:(NSRange)range;
+ (NSString *)asciiWordWithRange:(NSRange)range;
+ (NSString *)japaneseWithRange:(NSRange)range;

@end