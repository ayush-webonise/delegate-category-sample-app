//
//  CustomAlertView.m
//  Delegate_CategorySampleApp
//
//  Created by webonise on 21/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "CustomAlertView.h"
#import "colorCategory.h"

UIView *view;

@implementation CustomAlertView
@synthesize delegate;

void (^button1BlockMethod)(void);
void(^button2BlockMethod)(void);

/** This method designs a custom alert view using UIView
 \params Params labelButtonMessage, titleButton1, titleButton2 for displaying alert message and two button titles
 \returns Returns Nothing
 */
-(void) designAlertView :(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2{
    UIView *customAlertView = [[UIView alloc]initWithFrame:CGRectMake(30, 70, 300, 200)];
    customAlertView.backgroundColor = [self changeAlertViewBackgroundColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 180, 60)];
    [label setText:labelButtonMessage];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(70, 100, 90, 60);
    [button1 setTitle:titleButton1 forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(firstButtonpressed) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(190, 100, 90, 60);
    [button2 setTitle:titleButton2 forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(secondButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [customAlertView addSubview:label];
    [customAlertView addSubview:button1];
    [customAlertView addSubview:button2];
    view = customAlertView;
}

/** This method returns the custom alert View object of type UIView
 \params Params None
 \returns Returns view of type UIView
 */
-(UIView*) getAlertViewObject{
    return view;
}

/** This method chooses whether to call button action using Delegate or Block
 \params Params None
 \returns Returns Nothing
 */
-(void) firstButtonpressed{
    if([delegate conformsToProtocol:@protocol(CustomAlertViewDelegate)])
    [delegate onButton1Pressed];
    else
        button1BlockMethod();
}

/** This method chooses whether to call button action using Delegate or Block
 \params Params None
 \returns Returns Nothing
 */
-(void) secondButtonPressed{
    if([delegate conformsToProtocol:@protocol(CustomAlertViewDelegate)])
       [delegate onButton2Pressed];
    else
        button2BlockMethod();
}

/** This method action on pressing button 1 in custom alert view
 \params Params commonBlockMethod1 Block
 \returns Returns Nothing
 */
-(void) button1ActionUsingBlock: (void(^)(void))commonBlockMethod1{
    NSLog(@"Blocks are used here");
    button1BlockMethod = commonBlockMethod1;
}

/** This method performs action on pressing button 2 in custom alert view
 \params Params commonBlockMethod2 Block
 \returns Returns Nothing
 */
-(void) button2ActionUsingBlock: (void(^)(void))commonBlockMethod2{
    NSLog(@"Button 2 is using Blocks");
    button2BlockMethod = commonBlockMethod2;
}

/** This method changes background color of the custom alert view
 \params Params None
 \returns Returns bgColor
 */
-(UIColor*) changeAlertViewBackgroundColor{
   UIColor *bgColor = [UIColor colorFromHexString:@"ff0033"];
    return  bgColor;
}

@end
