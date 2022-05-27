//
//  ShareView.m
//  test
//
//  Created by tgs on 16/11/17.
//  Copyright © 2016年 tgs. All rights reserved.
//

#import "ShareView.h"

@interface ShareView()
@property (nonatomic, strong) UIView *viewBackGround;
@property (nonatomic, strong) UIView *viewContent;
@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cancelHeight = 50;
        self.shareHeight = 150;
        self.cancelTitleColor = [UIColor blueColor];
        self.viewBackgroundColor = [UIColor lightGrayColor];
        
        [self stepUI];
    }
    return self;
}

- (void)stepUI{
    _viewBackGround = [[UIView alloc] init];
    [_viewBackGround addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removerShareView:)]];
    _viewBackGround.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _viewBackGround.alpha = 0.0;
    _viewBackGround.backgroundColor = _viewBackgroundColor;
    [self addSubview:_viewBackGround];
    
    
    _viewContent = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.shareHeight)];
    _viewContent.backgroundColor = [UIColor whiteColor];
    [_viewContent.layer setMasksToBounds:YES];
    [_viewContent.layer setBorderColor:[UIColor grayColor].CGColor];
    [_viewContent.layer setBorderWidth:1/[[UIScreen mainScreen] scale]];
    [self addSubview:_viewContent];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake(0, self.shareHeight - self.cancelHeight, _viewContent.bounds.size.width, self.cancelHeight);
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_cancelBtn.layer setMasksToBounds:YES];
    [_cancelBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_cancelBtn.layer setBorderWidth:1/[[UIScreen mainScreen] scale]];
    [_viewContent addSubview:_cancelBtn];
    [_cancelBtn addTarget:self action:@selector(removeShareViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:0.3 animations:^{
        _viewBackGround.alpha = 0.5;
        _viewContent.frame = CGRectMake(0, self.bounds.size.height-self.shareHeight, self.bounds.size.width, self.shareHeight);
       
    }];
}

- (void)removerShareView:(UITapGestureRecognizer *)tap {
    [UIView animateWithDuration:0.3 animations:^{
        _viewBackGround.alpha = 0;
        _viewContent.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.shareHeight);
    } completion:^(BOOL finished) {
        if (self.removeShareBlock) {
            self.removeShareBlock(YES);
        }
    }];
    
}

- (void)removeShareViewBtn:(id)sender{
    [UIView animateWithDuration:0.3 animations:^{
        _viewBackGround.alpha = 0;
        _viewContent.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.shareHeight);
    } completion:^(BOOL finished) {
        if (self.removeShareBlock) {
            self.removeShareBlock(YES);
        }
    }];
}

#pragma mark - set
- (void)setShareHeight:(NSInteger)shareHeight {
    [UIView animateWithDuration:0.3 animations:^{
    _viewContent.frame = CGRectMake(0, self.bounds.size.height-shareHeight, self.bounds.size.width, shareHeight);
    }];
    _cancelBtn.frame = CGRectMake(0, shareHeight - self.cancelHeight, _viewContent.bounds.size.width, self.cancelHeight);
    _shareHeight = shareHeight;
}

- (void)setCancelHeight:(NSInteger)cancelHeight {
   _cancelBtn.frame = CGRectMake(0, self.shareHeight - cancelHeight, _viewContent.bounds.size.width, cancelHeight);
    _cancelHeight = cancelHeight;
}

- (void)setCancelTitleColor:(UIColor *)cancelTitleColor {
    [_cancelBtn setTitleColor:cancelTitleColor forState:UIControlStateNormal];
    _cancelTitleColor = cancelTitleColor;
}

- (void)setViewBackgroundColor:(UIColor *)viewBackgroundColor {
    _viewBackGround.backgroundColor = viewBackgroundColor;
    _viewBackgroundColor = viewBackgroundColor;
}

@end
