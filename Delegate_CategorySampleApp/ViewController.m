//
//  ViewController.m
//  Delegate_CategorySampleApp
//
//  Created by webonise on 21/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
CustomAlertView *customAlertView;
UIView *view1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    customAlertView = [[CustomAlertView alloc]init];
    customAlertView.delegate = self;
    [customAlertView designAlertView :@"Hey There" :@"cancel" :@"OK"];
    view1 = [customAlertView getAlertViewObject];
    [self.view addSubview:view1];
}

-(void) onButton1Pressed{
    NSLog(@"button 1 is pressed");
    [self removeView];
}

- (void)removeView {
    // remove it
    [view1 removeFromSuperview];
}

-(void) onButton2Pressed{
    NSLog(@"button 2  is pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
