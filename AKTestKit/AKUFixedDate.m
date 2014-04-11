//
// Created by P.I.akura on 2013/07/29.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AKUFixedDate.h"


@implementation AKUFixedDate {

}
+ (NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setCalendar:calendar];
    [formatter setLocale:[NSLocale systemLocale]];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];

    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    return [formatter dateFromString:[self convertString]];
}
+ (NSString *)convertString {
    if (6.0 <= [[[UIDevice currentDevice] systemVersion] floatValue]) {
        return [self string];
    } else {
        return [[self string] stringByReplacingCharactersInRange:(NSRange){.location = 19, .length = 0} withString:@"GMT"];
    }
}

+ (NSString *)string {
    return @"2010-12-11T21:35:43+09:00";
}


@end