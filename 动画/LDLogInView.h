//
//  LDLogInView.h
//  Have
//
//  Created by zhanghui on 15/10/14.
//  Copyright © 2015年 Liandongzaixian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LDLogInViewDelegate <NSObject>

-(void)ldLogInViewDidSelectedAtIndex:(NSInteger)index;

@end

@interface LDLogInView : UIView


+(void)shareLogoInView:(UIView*)view;
@property(nonatomic,assign)id<LDLogInViewDelegate>delegate;

@end
