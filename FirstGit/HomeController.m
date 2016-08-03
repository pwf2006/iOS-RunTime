//
//  HomeController.m
//  FirstGit
//
//  Created by pengweifeng on 8/3/16.
//  Copyright © 2016 pengweifeng. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@property (nonatomic, strong) UILabel *msgLbl;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.msgLbl = [[UILabel alloc] init];
    self.msgLbl.font = [UIFont systemFontOfSize:14];
    self.msgLbl.textColor = [UIColor blackColor];
    self.msgLbl.text = @"主界面";
    self.msgLbl.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.msgLbl];
    
//    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.msgLbl.frame = CGRectMake(20, 40, 60, 20);
}
@end
