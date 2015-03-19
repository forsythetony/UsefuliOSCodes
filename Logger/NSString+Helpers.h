//
//  NSString+Helpers.h
//  Pocket Binder
//
//  Created by Tony Forsythe on 2/19/15.
//  Copyright (c) 2015 Architech. All rights reserved.
//

#import <Foundation/Foundation.h>
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
