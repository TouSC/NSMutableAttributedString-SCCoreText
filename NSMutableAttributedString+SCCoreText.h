//
//  SCCoreTextMethod.h
//  WanXiaCentury
//
//  Created by Tousan on 15/10/13.
//  Copyright (c) 2015年 Tousan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    SCCoreTextUnderline = 1001,
    SCCoreTextCrossline
}SCCoreTextAttribute;

@interface NSMutableAttributedString (SCCoreText)

- (void)addText:(NSString*)text Attribute:(NSArray*)attributeArray;
- (void)breakLineWithDistance:(float)distance;
- (void)addImage:(UIImage* )image bounds:(CGRect)bounds;

@end
