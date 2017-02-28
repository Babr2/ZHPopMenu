//
//  ZHPopMenu.h
//  DOTA2
//
//  Created by Babr2 on 17/2/28.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHPopMenuItem.h"

/**
 An easy, quick, simple way to create a popover menu. surposed to be the most popular and friendly iOS pop View
 - https://github.com/Babr2/ZHPopMenu 
 - Copyright all rights reserved @Babr2 2017
 - An Issue or a fork will be appreciated.
 */
@interface ZHPopMenu : UIView

@property(nonatomic,strong)UIColor          *mianColor;          //default is darkGrayColor
@property(nonatomic,assign)CGFloat          rowHeight;           //default is 44;
@property(nonatomic,strong)UIColor          *sperateColor;       //default lightGrayColor
@property(nonatomic,assign)UIEdgeInsets     sperateInsets;       //default UIEdgeInsetsZero


/**
 instance method to create a ZHPopMenu

 @param frame frame
 @param items items<ZHPopMenuItem *>
 @param arrowHeight heihgt of row
 @param arrowPosition arrow posistion, the direction of arrow can be auto-cacluted base on this property.
 @return ZHPopMenu
 */
-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition;

/**
 quick initialize method to create a ZHPopMenu
 
 @param frame frame
 @param items items<ZHPopMenuItem *>
 @param arrowHeight heihgt of row
 @param arrowPosition arrow posistion, the direction of arrow can be auto-cacluted base on this property.
 @return ZHPopMenu
 */
+(instancetype)menuWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition;

/**
 @optional Any item property changed, use reload if need. 
 */
-(void)reload;

@end

