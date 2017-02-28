//
//  ZHPopMenu.h
//  DOTA2
//
//  Created by Babr2 on 17/2/28.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHPopMenuItem.h"

@interface ZHPopMenu : UIView

@property(nonatomic,strong)UIColor          *mianColor;          //default is darkGrayColor
@property(nonatomic,assign)CGFloat          rowHeight;           //default is 44;
@property(nonatomic,strong)UIColor          *sperateColor;       //default lightGrayColor
@property(nonatomic,assign)UIEdgeInsets     sperateInsets;       //default UIEdgeInsetsZero

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition;
+(instancetype)menuWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition;
-(void)reload;
@end
