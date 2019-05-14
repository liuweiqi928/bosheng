//
//  shopbannerView.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/2/20.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import "shopbannerView.h"
#import "UIImageView+AFNetworking.h"
#import "UIButton+WebCache.h"

@implementation shopbannerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setArray:(NSArray *)imgArray{
    _totalNum = [imgArray count];
    if (_totalNum==0) {
        
    }else{
        
        _scrollView.contentSize = CGSizeMake((_totalNum+2)*PHONE_WIDTH, 0);
        _pageControl.numberOfPages = _totalNum; //设置页数
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self->_scrollView.mas_bottom).offset(-10*SCREENWIDTHS);
            make.size.mas_equalTo(CGSizeMake(10*SCREENWIDTHS*self->_totalNum, 20));
            
        }];
        
        UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, _scrollView.frame.size.height)];
        NSURL*url1=[NSURL URLWithString:[NSString stringWithFormat:@"%@Public/bannerimg/%@",baseUrl,imgArray[_totalNum-1]]];
        [button1 sd_setBackgroundImageWithURL:url1 forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        //        [button1 sd_setImageWithURL:url1 forState:UIControlStateNormal];
        
        
        //    button1.tag=0;
        
        //    [button addTarget:self action:@selector(bennerClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:button1];
        for (int i=1; i<=_totalNum; i++) {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(i*PHONE_WIDTH, 0, PHONE_WIDTH, _scrollView.frame.size.height)];
            NSURL*url=[NSURL URLWithString:[NSString stringWithFormat:@"%@Public/bannerimg/%@",baseUrl,imgArray[i-1]]];
            [button sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            
            
            button.tag=i;
            
            [button addTarget:self action:@selector(bennerClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_scrollView addSubview:button];
            
        }
        UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake((_totalNum+1)*PHONE_WIDTH, 0, PHONE_WIDTH,_scrollView.frame.size.height)];
        NSURL*url2=[NSURL URLWithString:[NSString stringWithFormat:@"%@Public/bannerimg/%@",baseUrl,imgArray[0]]];
        [button2 sd_setBackgroundImageWithURL:url2 forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        
        
        //    button.tag=0;
        
        //    [button addTarget:self action:@selector(bennerClick:) forControlEvents:UIControlEventTouchUpInside];
        if (_scrollView.contentOffset.x==0) {
            [_scrollView setContentOffset:CGPointMake(PHONE_WIDTH, 0)];
            _pageControl.currentPage=0;
        }
        
        [_scrollView addSubview:button2];
        
        
    }
}
//点击benner
-(void)bennerClick:(UIButton*)sender{
    if (self.clickbanner) {
        self.clickbanner(sender.tag);
    }
}






-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //   self.backgroundColor = [UIColor redColor];
        //活动benner
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;//设置代理UIscrollViewDelegate
        _scrollView.showsVerticalScrollIndicator = NO;//是否显示竖向滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;//是否显示横向滚动条
        _scrollView.pagingEnabled = YES;//是否设置分页
        [self addSubview:_scrollView];
        
        
        //点点
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];//点点颜色
        _pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
        _pageControl.tag = 100;
        [self addSubview:_pageControl];
        
        
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(self);
        }];
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self->_scrollView.mas_bottom).offset(-10*SCREENWIDTHS);
            make.size.mas_equalTo(CGSizeMake(50, 20));
            
        }];
        
        
        
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop  currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
        
    }
    return self;
}
//scrollview和pagecontrol关联
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = (scrollView.contentOffset.x) / scrollView.frame.size.width;   //当前是第几个视图
    
    if (index==0) {
        
        [_scrollView setContentOffset:CGPointMake((_totalNum)*PHONE_WIDTH, 0) animated:NO];
        _pageControl.currentPage = _totalNum;
        
    }else
        if (index==_totalNum+1){
            [_scrollView setContentOffset:CGPointMake(PHONE_WIDTH, 0) animated:NO];
            _pageControl.currentPage = 0;
            
            
        }else{
            _pageControl.currentPage = index-1;
            
        }
    [_timer setFireDate:[NSDate dateWithTimeInterval:3 sinceDate:[NSDate date]]];
    
    
    
}
- (void)openTimer{
    [_timer setFireDate:[NSDate distantPast]];//开启定时器
}
- (void)closeTimer{
    [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
}

//开始拖拽的代理方法，在此方法中暂停定时器。
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //    NSLog(@"正在拖拽视图，所以需要将自动播放暂停掉");
    //setFireDate：设置定时器在什么时间启动
    //[NSDate distantFuture]:将来的某一时刻
    [_timer setFireDate:[NSDate distantFuture]];
}





//定时滑动
-(void)timerAction:(NSTimer *)timer{
    if (_totalNum>1) {
        CGPoint newOffset = _scrollView.contentOffset;
        newOffset.x = newOffset.x + CGRectGetWidth(_scrollView.frame);
        
        int index = newOffset.x / CGRectGetWidth(_scrollView.frame);   //当前是第几个视图
        newOffset.x = index * CGRectGetWidth(_scrollView.frame);
        [_scrollView setContentOffset:newOffset animated:YES];
        _pageControl.currentPage = index-1;
        
        if (index>_totalNum) {
            [_scrollView setContentOffset:CGPointMake(PHONE_WIDTH, 0) animated:NO];
            
            _pageControl.currentPage = 0;
            
        }
        
        //        }
    }else{
        [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
    }
}
@end
