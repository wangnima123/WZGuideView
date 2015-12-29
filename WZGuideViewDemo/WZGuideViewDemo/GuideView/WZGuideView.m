//
//  WZGuideView.m
//  WZGuidingPageView
//
//  Created by chenstone on 15/12/28.
//  Copyright © 2015年 chenstone. All rights reserved.
//

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height


#import "WZGuideView.h"

@class WZGuideView;

@interface WZGuideView()<UIScrollViewDelegate>{
    UIPageControl *_pageControl;
}

@property (nonatomic, copy)NSArray *imgArray;

@end

@implementation WZGuideView


#pragma mark - setter and getter -

-(NSArray *)imgArray{
    if(!_imgArray){
        NSMutableArray *mutableImgArr = [[NSMutableArray alloc] init];
        for(int i = 0; i < 4; i++){
            [mutableImgArr addObject:[NSString stringWithFormat:@"guidingImg_%d", i]];
            _imgArray = mutableImgArr;
        }
    }
    return _imgArray;
}

+ (instancetype)showInView:(UIView *)view{
    WZGuideView *guidingView = [[WZGuideView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    if(guidingView){
        [guidingView setupUI];
        [view addSubview:guidingView];
    }
    return guidingView;
}

//建立引导页视图
- (void)setupUI{
    [self setupScrollView];
    [self setupPageControl];
}

#pragma mark - loadingPage -

//分页计数器
-(void)setupPageControl{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREENW - 180)/2, SCREENH - 80, 180, 20)];
    [self addSubview:pageControl];
    pageControl.numberOfPages = 4;
    _pageControl = pageControl;
}

//滑动页
-(void)setupScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(SCREENW * 4, SCREENH);
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.delegate = self;
    [self addSubview:scrollView];
    [self addSubPages:scrollView];
}

//添加启动图
-(void)addSubPages:(UIScrollView *)scrollView{
    for(int i = 0; i < 4; i++){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENW*i, 0, SCREENW, SCREENH)];
        [imgView setImage:[UIImage imageNamed:[self.imgArray objectAtIndex:i]]];
        NSLog(@"==============%@", [self.imgArray objectAtIndex:i]);
        [scrollView addSubview:imgView];
        if(i == 3){
            [self setupTapGestrue:imgView];
            
        }
    }
}

//制作进入按钮
-(void)setupTapGestrue:(UIImageView *)imgView{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterGesturePress)];
    [imgView setUserInteractionEnabled:YES];
    [imgView addGestureRecognizer:tapGesture];
}

//UIView从画布上消失
-(void)enterGesturePress{
    [self removeFromSuperview];
    NSLog(@"引导页消失了");
}

#pragma mark - ScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"=============########%f", scrollView.contentOffset.x);
    NSLog(@"%f", SCREENW);
    _pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x/SCREENW);
}

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
