//
//  AKURegularString.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/20.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "AKURegularString.h"
#import "AKURandString.h"

@interface RegularBase : NSObject
- (NSString *)string;
@end
@interface RegularOneString : RegularBase
@end
@interface RegularWord : RegularBase
+ (RegularBase *)generat;
@end
@interface RegularAlphabet : RegularWord
@end
@interface RegularWords : RegularWord
@end
@interface RegularAll : RegularWord
@end
@interface RegularSpaceSet : RegularWord
@end
@interface RegularNumber : RegularWord
@end
@interface RegularHorizontalTab : RegularWord
@end
@interface RegularVerticalTab : RegularWord
@end
@interface RegularNewline : RegularWord
@end
@interface RegularReturn : RegularWord
@end
@interface RegularBackSpace : RegularWord
@end
@interface RegularFormFeed : RegularWord
@end
@interface RegularBell : RegularWord
@end
@interface RegularEscape : RegularWord
@end
@interface RegularBackslash : RegularWord
@end
@interface RegularRepeatZero : RegularBase
+ (RegularBase *)generat:(RegularBase *)regurla;
@end
@interface RegularRepeatOne : RegularRepeatZero
@end
@interface RegularQuestion : RegularRepeatZero
@end

@interface RegularGroupStart : RegularBase
+ (RegularBase *)generate;
@end
@interface RegularGroup : RegularBase
+ (RegularBase *)generate:(NSArray *)_str;
@end
@interface RegularOR : RegularBase
+ (RegularBase *)generate;
@end


@implementation RegularBase {
@protected
    NSMutableArray *str;
    NSMutableArray *strings;
}
+ (RegularBase *)generat:(NSMutableString *)string {
    return [[self alloc] initWithRegular:string];
}
- (id)initWithRegular:(NSMutableString *)regular {
    self = [super init];
    if (self) {
        strings = [NSMutableArray array];
        [self toObject:regular];
        [self spliteOr];
    }
    return self;
}
- (void)toObject:(NSMutableString *)regular {
    str = [NSMutableArray array];
    while (regular.length != 0) {
        NSMutableString *s = [self push:regular].mutableCopy;
        if ([s isEqualToString:@"\\"]) {
            id next = [self slishWord:regular];
            if ([next isKindOfClass:[NSMutableString class]]) {
                [str addObject:[RegularOneString generat:s]];
                [str addObject:[RegularOneString generat:next]];
            } else {
                [str addObject:next];
            }
        } else if ([s isEqualToString:@"*"]) {
            str[str.count - 1] = [RegularRepeatZero generat:str.lastObject];
        } else if ([s isEqualToString:@"+"]) {
            str[str.count - 1] = [RegularRepeatOne generat:str.lastObject];
        } else if ([s isEqualToString:@"?"]) {
            str[str.count - 1] = [RegularQuestion generat:str.lastObject];
        } else if ([s isEqualToString:@"."]){
            [str addObject:[RegularAll generat]];
        } else if ([s isEqualToString:@"("]) {
            [str addObject:[RegularGroupStart generate]];
        } else if ([s isEqualToString:@"|"]) {
            [str addObject:[RegularOR generate]];
        } else if ([s isEqualToString:@")"]) {
            NSInteger i = str.count - 1;
            for (; 0 <= i; i--) {
                if ([str[i] isKindOfClass:[RegularGroupStart class]]) {
                    break;
                }
            }
            [str removeObjectAtIndex:i];
            NSRange renge = (NSRange){i, str.count - i};
            NSArray *group = [str subarrayWithRange:renge];
            [str removeObjectsInRange:renge];
            [str addObject:[RegularGroup generate:group]];
        } else {
            [str addObject:[RegularOneString generat:s]];
        }
    }
}
- (void)spliteOr {
    for (int i = 0, _len = str.count;i < _len; i ++) {
        RegularBase *r = str[i];
        if ([r isKindOfClass:RegularOR.class]) {
            [strings addObject:[str subarrayWithRange:(NSRange){0, i}]];
            str = [str subarrayWithRange:(NSRange){i + 1, _len - (i + 1)}].mutableCopy;
            [self spliteOr];
            return;
        } else {
            [r spliteOr];
        }
    }
    [strings addObject:str];
}
- (id)slishWord:(NSMutableString *)regular {
    NSString *next = [self push:regular];
    if ([next isEqualToString:@"c"]) {
        return [RegularAlphabet generat];
    } else if ([next isEqualToString:@"w"]) {
        return [RegularWords generat];
    } else if ([next isEqualToString:@"s"]) {
        return [RegularSpaceSet generat];
    } else if ([next isEqualToString:@"t"]) {
        return [RegularHorizontalTab generat];
    } else if ([next isEqualToString:@"v"]) {
        return [RegularVerticalTab generat];
    } else if ([next isEqualToString:@"n"]) {
        return [RegularNewline generat];
    } else if ([next isEqualToString:@"r"]) {
        return [RegularReturn generat];
    } else if ([next isEqualToString:@"b"]) {
        return [RegularBackSpace generat];
    } else if ([next isEqualToString:@"f"]) {
        return [RegularFormFeed generat];
    } else if ([next isEqualToString:@"a"]) {
        return [RegularBell generat];
    } else if ([next isEqualToString:@"e"]) {
        return [RegularEscape generat];
    } else if ([next isEqualToString:@"d"]) {
        return [RegularNumber generat];
    } else if ([next isEqualToString:@"\\"]) {
        return [RegularBackslash generat];
    } else {
        return next.mutableCopy;
    }
}
- (NSString *)push:(NSMutableString *)string {
    NSString *result = [string substringToIndex:1];
    [string deleteCharactersInRange:(NSRange){0, 1}];
    return result;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString string];
    for (RegularBase *rb in strings[arc4random_uniform(strings.count)]) {
        [string appendString:[rb string]];
    }
    return string;
}
@end

