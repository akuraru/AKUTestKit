//
//  AKURandString.h
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/20.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef struct {
    const UTF32Char fromChar;
    const UTF32Char toChar;
} CharMapping;

@interface AKURandString : NSObject {
    NSUInteger length;
}
- (NSString *)nextString;
+ (instancetype)sharedInstance;
- (NSUInteger)length;
- (NSString *)stringFromIndex:(NSInteger)index;
@end

@interface WordsString : AKURandString {
    NSUInteger location;
}
- (void)setRange:(CharMapping)charMapping;
@end
@interface SetString : AKURandString {
    NSArray *words;
}
- (void)setWords:(NSArray *)w;
@end


@interface CaptalAlphabet : WordsString
@end

@interface LowerCaseAlphabet : WordsString
@end
@interface AsciiWord : WordsString
@end
@interface Number : WordsString
@end
@interface HorizontalTab : WordsString
@end
@interface VerticalTab : WordsString
@end
@interface Newline : WordsString
@end
@interface Return : WordsString
@end
@interface BackSpace : WordsString
@end
@interface FormFeed : WordsString
@end
@interface Bell : WordsString
@end
@interface Escape : WordsString
@end
@interface UnderBar : WordsString
@end
@interface Backslash : WordsString
@end
@interface Space : WordsString
@end
@interface Hiragana : WordsString
@end
@interface Katakana : WordsString
@end
@interface CommonKanji : WordsString
@end
@interface Kanji1 : WordsString
@end
@interface Kanji2 : WordsString
@end
@interface Kanji3 : WordsString
@end
@interface Kanji4 : WordsString
@end
@interface Kanji5 : WordsString
@end

@interface Japanese : SetString
@end
@interface Alphabet : SetString
@end
@interface Words : SetString
@end
@interface SpaseSet : SetString
@end