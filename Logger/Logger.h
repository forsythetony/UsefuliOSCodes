//
//  Logger.h
//  Pocket Binder
//
//  Created by Tony Forsythe on 3/19/15.
//  Copyright (c) 2015 Architech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//----------------------------//
//
//  NSString+Helpers Category
//
//----------------------------//
//  NSString+Helpers Enums
typedef NS_ENUM(NSInteger, NewLineWrapping) {
    NewLineWrappingFirst,
    NewLineWrappingLast,
    NewLineWrappingBoth
};
@interface NSString (Helpers)

-(BOOL)isValidFilePath;
-(BOOL)equalsString:(NSString*) otherString;
-(NSString*)getFirstChar;
-(BOOL)isEmpty;

+(NSString*)stringByCopyingCharacter:(NSString*) t_char x:(NSInteger) t_times;
-(NSString*)wrapInNewLinesWithType:(NewLineWrapping) t_type;

@end

//----------------------------//
//
//  Logger Class Code
//
//----------------------------//
//  Logger Enums
typedef NS_ENUM(NSInteger, HeaderIdentifier) {
    HeaderIdentifierPercent,
    HeaderIdentifierPlus,
    HeaderIdentifierDollar,
    HeaderIdentifierDash,
    HeaderIdentifierNone
};
@interface Logger : NSObject



+(instancetype)newLogger;

@property (nonatomic, strong) NSString* p_headerTitle;
@property (nonatomic, assign) HeaderIdentifier headerType;

-(void)addHeaderAndFooterWithType:(HeaderIdentifier) t_headType;

-(void)addHeaderWithType:(HeaderIdentifier) t_headType;
-(void)addCGPoint:(CGPoint) t_point withTitle:(NSString*) t_title;
-(void)addCGRect:(CGRect) t_rect withTitle:(NSString*) t_title;
-(void)addString:(NSString*) t_string withTitle:(NSString*) t_title;
-(void)clear;
-(void)addCGFloat:(CGFloat) t_float withTitle:(NSString*) t_title;
-(void)log;
-(void)addTitle:(NSString*) t_title;
@end
