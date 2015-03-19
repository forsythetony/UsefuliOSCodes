//
//  NSString+Helpers.m
//  Pocket Binder
//
//  Created by Tony Forsythe on 2/19/15.
//  Copyright (c) 2015 Architech. All rights reserved.
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

-(BOOL)isValidFilePath
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString* filePath = [documentsPath stringByAppendingPathComponent:self];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
}
-(NSString *)getFirstChar
{
     unichar firstChar = [self characterAtIndex:0];
    
    return [NSString stringWithFormat:@"%c", firstChar];
}
-(BOOL)isEmpty
{
    return [self isEqualToString:@""];
}
+(NSString *)stringByCopyingCharacter:(NSString *)t_char x:(NSInteger)t_times
{
    NSString* newString = @"";
    
    for (NSInteger i = 0; i < t_times; i++) {
        newString = [newString stringByAppendingString:t_char];
    }
    
    return newString;
}
-(NSString*)wrapInNewLinesWithType:(NewLineWrapping)t_type
{
    NSString *newString;
    
    switch (t_type) {
        case NewLineWrappingFirst:
        {
            newString = [NSString stringWithFormat:@"\n%@", self];
        }
            break;
            
        case NewLineWrappingBoth: {
            newString = [NSString stringWithFormat:@"\n%@\n", self];
        }
            break;
        case NewLineWrappingLast: {
            newString = [NSString stringWithFormat:@"%@\n", self];
        }
            break;
        default:
            newString = [NSString stringWithString:self];
            break;
    }
    return newString;
}
@end
