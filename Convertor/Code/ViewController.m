//
//  ViewController.m
//  Convertor
//
//  Created by wangjianle on 14-5-14.
//  Copyright (c) 2014年 wangjianle. All rights reserved.
//

#import "ViewController.h"
#import "UIPlaceHolderTextView.h"
#import "convertGB_BIG.h"
@interface ViewController ()<UITextViewDelegate>
{
    UIPlaceHolderTextView *_inputTextView;
    UITextView *_convertTextView;
    
    convertGB_BIG *_convertManager;
    
    UIButton  *_lastClickBtn;

    NSString *_theInputText;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    _convertManager=[[convertGB_BIG alloc]init];

}
-(void)setupViews
{
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:self.view.frame];
    if (iPhone5)
    {
        backImage.image = [UIImage imageNamed:@"BackgroudImage.png"];
    }else
    {
        backImage.image = [UIImage imageNamed:@"BackgroudImage_1136.png"];
    }
    [self.view addSubview:backImage];
    
    _inputTextView =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(kInputTextViewX, kInputTextViewY, kInputTextViewW , kInputTextViewH )];
    [_inputTextView setBackgroundColor:[UIColor clearColor]];
    [_inputTextView setReturnKeyType:UIReturnKeyDone];
    _inputTextView.delegate=self;
    _inputTextView.font=kSystemFont(18);
    [self.view addSubview:_inputTextView];
    
    _convertTextView =[[UITextView alloc]initWithFrame:CGRectMake(kInputTextViewX, kConvertTextViewY, kInputTextViewW , kConvertTextViewH )];
    [_convertTextView setBackgroundColor:[UIColor clearColor]];
    _convertTextView.editable=NO;
    _convertTextView.font=kSystemFont(18);
    [self.view addSubview:_convertTextView];
    
    NSArray * backImageArray = @[@"hotBtnImage.png",@"subBtnImage.png",@"muchBtnImage.png"];
    NSArray * selectedBackImageArray = @[@"selectedHotBtnImage.png",@"selectedSubBtnImage.png",@"selectedMuchBtnImage.png"];

    UIButton *button = nil;
    for (int i = 0; i<3 ; i++) {
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(kActionButtonX+ (i* (kActionButtonSpace+kActionButtonW)), kActionButtonY, kActionButtonW, kActionButtonH);
        button.tag = 100+i;
        [button setBackgroundImage:[UIImage imageNamed:backImageArray[i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selectedBackImageArray[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}
-(IBAction)buttonPressed:(UIButton*)btn{
    [_inputTextView resignFirstResponder];
    _theInputText = _inputTextView.text;

    [_convertTextView setText:@""];
    
    if (_lastClickBtn != nil)
    {
        if (_lastClickBtn.tag != btn.tag)
        {
            btn.selected = !btn.selected;
            _lastClickBtn.selected = !_lastClickBtn.selected;
            _lastClickBtn = btn;
        }
    }else
    {
        btn.selected = !btn.selected;
        _lastClickBtn = btn;
    }
    switch (btn.tag) {
        case 100:
            [self conformhot];
            break;
            
        case 101:
            [self conformsub];
            break;
            
        case 102:
            [self conformmuch];
            break;
            
        default:
            break;
    }

}

-(void)conformmuch{
    //简体转繁体
    NSString *bigString = [_convertManager gbToBig5:_theInputText];
    _convertTextView.text=bigString;
}
-(void)conformsub{
    //简体拆字
    NSString *subString = [_convertManager subTo:_theInputText];
    _convertTextView.text=subString;
}
-(void)conformhot{
    //简体转火星文
    NSString *hotString = [_convertManager gbToHot:_theInputText];
    _convertTextView.text=hotString;
}

#pragma mark textView delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [_inputTextView resignFirstResponder];
        _theInputText = _inputTextView.text;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
