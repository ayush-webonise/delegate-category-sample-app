//
//  CustomAlertView.h
//  Delegate_CategorySampleApp
//
//  Created by webonise on 21/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomAlertViewDelegate <NSObject>
-(void) onButton1Pressed;
-(void) onButton2Pressed;
@end

@interface CustomAlertView : UIView
@property(nonatomic) id <CustomAlertViewDelegate> delegateProperty;
//-(void) designAlertView :(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2;
@property(strong, nonatomic) NSString* labelAlertViewMessage;
@property(strong, nonatomic) NSString* buttonOneText;
@property(strong, nonatomic) NSString* buttonTwoText;
-(void) designAlertView;
//-(UIView*) getAlertViewObject;
-(UIColor*) changeAlertViewBackgroundColor;
//-(void) button1ActionUsingBlock: (void(^)(void))button1BlockMethod;
//-(void) button2ActionUsingBlock: (void(^)(void))button2BlockMethod;
- (UIView*)initWithDelegate:(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2 :(CustomAlertView*)delegate;
- (UIView*)initWithBlocks:(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2 : (void(^)(void))button1BlockMethod :(void(^)(void))button2BlockMethod;
@end
