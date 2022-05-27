//
//  ShareView.h
//  test
//
//  Created by tgs on 16/11/17.
//  Copyright © 2016年 tgs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^removeShareView)(BOOL flag);

@interface ShareView : UIView

@property (nonatomic, copy) removeShareView removeShareBlock;

/**
 *  分享视图的高度
 */
@property (nonatomic, assign) NSInteger shareHeight;

/**
 *  取消按钮的高度
 */
@property (nonatomic, assign) NSInteger cancelHeight;

/**
 *  取消按钮的颜色
 */

@property (nonatomic, strong) UIColor *cancelTitleColor;

/**
 *  背景颜色
 */
@property (nonatomic, assign) UIColor *viewBackgroundColor;



@end
