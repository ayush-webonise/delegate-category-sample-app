//
//  CustomAlertView.m
//  Delegate_CategorySampleApp
//
//  Created by webonise on 21/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "CustomAlertView.h"
#import "colorCategory.h"
typedef void (^ButtonBlockMethod)(void);

UIView *view;

@implementation CustomAlertView
@synthesize delegateProperty, labelAlertViewMessage, buttonOneText, buttonTwoText;

ButtonBlockMethod BlockMethodOne;
ButtonBlockMethod BlockMethodTwo;

/** this is initializer method for delegates
 \params Params labelButtonMessage, titleButton1, titleButton2 for displaying alert message and two button titles and a delegate
 \returns Returns self of UIView Type
 */
- (UIView*)initWithDelegate:(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2 :(CustomAlertView*)delegate{
    self = [super init];
    self.labelAlertViewMessage = labelButtonMessage;
    self.delegateProperty = (id)delegate;
    self.buttonOneText = titleButton1;
    self.buttonTwoText = titleButton2;
    [self designAlertView];
    return self;
}

/** this is initializer method for Blocks
 \params Params labelButtonMessage, titleButton1, titleButton2 for displaying alert message and two button titles and two blocks
 \returns Returns self of UIView Type
 */
- (UIView*)initWithBlocks:(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2 : (void(^)(void))button1BlockMethod :(void(^)(void))button2BlockMethod{
    self = [super init];
    self.labelAlertViewMessage = labelButtonMessage;
    self.buttonOneText = titleButton1;
    self.buttonTwoText = titleButton2;
    BlockMethodOne = button1BlockMethod;
    BlockMethodTwo = button2BlockMethod;
    [self designAlertView];
    return self;
}

/** This method designs a custom alert view using UIView
 \params Params labelButtonMessage, titleButton1, titleButton2 for displaying alert message and two button titles
 \returns Returns Nothing
 */
-(void) designAlertView{
   [self setFrame:CGRectMake(30, 70, 300, 200)];
    self.backgroundColor = [self changeAlertViewBackgroundColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 180, 60)];
    [label setText:labelAlertViewMessage];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(70, 100, 90, 60);
    [button1 setTitle:buttonOneText forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(firstButtonpressed) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(190, 100, 90, 60);
    [button2 setTitle:buttonTwoText forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(secondButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:label];
    [self addSubview:button1];
    [self addSubview:button2];
//    view = customAlertView;
}


/** This method chooses whether to call button action using Delegate or Block
 \params Params None
 \returns Returns Nothing
 */
-(void) firstButtonpressed{
    
    if([delegateProperty conformsToProtocol:@protocol(CustomAlertViewDelegate)])
    [delegateProperty onButton1Pressed];
    else
        BlockMethodOne();
}

/** This method chooses whether to call button action using Delegate or Block
 \params Params None
 \returns Returns Nothing
 */
-(void) secondButtonPressed{
    if([delegateProperty conformsToProtocol:@protocol(CustomAlertViewDelegate)])
       [delegateProperty onButton2Pressed];
    else
        BlockMethodTwo();
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
