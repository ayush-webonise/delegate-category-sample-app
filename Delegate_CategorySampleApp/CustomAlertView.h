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
@property(strong, nonatomic) id <CustomAlertViewDelegate> delegate;
-(void) designAlertView :(NSString*)labelButtonMessage :(NSString*)titleButton1 :(NSString*)titleButton2;
-(UIView*) getAlertViewObject;
-(UIColor*) changeAlertViewBackgroundColor;
@end
