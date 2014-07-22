//
//  AKUInfinityList.h
//  AKUTestKit
//
//  Created by akuraru on 2014/05/31.
//
//

#import <Foundation/Foundation.h>

@interface AKUInfinityList : NSObject
+ (instancetype)listWithBlock:(id(^)(NSUInteger))block;

- (NSArray *)take:(NSUInteger)count;

- (id)objectAtIndexedSubscript:(NSUInteger)idx; __attribute__((deprecated("This method is not good performance")));
@end
