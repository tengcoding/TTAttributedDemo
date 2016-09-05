//
//  ViewController.m
//  TTAttributedDemo
//
//  Created by 梁腾 on 16/9/5.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *hightLightLabel;
@property (weak, nonatomic) IBOutlet UILabel *fontLabel;
@property (weak, nonatomic) IBOutlet UILabel *paragraphLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 搜索文字高亮 */
    NSString *str = @"法国就同性婚姻进行公投";
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = [str rangeOfString:@"同性婚姻"];
    [attriString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
     //设置笔画粗细  负值填充 正值中空
    [attriString addAttribute:NSStrokeWidthAttributeName value:@4 range:range];
    //设置阴影效果
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowColor = [UIColor greenColor];
    [attriString addAttribute:NSShadowAttributeName value:shadow range:range];
    
    _hightLightLabel.attributedText = attriString;
    
    /** 单位下标等使用 */
    _fontLabel.attributedText = [self attStrWithCntStr:@"168(笔)"];
    
    /** 设置段落类型 */
    _paragraphLabel.numberOfLines = 0;
    NSString *paragraphStr = @"1.使用这个类，必须先导入CoreText框架。2.给UILabel设置attributedText了会导致给UILabel中text，font，textColor，shadowColor，shadowOffset，textAlignment，lineBreakMode这7个属性设置值时无效果。3.这个框架的应用场景一般在图文混排和搜索功能中应用比较多。";
    NSMutableAttributedString *paragraphString = [[NSMutableAttributedString alloc] initWithString:paragraphStr];
    //设置段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    //首行缩进
    style.firstLineHeadIndent = 20;
    //行距
    style.lineSpacing = 10;
    [paragraphString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [paragraphStr length])];
    _paragraphLabel.attributedText = paragraphString;
    
    /** 连体属性 */  // 0表示没有连体字符，1表示使用默认的连体字符 （可能和字体有关 没实现 ）  字符间距等也是这样设置
    NSString *engStr = @"An English translation is now being prepared.";
    NSMutableAttributedString *englishStr = [[NSMutableAttributedString alloc] initWithString:engStr];
    [englishStr addAttribute:NSLigatureAttributeName value:@1 range:NSMakeRange(0, [engStr length])];
    //加删除线
    [englishStr addAttribute:NSStrikethroughStyleAttributeName value:@3 range:NSMakeRange(3, 9)];
    //加下划线
    [englishStr addAttribute:NSUnderlineStyleAttributeName value:@2 range:NSMakeRange(9, 16)];
    _englishLabel.attributedText = englishStr;
    
}

/** 提取方法 */
- (NSMutableAttributedString *)attStrWithCntStr:(NSString *)cntStr{
   
    NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc] initWithString:cntStr];
    [newStr addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(0, [cntStr length] -3)];
    [newStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange([cntStr length] -3, 3)];
    [newStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, [cntStr length] - 3)];
    [newStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange([cntStr length] - 3, 3)];
    return newStr;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
