//
//  ViewController.m
//  ZHPopMenuViewDemo
//
//  Created by Babr2 on 17/3/1.
//  Copyright © 2017年 Babr2. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ZHPopMenu.h"

#define zh_width    ([UIScreen mainScreen].bounds.size.width)
#define zh_height   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property(nonatomic,strong)ZHPopMenu *menu;
@property(nonatomic,strong)UIControl *back;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setup];
    [self createUI];
}
-(void)setup{
    
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    self.title=@"ZHPopMenuViewDemo";
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
}
-(void)createUI{
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClickAction:)];
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)addBtnClickAction:(UIBarButtonItem *)sender{
    
    if(self.menu.superview){//hide
        
        [self zh_didmissMenu];
        
    }else{//show
        
        [self.view addSubview:self.back];
        __weak typeof(self) wkself=self;
        [self.back mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(wkself.view);
        }];
        [self.view addSubview:self.menu];
        [self.menu mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(wkself.view).offset(-10);
            make.top.equalTo(wkself.view).offset(64);
            make.size.mas_equalTo(CGSizeMake(120, 130));
        }];
    }
}
-(ZHPopMenu *)menu{
    
    if(!_menu){
        
        NSMutableArray *items=[NSMutableArray array];
        NSArray *titles=@[@"走势",@"自选股",@"编辑",@"音乐"];
        for(int i=0;i<titles.count;i++){
            
            NSString *imgageName=[NSString stringWithFormat:@"%d",i+1];
            UIImage *image=[UIImage imageNamed:imgageName];
            ZHPopMenuItem *item=[ZHPopMenuItem itemWithImage:image
                                                       title:titles[i]
                                                  titleColor:[UIColor whiteColor]
                                                      target:self
                                                      action:@selector(zh_menuItemAction:)];
            /** optional
             
             *  item.font=[UIFont systemFontOfSize:14];
             */
            [items addObject:item];
        }
        _menu=[ZHPopMenu menuWithFrame:CGRectMake(zh_width-130, 64, 120, 130)
                                 items:items
                           arrowHeight:10
                         arrowPosition:CGPointMake(80, 0)];
        
        _menu.rowHeight=40;
        _menu.sperateInsets=UIEdgeInsetsMake(0, 10, 0, 10);
        //optional(可选)
        /*
        _menu.rowHeight=40;
        _menu.mianColor=[UIColor darkGrayColor];
        _menu.sperateColor=[UIColor whiteColor];
        _menu.sperateInsets=UIEdgeInsetsMake(0, 10, 0, 10);
         */
    }
    return _menu;
}
-(UIControl *)back{
    
    if(!_back){
        
        _back=[[UIControl alloc] initWithFrame:self.view.bounds];
        _back.backgroundColor=[UIColor colorWithWhite:0 alpha:0.8];
        _back.alpha=0.3;
        [_back addTarget:self action:@selector(zh_didmissMenu) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back;
}
-(void)zh_menuItemAction:(ZHPopMenuItem *)sender{
    
    NSString *title=[sender.title copy];
    NSLog(@"You Clicked %@",title);
}
-(void)zh_didmissMenu{
    
    [self.back removeFromSuperview];
    [self.menu removeFromSuperview];
}

@end