@implementation RegularOneString {
    NSString *string;
}
+ (RegularBase *)generat:(NSMutableString *)string {
    return [[self alloc] initWithRegular:string];
}
- (id)initWithRegular:(NSMutableString *)regular {
    self = [super init];
    if (self) {
        string = regular;
    }
    return self;
}

- (NSString *)string {
    return string;
}
@end
@implementation RegularWord {
@protected
    AKURandString *rand;
}
+ (RegularBase *)generat {
    return [[self alloc] init];
}
- (NSString *)string {
    return [rand nextString];
}
@end
@implementation RegularRepeatZero{
@protected
    RegularBase *r;
    NSInteger location;
    NSInteger length;
}
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular location:0 length:16];
}
- (id)initWithRepeat:(RegularBase *)regular location:(NSInteger)loc length:(NSInteger)len{
    self = [super init];
    if (self) {
        r = regular;
        location = loc;
        length = len;
    }
    return self;
}
- (void)spliteOr {
    [r spliteOr];
}
- (NSString *)string {
    NSMutableString *string = [NSMutableString string];
    NSInteger _len = arc4random_uniform(length - location) + location;
    for (NSInteger i = 0; i < _len; i++) {
        [string appendString:[r string]];
    }
    return string;
    
}
@end
@implementation RegularGroupStart
+ (RegularBase *)generate {
    return [[self alloc] init];
}
- (NSString *)string {
    NSAssert(0, @"RegularGroupStart");
    return @"";
}
@end
@implementation RegularGroup
+ (RegularBase *)generate:(NSArray *)_str {
    return [[self alloc] initWithArray:_str];
}
- (id)initWithArray:(NSArray *)_str {
    self = [super init];
    if (self) {
        strings = [NSMutableArray array];
        str = _str.mutableCopy;
    }
    return self;
}

@end
@implementation RegularOR
+ (RegularBase *)generate {
    return [[self alloc] init];
}
- (NSString *)string {
    NSAssert(0, @"RegularGroupStart");
    return @"";
}

@end

#define RWord(class, randClass) @implementation class \
- init { self = [super init]; if (self) { rand = [randClass sharedInstance]; } return self; }\
@end
RWord(RegularAlphabet, Alphabet)
RWord(RegularWords, Words)
RWord(RegularAll, AsciiWord)
RWord(RegularSpaceSet, SpaseSet)
RWord(RegularHorizontalTab, HorizontalTab)
RWord(RegularVerticalTab, VerticalTab)
RWord(RegularNewline, Newline)
RWord(RegularReturn, Return)
RWord(RegularBackSpace, BackSpace)
RWord(RegularFormFeed, FormFeed)
RWord(RegularBell, Bell)
RWord(RegularEscape, Escape)
RWord(RegularNumber, Number)
RWord(RegularBackslash, Backslash)
@implementation RegularRepeatOne
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular location:1 length:16];
}
@end
@implementation RegularQuestion
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular location:0 length:1];
}
@end

@implementation AKURegularString
- (NSString *)stringForRegular:(NSString *)reg {
    return [[RegularBase generat:reg.mutableCopy] string];
}
@end
