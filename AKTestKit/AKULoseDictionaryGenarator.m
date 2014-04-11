//
// Created by P.I.akura on 2013/07/31.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AKULoseDictionaryGenarator.h"
#import "AKUListFunctional.h"


@implementation AKULoseDictionaryGenarator {
}

+ (NSDictionary *)lose:(NSDictionary *)dict {
    return [self lose:dict dropsNum:(arc4random()%(dict.count - 2) + 1)];
}
+ (NSDictionary *)lose:(NSDictionary *)dict dropsNum:(NSUInteger)num {
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    for (NSString *key in [AKUListFunctional take:[AKUListFunctional randomSort:dict.allKeys] length:dict.count - num]) {
        [d setObject:dict[key] forKey:key];
    }
    return d;
}

@end