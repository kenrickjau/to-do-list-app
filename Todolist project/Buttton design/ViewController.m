//
//  ViewController.m
//  LHShareView
//
//  Created by tgs on 16/11/17.
//  Copyright © 2016年 tgs. All rights reserved.
//

#import "ViewController.h"
#import "ShareView.h"

@interface ViewController ()

@property (nonatomic, strong) ShareView *shareV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareBtn:(id)sender {
    __weak __typeof(&*self)weakSelf = self;
    _shareV = [[ShareView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _shareV.shareHeight = 150;
    _shareV.cancelHeight = 50;
    _shareV.cancelTitleColor = [UIColor orangeColor];
    _shareV.viewBackgroundColor = [UIColor purpleColor];
    _shareV.removeShareBlock = ^(BOOL flag){
        if (flag) {
            [weakSelf.shareV removeFromSuperview];
        }
    };
    [self.view addSubview:_shareV];
}
@end
