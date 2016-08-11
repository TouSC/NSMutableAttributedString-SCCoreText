//
//  SCCoreTextMethod.m
//  WanXiaCentury
//
//  Created by Tousan on 15/10/13.
//  Copyright (c) 2015年 Tousan. All rights reserved.
//

#import "NSMutableAttributedString+SCCoreText.h"

@implementation NSMutableAttributedString (SCCoreText)

- (void)addText:(NSString*)text Attribute:(NSArray*)attributeArray;
{
    if (text==nil)
    {
        return;
    }
    NSMutableDictionary *attribute_Dic = [[NSMutableDictionary alloc]init];
    for (id value in attributeArray)
    {
        if ([value isKindOfClass:[NSNumber class]])
        {
            if ([value integerValue]==SCCoreTextUnderline)
            {
                [attribute_Dic setObject:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
            }
            else if ([value integerValue]==SCCoreTextCrossline)
            {
                [attribute_Dic setObject:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];
            }
            else
            {
                [attribute_Dic setObject:[UIFont systemFontOfSize:[value floatValue]] forKey:NSFontAttributeName];
            }
        }
        else if ([value isKindOfClass:[UIColor class]])
        {
            [attribute_Dic setObject:value forKey:NSForegroundColorAttributeName];
        }
        else if ([value isKindOfClass:[UIFont class]])
        {
            [attribute_Dic setObject:value forKey:NSFontAttributeName];
        }
    }
    NSAttributedString *append_AttStr = [[NSAttributedString alloc]initWithString:text attributes:attribute_Dic];
    [self appendAttributedString:append_AttStr];
}
- (void)breakLineWithDistance:(float)distance;
{
    [self appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:distance]}]];
}
-(void)addImage:(UIImage* )image bounds:(CGRect)bounds
{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil] ;
    textAttachment.image = image;
    textAttachment.bounds = bounds;

    NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment] ;
    [self appendAttributedString:textAttachmentString];
}
@end
