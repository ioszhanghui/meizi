//
//  LDLogInView.m
//  Have
//
//  Created by zhanghui on 15/10/14.
//  Copyright © 2015年 Liandongzaixian. All rights reserved.
//

#import "LDLogInView.h"

static LDLogInView * logoView;

@interface LDLogInView()

@property(nonatomic,retain)UIView *bgView;
@property(nonatomic,retain)UIButton* logoButton;
@property(nonatomic,retain)UIButton * crossButton;
@property(nonatomic,retain)UILabel * desLabel;
@property(nonatomic,retain)UIButton * signUpButton;
@property(nonatomic,retain)UIButton *signInButton;
@property(nonatomic,retain)UILabel * subTitle;
@property(nonatomic,retain)UIButton *qqSignIn;
@property(nonatomic,retain)UIButton * blogButton;

@property(nonatomic,retain)UIButton * policyButton;
@property(nonatomic,retain)UIButton * termButton;

@end

@implementation LDLogInView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if(self=[super initWithFrame:frame])
    {
        CGFloat width=kWindowWidth-kScaleForLength(40);
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        
        self.bgView=[[UIView alloc]initWithFrame:CGRectMake(kScaleForLength(20), kScaleForLength(114),width, kScaleForLength(300))];
        self.bgView.backgroundColor=kBgBlack;
        [self addSubview:self.bgView];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        //        [UIView setAnimationDelay:0.5];
        [UIView setAnimationDelegate:self];
        //    [UIView setAnimationDidStopSelector:@selector(showMenuStop)];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView commitAnimations];
        
        
        self.logoButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.logoButton.frame=CGRectMake(0, kScaleForLength(20), width, kScaleForLength(60));
        [self.logoButton setImage:[UIImage imageNamed:@"icn_logo_big@2x.png"] forState:UIControlStateNormal];
        [self.logoButton setTitle:[NSString languageWhithChinese:@"时装" english:@"Have"] forState:UIControlStateNormal];
        self.logoButton.titleLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:30];
        [self.bgView addSubview:self.logoButton];

        self.crossButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.crossButton.frame=CGRectMake(kScaleForLength(220), 0, kScaleForLength(60), kScaleForLength(60));
        [self.crossButton setImage:[UIImage imageNamed:@"btn_fb_cross@2x.png"] forState:UIControlStateNormal];
        [self.crossButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        self.crossButton.tag=0;
        [self.bgView addSubview:self.crossButton];
        
        self.desLabel=[[UILabel alloc]initWithFrame:CGRectMake(kScaleForLength(0), kScaleForLength(80), width, kScaleForLength(14))];
        self.desLabel.text=[NSString languageWhithChinese:@"一款设计你的家的软件" english:@"THE NEW WAY TO DESIGN YOUR HOME"];
        self.desLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        self.desLabel.textAlignment=NSTextAlignmentCenter;
        [self.bgView addSubview:self.desLabel];
        
        
        self.signUpButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.signUpButton.frame=CGRectMake(kScaleForLength(105), kScaleForLength(109), kScaleForLength(70), kScaleForLength(44));
        [self.signUpButton setBackgroundImage:[UIImage imageNamed:@"btn_container@2x.png"] forState:UIControlStateNormal];
        [self.signUpButton setTitle:[NSString languageWhithChinese:@"注册" english:@"Sign Up"] forState:UIControlStateNormal];
        self.signUpButton.tag=1;
        [self.signUpButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        self.signUpButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [self.bgView addSubview:self.signUpButton];
        
        self.signInButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.signInButton.frame=CGRectMake(kScaleForLength(105), kScaleForLength(109), kScaleForLength(70), kScaleForLength(44));
        [self.signInButton setBackgroundImage:[UIImage imageNamed:@"btn_container@2x.png"] forState:UIControlStateNormal];
        [self.signInButton setTitle:[NSString languageWhithChinese:@"登陆" english:@"Sign In"] forState:UIControlStateNormal];
        self.signInButton.tag=2;
        [self.signInButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        self.signInButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [self.bgView addSubview:self.signInButton];
        
        self.subTitle=[[UILabel alloc]initWithFrame:CGRectMake(kScaleForLength(20), kScaleForLength(227), kScaleForLength(120), kScaleForLength(14))];
        self.subTitle.text=[NSString languageWhithChinese:@"其他登陆方式" english:@"Other Sign In Options:"];
        self.subTitle.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        self.subTitle.textAlignment=NSTextAlignmentCenter;
        [self.bgView addSubview:self.subTitle];
        
        self.blogButton=[UIButton buttonWithType:UIButtonTypeCustom];
        self.blogButton.frame=CGRectMake(kScaleForLength(160), kScaleForLength(212), kScaleForLength(44), kScaleForLength(44));
        [self.blogButton setImage:[UIImage imageNamed:@"btn_social_weibo.png"] forState:UIControlStateNormal];
        [self.blogButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        self.blogButton.tag=3;
        [self.bgView addSubview:self.blogButton];
        
        self.qqSignIn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.qqSignIn.frame=CGRectMake(kScaleForLength(160), kScaleForLength(212), kScaleForLength(44), kScaleForLength(44));
        [self.qqSignIn setImage:[UIImage imageNamed:@"btn_social_weibo.png"] forState:UIControlStateNormal];
        [self.qqSignIn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        self.qqSignIn.tag=4;
        [self.bgView addSubview:self.qqSignIn];
        
        
        self.policyButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.policyButton setTitle:[NSString languageWhithChinese:@"条款" english:@"Privacy Policy"] forState:UIControlStateNormal];
        self.policyButton.titleLabel.font=[UIFont systemFontOfSize:11];
        [self.policyButton setTitleColor:kSetUpCololor(123, 123, 123, 1) forState:UIControlStateNormal];
        self.policyButton.frame=CGRectMake(kScaleForLength(15), kScaleForLength(256), kScaleForLength(99), kScaleForLength(44));
        self.policyButton.tag=5;
        [self.policyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        [self.bgView addSubview:self.policyButton];
        
        
        self.termButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.termButton setTitle:[NSString languageWhithChinese:@"条款规定" english:@"Terms of Use"] forState:UIControlStateNormal];
        self.termButton.titleLabel.font=[UIFont systemFontOfSize:11];
        [self.termButton setTitleColor:kSetUpCololor(123, 123, 123, 1) forState:UIControlStateNormal];
        self.termButton.frame=CGRectMake(kScaleForLength(155), kScaleForLength(256), kScaleForLength(99), kScaleForLength(44));
        self.termButton.tag=6;
        [self.termButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        [self.bgView addSubview:self.termButton];
        
    }
    
    return self;
}

#pragma mark button的响应方法
-(void)buttonAction:(UIButton*)button
{
    
    switch (button.tag) {
        case 0:
        {
            [self removeFromSuperview];
            
            break;
        }
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        {
            
            [self removeFromSuperview];
            [self.delegate ldLogInViewDidSelectedAtIndex:button.tag-1];
            
            break;
        }
            
        default:
            break;
    }
    
}

#pragma mark 添加登陆界面
+(void)shareLogoInView:(UIView*)view
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logoView=[[LDLogInView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    });
    [view addSubview:logoView];
}

@end
