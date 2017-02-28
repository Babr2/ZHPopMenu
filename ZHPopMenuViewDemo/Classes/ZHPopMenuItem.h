//
//  ZHPopMenuItem.h
//  DOTA2
//
//  Created by Babr2 on 17/2/28.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZHPopMenuItem : NSObject

@property(nonatomic,strong)UIImage  *image;
@property(nonatomic,copy)NSString   *title;
@property(nonatomic,strong)UIColor  *titleColor;
@property(nonatomic,strong)UIFont   *font; //default is 14
@property(nonatomic,weak)id         target;
@property(nonatomic)SEL             action;


-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end
