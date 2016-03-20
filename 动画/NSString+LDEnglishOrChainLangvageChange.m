//
//  NSString+LDEnglishOrChainLangvageChange.m
//  Have
//
//  Created by 联动在线 on 15/10/9.
//  Copyright (c) 2015年 Liandongzaixian. All rights reserved.
//

#import "NSString+LDEnglishOrChainLangvageChange.h"

@implementation NSString (LDEnglishOrChainLangvageChange)
+(NSString*)languageWhithChinese:(NSString*)chinese english:(NSString*)english
{

    if ([kUserDefaults boolForKey:UD_CHINES_LANGUAGE]) {
        return chinese;
    }else{
    
        return english;
    }
   


}
@end
