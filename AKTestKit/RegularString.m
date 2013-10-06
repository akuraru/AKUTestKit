//
//  RegularString.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/20.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "RegularString.h"
#import "RandString.h"

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


@implementation RegularBase {
    NSMutableArray *str;
}
+ (RegularBase *)generat:(NSMutableString *)string {
    return [[self alloc] initWithRegular:string];
}
- (id)initWithRegular:(NSMutableString *)regular {
    self = [super init];
    if (self) {
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
                str[str.count - 1] = [RegularRepeatZero generat:str[str.count - 1]];
            } else if ([s isEqualToString:@"."]){
                [str addObject:[RegularAll generat]];
            } else {
                [str addObject:[RegularOneString generat:s]];
            }
        }
    }
    return self;
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
    for (RegularBase *rb in str) {
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
    RandString *rand;
}
+ (RegularBase *)generat {
    return [[self alloc] init];
}
- (NSString *)string {
    return [rand nextString];
}
@end
@implementation RegularRepeatZero {
    RegularBase *r;
    NSInteger length;
}
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular];
}
- (id)initWithRepeat:(RegularBase *)regular {
    self = [super init];
    if (self) {
        r = regular;
        length = 16;
    }
    return self;
}
- (NSString *)string {
    NSMutableString *string = [NSMutableString string];
    for (NSInteger i = 0; i < length; i++) {
        [string appendString:[r string]];
    }
    return string;
    
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

@implementation RegularString

- (NSString *)stringForRefular:(NSString *)reg {
    return [[RegularBase generat:reg.mutableCopy] string];
}

@end
