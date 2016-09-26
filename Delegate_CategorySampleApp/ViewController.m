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
- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyOtherController) name:NOTIFICATION_NAME object:nil];
}

/** This method calls removeView method when button 1 on custom alert view is pressed
 \params Params None
 \returns Returns Nothing
 */
-(void) onButton1Pressed{
    NSLog(@"button 1 is pressed");
    [self removeView];
}

/** This method dismisses alert view
 \params Params None
 \returns Returns Nothing
 */
- (void)removeView {
    // remove it
    [customAlertView removeFromSuperview];
}

/** This method performs action when button 2 on custom alert view is pressed
 \params Params None
 \returns Returns Nothing
 */
-(void) onButton2Pressed{
    NSLog(@"button 2  is pressed");
    [self removeView];
}

/** This method naviagtes to second screen when "Blocks Work Here" button is pressed
 \params Params None
 \returns Returns Nothing
 */
- (IBAction)buttonPressedForBlocks:(id)sender {
    ViewControllerWithBlocks *viewControllerWithBlocks = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerWithBlocks"];
    [self.navigationController pushViewController:viewControllerWithBlocks animated:YES];
}

/** This method notifies other viewControllers  
 \params Params None
 \returns Returns Nothing
 */
-(void)notifyOtherController
{
    NSLog(@"Notification Received in Delegate View Controller");
}

/** This method pops up alert view when "Show Alert" button is pressed
 \params Params None
 \returns Returns Nothing
 */
- (IBAction)buttonPressedForAlertView:(id)sender {
    customAlertView = [[CustomAlertView alloc]initWithDelegate:self :@"Do you want delete?" :@"Cancel" :@"OK" ];
    [self.view addSubview:customAlertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
