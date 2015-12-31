//
//  SYFTextAttachment.m
//  CoreTextDemo
//
//  Created by 孙云 on 15/12/31.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "SYFTextAttachment.h"

@implementation SYFTextAttachment
//让加载的内容与对应的富文本大小对应
-(CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    return CGRectMake(0, 0, lineFrag.size.height, lineFrag.size.height);
}
@end
