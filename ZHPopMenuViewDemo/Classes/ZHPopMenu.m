//
//  ZHPopMenu.m
//  DOTA2
//
//  Created by Babr2 on 17/2/28.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import "ZHPopMenu.h"

//arrow direction
typedef enum : NSUInteger {
    
    ZHPopMenuArrwoDirectionLeft,
    ZHPopMenuArrwoDirectionRight,
    ZHPopMenuArrwoDirectionUp,
    ZHPopMenuArrwoDirectionDown
    
} ZHPopMenuArrwoDirection;

@interface ZHPopMenu()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)CGFloat      arrowHeight;
@property(nonatomic,assign)CGPoint      arrowPosition;
@property(nonatomic,strong)NSArray      *items;
@property(nonatomic,strong)UITableView  *tbView;

@end

@implementation ZHPopMenu

+(instancetype)menuWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition{
    
    return [[[self class] alloc] initWithFrame:frame
                                         items:items
                                   arrowHeight:arrowHeight
                                 arrowPosition:arrowPosition];
}
-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<ZHPopMenuItem *> *)items arrowHeight:(CGFloat)arrowHeight arrowPosition:(CGPoint)arrowPosition{
    
    if(self=[super initWithFrame:frame]){
        
        _mianColor=[UIColor darkGrayColor];
        _rowHeight=44;
        _sperateColor=[UIColor lightGrayColor];
        _sperateInsets=UIEdgeInsetsZero;
        
        _items=items;
        _arrowHeight=arrowHeight;
        _arrowPosition=arrowPosition;
        
        [self setupMenu];
    }
    return self;
}
-(ZHPopMenuArrwoDirection)arrwoDirection{
    
    if(_arrowPosition.y==0){
        
        return ZHPopMenuArrwoDirectionUp;
        
    }else if(_arrowPosition.y==self.bounds.size.height){
        
        return ZHPopMenuArrwoDirectionDown;
        
    }else if(_arrowPosition.x==0){
        
        return ZHPopMenuArrwoDirectionLeft;
        
    }else if(_arrowPosition.x==self.bounds.size.width){
        
        return ZHPopMenuArrwoDirectionRight;
    }
    return ZHPopMenuArrwoDirectionUp;
}
-(void)drawRect:(CGRect)rect{
    
    ZHPopMenuArrwoDirection direction=[self arrwoDirection];
    UIBezierPath *path=[UIBezierPath bezierPath];
    [_mianColor setFill];
    
    CGPoint p1;
    CGPoint p2;
    CGPoint p3;
    CGFloat length=(_arrowHeight*1.414);
    switch (direction) {
        case ZHPopMenuArrwoDirectionUp:
            
            p1=CGPointMake(_arrowPosition.x, _arrowHeight);
            p2=CGPointMake(_arrowPosition.x+length/2, 0);
            p3=CGPointMake(_arrowPosition.x+length, _arrowHeight);
            break;
        case ZHPopMenuArrwoDirectionDown:
            
            p1=CGPointMake(_arrowPosition.x, self.bounds.size.height-_arrowHeight);
            p2=CGPointMake(_arrowPosition.x+length/2, self.bounds.size.height);
            p3=CGPointMake(_arrowPosition.x+length, self.bounds.size.height-_arrowHeight);
            break;
        case ZHPopMenuArrwoDirectionLeft:
            
            p1=CGPointMake(_arrowHeight, _arrowPosition.y);
            p2=CGPointMake(0, _arrowPosition.y+length/2);
            p3=CGPointMake(_arrowHeight, _arrowPosition.y+length);
            break;
        case ZHPopMenuArrwoDirectionRight:

            p1=CGPointMake(self.bounds.size.width-_arrowHeight, _arrowPosition.y);
            p2=CGPointMake(self.bounds.size.width, _arrowPosition.y+length/2);
            p3=CGPointMake(self.bounds.size.width-_arrowHeight, _arrowPosition.y+length);
            break;
            
        default:
            break;
    }
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path fill];
    [path closePath];
}
-(void)setupMenu{
    
    self.backgroundColor=[UIColor clearColor];
    CGRect rect;
    ZHPopMenuArrwoDirection direction=[self arrwoDirection];
    switch (direction) {
        case ZHPopMenuArrwoDirectionUp:
            
            rect=CGRectMake(0, _arrowHeight, self.bounds.size.width, self.bounds.size.height-_arrowHeight);
            break;
        case ZHPopMenuArrwoDirectionDown:
            
            rect=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-_arrowHeight);
            break;
        case ZHPopMenuArrwoDirectionLeft:
            
            rect=CGRectMake(_arrowHeight, 0, self.bounds.size.width-_arrowHeight, self.bounds.size.height);
            break;
        case ZHPopMenuArrwoDirectionRight:
            
            rect=CGRectMake(0, 0, self.bounds.size.width-_arrowHeight, self.bounds.size.height);
            break;
            
        default:
            break;
    }
    _tbView=[[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tbView.separatorColor=_sperateColor;
    _tbView.backgroundColor=_mianColor;
    _tbView.delegate=self;
    _tbView.dataSource=self;
    _tbView.layer.cornerRadius=4;
    _tbView.showsVerticalScrollIndicator=NO;
    [self addSubview:_tbView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *zh_pop_men_cid=@"zh_pop_men_cid";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:zh_pop_men_cid];
    if(!cell){
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:zh_pop_men_cid];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    ZHPopMenuItem *item=[_items objectAtIndex:indexPath.row];
    cell.textLabel.text=[item.title copy];
    cell.textLabel.textColor=item.titleColor;
    cell.textLabel.font=item.font;
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    cell.imageView.image=item.image;
    cell.separatorInset=_sperateInsets;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZHPopMenuItem *item=[_items objectAtIndex:indexPath.row];
    [item.target performSelectorOnMainThread:item.action withObject:item waitUntilDone:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _rowHeight;
}

#pragma mark - setter
-(void)setMianColor:(UIColor *)mianColor{
    
    _mianColor=mianColor;
    _tbView.backgroundColor=mianColor;
    [self setNeedsDisplay];//重绘箭头 会调用drawRect:
}
-(void)setRowHeight:(CGFloat)rowHeight{
    
    _rowHeight=rowHeight;
    [_tbView reloadData];
}
-(void)setSperateColor:(UIColor *)sperateColor{
    
    _sperateColor=sperateColor;
    _tbView.separatorColor=sperateColor;
}
-(void)setSperateInsets:(UIEdgeInsets)sperateInsets{
    
    _sperateInsets=sperateInsets;
    [_tbView reloadData];
}
-(void)reload{
    
    [_tbView reloadData];
}
@end
