//
//  ViewController.m
//  AttributedString
//
//  Created by 孙云 on 15/12/31.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "SYFTextAttachment.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载富文本
    [self loadFWB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  富文本实现方法
 */
-(void)loadFWB
{
    //首先创建一个textview，用于显示
    UITextView *textView = [[UITextView alloc]
                            initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400)];
    [self.view addSubview:textView];

    //构造方法
    //原始数据
    NSString *originStr = @"某农场爆发疯牛病，一女记者闻讯赶到，采访农场主：“请问这疯牛病是从何而来的“你想想，每天都有人来捏你的XX，但是又不和你做ai，你会不会疯掉“";
    //第一种
    NSAttributedString *string1 = [[NSAttributedString alloc]
                                   initWithString:originStr];
    
    textView.attributedText = string1;
    
    //第二种
    NSAttributedString *string2 = [[NSAttributedString alloc]
                                   initWithString:originStr
                                   attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    textView.attributedText = string2;
    
    //第三种
    NSAttributedString *string3 =[[NSAttributedString alloc]
                                  initWithAttributedString:string2];
    textView.attributedText = string3;
    
    
    NSAttributedString *string4 = [[NSAttributedString alloc]initWithString:originStr
                                                                 attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //判断两个NSAttributedString是否相等
    BOOL flag = [string1 isEqualToAttributedString:string2];
    NSLog(@"flag === %i",flag);
    
    BOOL flag2 = [string4 isEqualToAttributedString:string3];
    NSLog(@"flag2 === %i,string4=%p,---string3=%p",flag2,string4,string3);
    //NSObjec的方法
    BOOL flag3 = [string4 isEqual:string3];
    NSLog(@"flag3 === %i,string4=%p,---string3=%p",flag3,string4,string3);
    
    //截取
    NSAttributedString *string5 = [string4 attributedSubstringFromRange:NSMakeRange(0, 10)];
    textView.attributedText = string5;
    
    //NSMutableAttributedString
    NSMutableAttributedString *muString1 = [[NSMutableAttributedString alloc]
                                            initWithString:originStr];
    
    //内容代替
    [muString1 replaceCharactersInRange:NSMakeRange(0, 10) withString:@"hello，world"];
    textView.attributedText = muString1;
    
    //替代
    [muString1 replaceCharactersInRange:NSMakeRange(0, 10) withAttributedString:string1];
    textView.attributedText = muString1;
    
    //插入内容(富文本)
    [muString1 insertAttributedString:string5 atIndex:muString1.length];
    textView.attributedText = muString1;
    //追加
    [muString1 appendAttributedString:string1];
    textView.attributedText = muString1;
    
    //删除内容
    [muString1 deleteCharactersInRange:NSMakeRange(0, 200)];
    textView.attributedText = muString1;
    
    
    //重新付值
    [muString1 setAttributedString:string2];
    textView.attributedText = muString1;
    
    //设置属性
    //字体大小
    [muString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:35] range:NSMakeRange(0, muString1.length)];
     textView.attributedText = muString1;
    
    //字体颜色
    [muString1 addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 20)];
    textView.attributedText = muString1;
    //字体背景色
    [muString1 addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(20, 10)];
    textView.attributedText = muString1;
    
    //删除线
    [muString1 addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(40, 10)];
    textView.attributedText = muString1;
    
    //下划线
    [muString1 addAttribute:NSUnderlineStyleAttributeName value:@(1) range:NSMakeRange(0, 20)];
    textView.attributedText = muString1;
    
    //下划线颜色
    [muString1 addAttribute:NSUnderlineColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 10)];
    textView.attributedText = muString1;
    
    //边线宽度
    [muString1 addAttribute:NSStrokeWidthAttributeName value:@(1) range:NSMakeRange(10, 30)];
    textView.attributedText = muString1;
    
    //边线颜色,必须有边线宽度
    [muString1 addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:NSMakeRange(10, 10)];
    textView.attributedText = muString1;
    
    //阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor purpleColor];
    shadow.shadowOffset = CGSizeMake(0, 2);
    [muString1 addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, 50)];
    textView.attributedText = muString1;
    
    // 多个属性一起加载
    [muString1 addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSBackgroundColorAttributeName:[UIColor yellowColor]} range:NSMakeRange(0, muString1.length)];
    textView.attributedText = muString1;
    
    //排版(ios 只有横版没有竖版排版)
    [muString1 addAttribute:NSVerticalGlyphFormAttributeName value:@(1) range:NSMakeRange(0, 40)];
    textView.attributedText = muString1;
    //移除属性
    [muString1 removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, 20)];
    textView.attributedText = muString1;
    
    //插入图片,与字体大小不一样
    NSTextAttachment *attchment = [[NSTextAttachment alloc]init];
    attchment.image = [UIImage imageNamed:@"share.jpg"];
    NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:attchment];
    [muString1 insertAttributedString:imageString atIndex:20];
    textView.attributedText = muString1;
    //自己定义大小
    UIImage *icon = [UIImage imageNamed:@"share.jpg"];
    attchment.image = [self imageWithImage:icon scaleToSize:CGSizeMake(20, 20)];
    NSAttributedString *imageString2 = [NSAttributedString attributedStringWithAttachment:attchment];
    [muString1 insertAttributedString:imageString2 atIndex:20];
    textView.attributedText = muString1;
    //插入图片，与字体大小一样
    SYFTextAttachment *syfattchment = [[SYFTextAttachment alloc]init];
    syfattchment.image = [UIImage imageNamed:@"share.jpg"];
    NSAttributedString *imageString3 = [NSAttributedString attributedStringWithAttachment:syfattchment];
    [muString1 insertAttributedString:imageString3 atIndex:60];
    textView.attributedText = muString1;
}
//修改图片大小
- (UIImage *)imageWithImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
