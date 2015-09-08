//
//  TopTestVC.m
//  FloatButton
//
//  Created by Human on 15/9/8.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import "TopTestVC.h"

@interface TopTestVC ()
@property (nonatomic,retain)UIView *main;//主视图

@property (nonatomic,retain)UIView *topView;//头部视图

@property(nonatomic,retain)NSString *keyWord;//关键词
@property(nonatomic,retain)NSString *brandWord;//品牌


@property(nonatomic,retain)UIView *keyWordView;//关键词
@property(nonatomic,retain)UIView *brandWordView;//品牌



@property(nonatomic,retain)UILabel *keyWordLabel;//关键词标签
@property(nonatomic,retain)UILabel *brandWordLabel;//品牌标签

@end

@implementation TopTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"头部搜索按钮测试";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    [self initMain];
    
    _keyWord=@"";
    _brandWord=@"";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    


    
 
    
    
    
    if(_keyWord.length>0&&_brandWord.length>0){
        
        
    [UIView animateWithDuration:0.8 animations:^{
      
        _main.frame=CGRectMake(0, 64+40, ScreenWidth, ScreenHeigth-64-40);
    } completion:^(BOOL finished) {
      
    }];
        
        
        
    }else if (_keyWord.length>0){
        
        _brandWordView.hidden=YES;
        
        
         _keyWordView.frame=CGRectMake(5, 5, ScreenWidth-10, 30);
        _keyWordLabel.frame=CGRectMake(0, 0, _keyWordView.frame.size.width-20, _keyWordView.frame.size.height);

        [UIView animateWithDuration:0.8 animations:^{
            
            
            _main.frame=CGRectMake(0, 64+40, ScreenWidth, ScreenHeigth-64-40);
            
        } completion:^(BOOL finished) {
            
        }];

    }else if(_brandWord.length>0){
        
        
    }else{
        
        
        
        [UIView animateWithDuration:0.8 animations:^{
            
            
        _main.frame=CGRectMake(0, 64, ScreenWidth, ScreenHeigth-64);
            
        } completion:^(BOOL finished) {
          
            
            
        }];
        
        
        
    }
    
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    
    
    
}

-(void)initMain{
    _main=[[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeigth-64)];
    _main.backgroundColor=[UIColor redColor];
    [self.view addSubview:_main];

    _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 40)];
    _topView.backgroundColor=[UIColor grayColor];
    
    
    _keyWordView=[[UIView alloc]initWithFrame:CGRectMake(5, 5, ScreenWidth/2-10+2.5, 30)];
    _keyWordView.backgroundColor=[UIColor yellowColor];
    [_topView addSubview:_keyWordView];
    
    _keyWordLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _keyWordView.frame.size.width-20, _keyWordView.frame.size.height)];
    _keyWordLabel.text=@"关键词";
    _keyWordLabel.textAlignment=NSTextAlignmentCenter;
    _keyWordLabel.font=[UIFont boldSystemFontOfSize:18];
    [_keyWordView addSubview:_keyWordLabel];
    
    
    
    _brandWordView=[[UIView alloc]initWithFrame:CGRectMake(2.5+ScreenWidth/2, 5, ScreenWidth/2-10+2.5, 30)];
    _brandWordView.backgroundColor=[UIColor greenColor];
    [_topView addSubview:_brandWordView];
    
    _brandWordLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _keyWordView.frame.size.width-20, _keyWordView.frame.size.height)];
    _brandWordLabel.text=@"品牌";
    _brandWordLabel.textAlignment=NSTextAlignmentCenter;
    _brandWordLabel.font=[UIFont boldSystemFontOfSize:18];
    [_brandWordView addSubview:_brandWordLabel];
    
    
    
    [self.view addSubview:_topView];
    [self.view sendSubviewToBack:_topView];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
