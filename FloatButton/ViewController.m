//
//  ViewController.m
//  FloatButton
//
//  Created by Human on 15/8/26.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

}
@property (nonatomic,retain)UITableView *table;
@property(nonatomic,retain)UIButton *floatbutton;
@property(nonatomic,retain)UIButton *staybutton;
@property(nonatomic,retain)UIButton *testbutton;
@property(nonatomic,retain)NSTimer *timer;
@property(nonatomic,assign)CGFloat l;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"浮动按钮测试";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
 //   self.navigationController.navigationBar.translucent=NO;
 //   [self.navigationController.navigationBar setAlpha:0.5];
    [self initTable];
    [self addbutton];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)initTable{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeigth-64) style:UITableViewStylePlain];
    //_table.separatorStyle=NO;
    _table.backgroundColor=[UIColor whiteColor];
    _table.delegate=self;
    _table.dataSource=self;
    _table.pagingEnabled=YES;
    [self.view addSubview:_table];
    
}

-(void)addbutton{
    _staybutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _staybutton.backgroundColor=[UIColor greenColor];
    _staybutton.frame=CGRectMake(ScreenWidth-80, ScreenHeigth-64-80, 60, 60);
    [_staybutton addTarget:self action:@selector(tiaodi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_staybutton];
    
    _floatbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _floatbutton.backgroundColor=[UIColor yellowColor];
    _floatbutton.frame=CGRectMake(ScreenWidth-80, 3*(ScreenHeigth-64)-80, 60, 60);
    _floatbutton.hidden=YES;
    [_floatbutton addTarget:self action:@selector(tiaodi) forControlEvents:UIControlEventTouchUpInside];
    [self.table addSubview:_floatbutton];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(20, 200, 200, 100)];
    view.backgroundColor=[UIColor blackColor];
    [self.view addSubview:view];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(0, 0, 100, 100);
    btn.backgroundColor=[UIColor yellowColor];
    [btn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    _testbutton=btn;
    [view addSubview:btn];
}

-(void)test:(UIButton *)btn{
    
   _testbutton.backgroundColor=[UIColor whiteColor];
    [_testbutton setTitle:@"操" forState:UIControlStateNormal];
    
}

-(void)tiaodi{
    
    
    [self.table setContentOffset:CGPointMake(0, self.table.contentSize.height -self.table.bounds.size.height) animated:YES];
}



#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier;
    cellIdentifier = @"MainCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    for (UIView *view in cell.subviews) {
//        if (![view isKindOfClass:[UIScrollView class]]) {
//            [view removeFromSuperview];
//        }
//    }
//    [cell removeFromSuperview];
//    cell = nil;
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor redColor];
    if(indexPath.row%2==1)
        cell.backgroundColor=[UIColor blueColor];
    if(indexPath.row==3)
        cell.backgroundColor=[UIColor grayColor];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    firstXiangQingTableViewCell *qCell = (firstXiangQingTableViewCell*)cell;
//    qCell.backgroundColor = [UIColor colorWithHexString:@"f9f9f9"];
//    qCell.numberIndexRow = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    qCell.delegate2 = self;
//    [qCell resetViewView:[self.fisrtXiangQingArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    firstXiangQingTableViewCell *qCell=  [[firstXiangQingTableViewCell alloc]init];
//    float f = [qCell getCellHeight:[self.fisrtXiangQingArray objectAtIndex:indexPath.row]];
    if(indexPath.row<3)
    return ScreenHeigth-64;
    else
        return (ScreenHeigth-64)/2;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
////    firstXiangQingViewController *bVC = [[firstXiangQingViewController alloc]initWithXiangQingDic:[self.fisrtXiangQingArray objectAtIndex:indexPath.row]];
////    [self.navigationController pushViewController:bVC animated:YES];
//}


- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
//    CGRect f = _stretchView.frame;
//    f.size.width =self.tableView.frame.size.width;
//    _stretchView.frame = f;
    if(_timer!=nil){
        
        [_timer invalidate];
        _timer = nil;
    }
    
  //  NSLog(@"%f",scrollView.contentOffset.y);
    if(scrollView.contentOffset.y>2*(ScreenHeigth-64)){
       
        _floatbutton.hidden=NO;
        _staybutton.hidden=YES;
    }else{
        
        _floatbutton.hidden=YES;
        _staybutton.hidden=NO;
        
    }
    
    
    if((_l>2*(ScreenHeigth-64))){
        if(scrollView.contentOffset.y<=2*(ScreenHeigth-64)){
            [scrollView setContentOffset:CGPointMake(0,2*(ScreenHeigth-64)) animated:NO];
            
            scrollView.pagingEnabled=YES;
        }
    }
    
    
    [UIView animateWithDuration:0.5 animations:^{
        _floatbutton.alpha=1;
        _staybutton.alpha=1;    }
                     completion:^(BOOL finished) {
       // [showlab removeFromSuperview];
    }];
    
    
//    {
////        _btntop.hidden=NO;
////        _btntop.frame=CGRectMake(200,64-( scrollView.contentOffset.y-(defaultViewHeight-64+6)), 40, 40);
////        
////        if(64-( scrollView.contentOffset.y-(defaultViewHeight-64+6))<20){
////            _btntop.frame=CGRectMake(200,20, 40, 40);
////            
////        }
//        
//    }else {
//        
//      //  _btntop.hidden=YES;
//    }
    
    //   NSLog(@"按钮%f",_btn.bounds.origin.y);
    // if(scrollView.contentOffset.y < 0) {

    //  }
    //  CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    
    //    CGFloat ImageHeight  = _view.frame.size.height;
    //    CGFloat ImageWidth  = _view.frame.size.width;
    //    CGFloat yOffset=(scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    //    if (scrollView.contentOffset.y < 0) {
    //
    //        CGFloat factor = ((ABS(yOffset)+ImageHeight)*ImageWidth)/ImageHeight;
    //        CGRect f = CGRectMake(-(factor-ImageWidth)/2, 0, factor, ImageHeight+ABS(yOffset));
    //       _view.frame = f;
    //    } else {
    //        CGRect f =_view.frame;
    //        f.origin.y = -yOffset;
    //        _view.frame = f;
    //    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
   _l =scrollView.contentOffset.y;
  //  lastContentOffset=0.001;
    NSLog(@"%.0f",_l);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if(_l==2*(ScreenHeigth-64))
    {
       if (_l < scrollView.contentOffset.y) {
        NSLog(@"向上滚动");
           scrollView.pagingEnabled=NO;
       }else{
        NSLog(@"向下滚动");
           [scrollView setContentOffset:CGPointMake(0,1*(ScreenHeigth-64)) animated:YES];
           scrollView.pagingEnabled=YES;
       }
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
// if(   scrollView.contentOffset.y>=2*(ScreenHeigth-64))
//     _table.pagingEnabled=NO;
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
    
    
    
    
}


-(void)scrollTimer{
    [UIView animateWithDuration:0.5 animations:^{
        _floatbutton.alpha=0;
        _staybutton.alpha=0;    }
                     completion:^(BOOL finished) {
                         // [showlab removeFromSuperview];
                         _floatbutton.hidden=YES;
                         _staybutton.hidden=YES;

                     }];
    
    
    
    
    [_timer invalidate];
    _timer = nil;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
