//
//  AKUInfinityList.m
//  AKUTestKit
//
//  Created by akuraru on 2014/05/31.
//
//

#import "AKUInfinityList.h"

@interface AKUInfinityList ()
@property(nonatomic, strong) id(^block)(NSUInteger);
@end

@implementation AKUInfinityList

+ (instancetype)listWithBlock:(id(^)(NSUInteger))block {
    return [[self alloc] initWithBlock:block];
}

- (instancetype)initWithBlock:(id(^)(NSUInteger))block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

- (NSArray *)take:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (int c = 0, index = 0; c < count; index++) {
        id value = self.block(index);
        if (value) {
            [result addObject:value];
            c++;
        }
    }
    return result;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self take:idx][idx];
}
@end
