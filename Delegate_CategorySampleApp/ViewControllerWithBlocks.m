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
UIView *viewBlocks;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    customAlertViewBlocks = [[CustomAlertView alloc]init];
    [customAlertViewBlocks designAlertView :@"Alert is Using Blocks!" :@"cancel" :@"OK"];
    viewBlocks = [customAlertViewBlocks getAlertViewObject];
    [customAlertViewBlocks button1ActionUsingBlock:^{
        [viewBlocks removeFromSuperview];
    }];
    [customAlertViewBlocks button2ActionUsingBlock:^{
        NSLog(@"Button 2 Pressed");
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAME object:nil];
    }];
    [self.view addSubview:viewBlocks];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
