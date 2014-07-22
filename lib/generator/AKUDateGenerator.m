//
//  NSDateGenerator.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/02.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "AKUDateGenerator.h"
#import "AKUNumberGenerator.h"

@implementation AKUDateGenerator

+ (NSDate *)between:(NSDate *)begin end:(NSDate *)end {
    return [NSDate dateWithTimeIntervalSince1970:[AKUNumberGenerator between:[begin timeIntervalSince1970] end:[end timeIntervalSince1970]]];
}
@end
