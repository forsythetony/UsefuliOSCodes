//
//  Logger.m
//  Pocket Binder
//
//  Created by Tony Forsythe on 3/19/15.
//  Copyright (c) 2015 Architech. All rights reserved.
//

#import "Logger.h"
#import "NSString+Helpers.h"

@interface Logger () {
    NSString *logString;
    NSString *titleString;
}
@end

@implementation Logger

+(instancetype)newLogger
{
    return [[self alloc] init];
    
}
-(id)init
{
    if (self = [super init]) {
        logString = @"";
        _headerType = HeaderIdentifierDash;
        self.p_headerTitle = @"";
    }
    
    return self;
}
-(void)addTitle:(NSString *)t_title
{
    titleString = t_title;
}
-(NSString*)getHeaderStringByType:(HeaderIdentifier)t_headType
{
    NSString *headerString;
    NSInteger charCount = 20;
    
    switch (t_headType) {
        case HeaderIdentifierDollar: {
            headerString = [NSString stringByCopyingCharacter:@"$" x:charCount];
        }
            break;
            
        case HeaderIdentifierPercent: {
            headerString = [NSString stringByCopyingCharacter:@"%" x:charCount];
        }
            break;
            
        case HeaderIdentifierPlus: {
            headerString = [NSString stringByCopyingCharacter:@"+" x:charCount];
        }
            break;
            
        case HeaderIdentifierDash: {
            headerString = [NSString stringByCopyingCharacter:@"-" x:charCount];
        }
            break;
            
        case HeaderIdentifierNone: {
            headerString = @"";
        }
        default: {
            headerString = @"";
        }
            break;
    }
    
    return [headerString wrapInNewLinesWithType:NewLineWrappingFirst];
}
-(void)addHeaderWithType:(HeaderIdentifier)t_headType
{
    NSString *header = [self getHeaderStringByType:t_headType];
    logString = [NSString stringWithFormat:@"%@%@", header, logString];
    
}
-(void)addHeaderAndFooterWithType:(HeaderIdentifier)t_headType
{
    NSString *header = [self getHeaderStringByType:t_headType];
    NSString *footer = [self getHeaderStringByType:t_headType];
    
    logString = [NSString stringWithFormat:@"%@%@%@", header, logString, footer];
}
-(void)addCGRect:(CGRect)t_rect withTitle:(NSString *)t_title
{
    NSString *addition = [NSString stringWithFormat:@"\n%@:\t%@",t_title, NSStringFromCGRect(t_rect)];
    
    logString = [logString stringByAppendingString:addition];
}
-(void)addCGPoint:(CGPoint)t_point withTitle:(NSString *)t_title
{
    NSString *addiction = [NSString stringWithFormat:@"\n%@:\t%@", t_title, NSStringFromCGPoint(t_point)];
    
    logString = [logString stringByAppendingString:addiction];
}
-(void)addString:(NSString *)t_string withTitle:(NSString *)t_title
{
    NSString *add = [NSString stringWithFormat:@"\n%@:\t%@", t_title, t_string];
    
    logString = [logString stringByAppendingString:add];
}

-(void)addCGFloat:(CGFloat)t_float withTitle:(NSString *)t_title
{
    NSString *add = [NSString stringWithFormat:@"\n%@:\t%lf", t_title, t_float];
    
        logString = [logString stringByAppendingString:add];
}
-(void)clear
{
    logString = @"";
}
-(void)log
{
    NSLog(@"%@", [self addHeadersAndTitle]);
}
-(NSString*)addHeadersAndTitle
{
    logString = [NSString stringWithFormat:@"\n\n%@%@\n%@\n%@", _p_headerTitle, [self getHeaderStringByType:_headerType], logString, [self getHeaderStringByType:_headerType]];
    
    return logString;
}
@end
//--------------------------//
//                          //
//  NSString+Helpers        //
//                          //
//--------------------------//
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
