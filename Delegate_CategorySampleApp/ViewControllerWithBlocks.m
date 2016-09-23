//
//  ViewControllerWithBlocks.m
//  Delegate_CategorySampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "ViewControllerWithBlocks.h"

@interface ViewControllerWithBlocks ()

@end

@implementation ViewControllerWithBlocks

CustomAlertView *customAlertViewBlocks;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    customAlertViewBlocks = [[CustomAlertView alloc]initWithBlocks:@"Blocks are Used Here" :@"Cancel" :@"Ok" :^{[customAlertViewBlocks removeFromSuperview];} :^{NSLog(@"Button 2 Pressed");
                            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAME object:nil];}];
    [self.view addSubview:customAlertViewBlocks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
