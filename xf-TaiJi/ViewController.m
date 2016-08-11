//
//  ViewController.m
//  xf-TaiJi
//
//  Created by 朱晓峰 on 16/8/10.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "ViewController.h"
#import "XFTaiJi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor lightGrayColor];
    XFTaiJi *taiji=[[XFTaiJi alloc]initWithFrame:CGRectMake(50.0f, 80.0f, 230.f, 320.f)];
    [self.view addSubview:taiji];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
