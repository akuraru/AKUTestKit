//
// Created by P.I.akura on 2013/07/31.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface LoseDictionaryGenarator : NSObject

+ (NSDictionary *)lose:(NSDictionary *)dict;
+ (NSDictionary *)lose:(NSDictionary *)dict dropsNum:(NSUInteger)num;

@end