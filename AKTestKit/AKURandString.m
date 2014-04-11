//
//  AKURandString.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/20.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "AKURandString.h"

@implementation AKURandString
+ (instancetype)sharedInstance {
    return nil;
}
- (NSString *)nextString {
    return @"";
}
- (NSUInteger)length {
    return length;
}
- (NSString *)stringFromIndex:(NSInteger)index {
    return @"";
}
@end
@implementation WordsString
- (void)setRange:(CharMapping)charMapping {
    location = charMapping.fromChar;
    length = charMapping.toChar - charMapping.fromChar + 1;
}
- (NSRange)rangeValue {
    return NSMakeRange(location, length);
}
- (NSString *)nextString {
    return [self stringFromIndex:[self randomIndex]];
}
- (NSInteger)randomIndex {
    return (arc4random_uniform(length));
}

- (NSString *)stringFromIndex:(NSInteger)index {
    UniChar uniChar = index + location;
    // FIXME: wrong???
    if (CFStringIsSurrogateHighCharacter(uniChar) ||
        CFStringIsSurrogateLowCharacter(uniChar)) {
        UTF32Char inputChar = uniChar;// my UTF-32 character
        inputChar -= 0x10000;
        unichar highSurrogate = (unichar)(inputChar >> 10); // leave the top 10 bits
        highSurrogate += 0xD800;
        unichar lowSurrogate = (unichar)(inputChar & 0x3FF); // leave the low 10 bits
        lowSurrogate += 0xDC00;
        return [NSString stringWithCharacters:(unichar[]){highSurrogate, lowSurrogate} length:2];
    }
    return [NSString stringWithCharacters:&uniChar length:1];
}
@end
@implementation SetString
- (NSString *)nextString {
    return [self stringFromIndex:arc4random_uniform(length)];
}
- (NSString *)stringFromIndex:(NSInteger)index {
    for (AKURandString *rs in words) {
        if (index < rs.length) {
            return [rs stringFromIndex:index];
        } else {
            index -= rs.length;
        }
    }
    return @"";
}
- (void)setWords:(NSArray *)w {
    words = w;
    length = [self sumLength:w];
}
- (NSInteger)sumLength:(NSArray *)w {
    NSInteger l = 0;
    for (AKURandString *rs in w) {
        l += [rs length];
    }
    return l;
}
@end

#define mSharedInstance \
+ (instancetype)sharedInstance { static id _instance; static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{ _instance = [self new]; }); return _instance; }

#define cWordStringInheritance(name, from, to) \
@implementation name \
mSharedInstance\
- (id)init { self = [super init]; if (self) { [self setRange:(CharMapping){from, to}]; } return self; }\
@end

#define SingleWordStringInheritance(name, chara) \
@implementation name \
mSharedInstance\
- (id)init { self = [super init]; if (self) { [self setRange:(CharMapping){chara, chara+1}]; } return self; }\
@end

#define cSetStringInheritance(name, ...) @implementation name \
mSharedInstance \
- (id)init { self = [super init]; if (self) { [self setWords:@[ __VA_ARGS__ ]]; } return self; }\
@end



cWordStringInheritance(CaptalAlphabet, 0x41, 0x5a)
cWordStringInheritance(LowerCaseAlphabet, 0x61, 0x7a)
cWordStringInheritance(AsciiWord, 0x20, 0x7E)
cWordStringInheritance(Number, 0x30, 0x39)
cWordStringInheritance(Hiragana, 0x3041, 0x3093)
cWordStringInheritance(Katakana, 0x30A1, 0x30F6)
cWordStringInheritance(CommonKanji, 0x4E00, 0x9FA0)
cWordStringInheritance(Kanji1, 0x3220, 0x3244)
cWordStringInheritance(Kanji2, 0x3280, 0x32B0)
cWordStringInheritance(Kanji3, 0x3400, 0x9FFF)
cWordStringInheritance(Kanji4, 0xF900, 0xFAFF)
cWordStringInheritance(Kanji5, 0x20000, 0x2FFFF)

cWordStringInheritance(HorizontalTab, 0x09, 0x09)
cWordStringInheritance(VerticalTab, 0x0B, 0x0B)
cWordStringInheritance(Newline, 0x0A, 0x0A)
cWordStringInheritance(Return, 0x0D, 0x0D)
cWordStringInheritance(BackSpace, 0x08, 0x08)
cWordStringInheritance(FormFeed, 0x0C, 0x0C)
cWordStringInheritance(Bell, 0x07, 0x07)
cWordStringInheritance(Escape, 0x1B, 0x1B)
cWordStringInheritance(UnderBar, 0x5F, 0x5F)
cWordStringInheritance(Backslash, 0x5c, 0x5c)
cWordStringInheritance(Space, 0x20, 0x20)

cSetStringInheritance(Japanese,
                      [Hiragana sharedInstance],
                      [Katakana sharedInstance],
                      [CommonKanji sharedInstance],
                      )

cSetStringInheritance(Alphabet,
                      [CaptalAlphabet sharedInstance],
                      [LowerCaseAlphabet sharedInstance],
                      )
cSetStringInheritance(Words,
                      [Alphabet sharedInstance],
                      [Number sharedInstance],
                      [UnderBar sharedInstance]
                      )
cSetStringInheritance(SpaseSet,
                      [Space sharedInstance],
                      [HorizontalTab sharedInstance],
                      [Return sharedInstance],
                      [Newline sharedInstance],
                      [FormFeed sharedInstance],
                      )