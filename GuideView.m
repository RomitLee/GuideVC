
//
//  GuideView.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-1.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "GuideView.h"
#import "CityModel.h"
#import "DepartmentListModel.h"

/**
 *  引导页张数
 */
#define DEF_GUIDE_COUNT 3
@interface GuideView()
@property (nonatomic,strong) CityModel *cityModel;
@property (nonatomic,strong) DepartmentListModel *departmentListModel;
@end
@implementation GuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    CityModel *model=[CityModel new];
    self.cityModel=model;
    [self.cityModel getCityList];
    
    DepartmentListModel *departmentListModel=[DepartmentListModel new];
    self.departmentListModel=departmentListModel;
    [self.departmentListModel getDepartmentList];
    
    if (self) 
    {
        self.contentSize = CGSizeMake(DEF_WIDTH(self)*DEF_GUIDE_COUNT, DEF_HEIGHT(self));
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
//        self.backgroundColor = [UIColor clearColor];

        for (int i=0; i<DEF_GUIDE_COUNT; i++) 
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEF_WIDTH(self)*i, 0, DEF_WIDTH(self), DEF_HEIGHT(self))];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"general_guidview%d_view",i]];
            [self addSubview:imageView];
            
            if (i == DEF_GUIDE_COUNT-1) 
            {
//                // 开始按钮，一般放在最后一张引导页上，frame大小自己根据需要进行调整
//                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////            [button circlecorner]//加圆角
//                //在这里判断是几寸的屏幕，对应屏幕，设置这个按钮的位置
//                CGRect rect = [[UIScreen mainScreen] bounds];
//                CGSize size = rect.size;
//                CGFloat height = size.height;//拿到屏幕高度
//                if (height == 480)
//                {
//                    //4/4s
//                    [button setFrame:CGRectMake((DEF_WIDTH(self) - DEF_WIDTH(self)/2)/2 + 20 , DEF_HEIGHT(self)-120, DEF_WIDTH(self)/2-40, 40)];
//                }
//                else if (height == 568)
//                {
//                //5/5s
//                    [button setFrame:CGRectMake((DEF_WIDTH(self) - DEF_WIDTH(self)/2)/2 + 20 , DEF_HEIGHT(self)-140, DEF_WIDTH(self)/2-40, 40)];
//
//                }
//                else if (height == 667)
//                {
//                //6
//                [button setFrame:CGRectMake((DEF_WIDTH(self) - DEF_WIDTH(self)/2)/2 + 20 , DEF_HEIGHT(self)-160, DEF_WIDTH(self)/2-40, 40)];
//                }
//                else if (height ==736)
//                {
//                    //6+
//                    [button setFrame:CGRectMake((DEF_WIDTH(self) - DEF_WIDTH(self)/2)/2 + 20 , DEF_HEIGHT(self)-180, DEF_WIDTH(self)/2-40, 40)];
//                }
//                [button setBackgroundColor:UICOLOR(243, 243, 243, 1.0)];
//                [button setTitle:@"立即体验" forState:UIControlStateNormal];
//                [button addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
//                [imageView addSubview:button];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToDismissView:)];
                [imageView addGestureRecognizer:tap];
            }
        }
    }
    return self;
}

#pragma mark - 点击事件
- (void)tapToDismissView:(UITapGestureRecognizer *)gesture
{
    if (self.callBack) {
        
        self.callBack();
    }
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


  
@end
