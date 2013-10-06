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
                NSMutableString *next = [self push:regular].mutableCopy;
                if ([next isEqualToString:@"c"]) {
                    [str addObject:[RegularAlphabet generat]];
                } else if ([next isEqualToString:@"w"]) {
                    [str addObject:[RegularWords generat]];
                } else if ([next isEqualToString:@"s"]) {
                    [str addObject:[RegularSpaceSet generat]];
                } else if ([next isEqualToString:@"t"]) {
                    [str addObject:[RegularHorizontalTab generat]];
                } else if ([next isEqualToString:@"v"]) {
                    [str addObject:[RegularVerticalTab generat]];
                } else if ([next isEqualToString:@"n"]) {
                    [str addObject:[RegularNewline generat]];
                } else if ([next isEqualToString:@"r"]) {
                    [str addObject:[RegularReturn generat]];
                } else if ([next isEqualToString:@"b"]) {
                    [str addObject:[RegularBackSpace generat]];
                } else if ([next isEqualToString:@"f"]) {
                    [str addObject:[RegularFormFeed generat]];
                } else if ([next isEqualToString:@"a"]) {
                    [str addObject:[RegularBell generat]];
                } else if ([next isEqualToString:@"e"]) {
                    [str addObject:[RegularEscape generat]];
                } else {
                    [str addObject:[RegularOneString generat:s]];
                    [str addObject:[RegularOneString generat:next]];
                }
            } else if ([s isEqualToString:@"."]){
                [str addObject:[RegularAll generat]];
            } else {
                [str addObject:[RegularOneString generat:s]];
            }
        }
    }
    return self;
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
#define RWord(class, randClass) @implementation class \
- init { self = [super init]; if (self) { rand = [randClass alloc]; } return self; }\
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


@implementation RegularString

- (NSString *)stringForRefular:(NSString *)reg {
    return [[RegularBase generat:reg.mutableCopy] string];
}

@end
