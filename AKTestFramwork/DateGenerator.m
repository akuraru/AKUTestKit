//
//  NSDateGenerator.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/02.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "DateGenerator.h"
#import "NumberGenerator.h"

@implementation DateGenerator

+ (NSDate *)between:(NSDate *)begin end:(NSDate *)end {
    return [NSDate dateWithTimeIntervalSince1970:[NumberGenerator between:[begin timeIntervalSince1970]  end:[end timeIntervalSince1970]]];
}
@end
