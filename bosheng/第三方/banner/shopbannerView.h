//
//  shopbannerView.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/2/20.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface shopbannerView : UIView<UIScrollViewDelegate>
{
    NSTimer *_timer;
    NSMutableArray *imageArray;
}
//点击banner
typedef void(^clickBanner)(NSInteger tag);
@property (nonatomic,copy) clickBanner clickbanner;

@property (nonatomic,strong) UIScrollView *scrollView;//benner
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,assign) NSInteger totalNum;
@property (nonatomic,strong) UIScrollView *activityScrollView;//活动
- (void)setArray:(NSArray *)imgArray;


- (void)openTimer;
- (void)closeTimer;

@end

NS_ASSUME_NONNULL_END
