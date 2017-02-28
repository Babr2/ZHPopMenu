
//
//  ZHPopMenuItem.m
//  DOTA2
//
//  Created by Babr2 on 17/2/28.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import "ZHPopMenuItem.h"

@interface ZHPopMenuItem()

@end

@implementation ZHPopMenuItem

+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    
    return [[[self class] alloc] initWithImage:image
                                         title:title
                                    titleColor:titleColor
                                        target:target
                                        action:action];
}
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    
    if(self=[super init]){
        
        _font=[UIFont systemFontOfSize:14];
        _image=image;
        _title=[title copy];
        _titleColor=titleColor;
        _target=target;
        _action=action;
    }
    return self;
}

@end
