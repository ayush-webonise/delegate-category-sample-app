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
-(void) designAlertView :(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2{
    UIView *customAlertView = [[UIView alloc]initWithFrame:CGRectMake(50, 70, 300, 200)];
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


-(UIView*) getAlertViewObject{
    return view;
}

-(void) firstButtonpressed{
    [delegate onButton1Pressed];
}

-(void) secondButtonPressed{
    [delegate onButton2Pressed];
}

-(UIColor*) changeAlertViewBackgroundColor{
   UIColor *bgColor = [UIColor colorFromHexString:@"ff0033"];
    return  bgColor;
}


@end
