//
//  colorCategory.h
//  Delegate_CategorySampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface colorCategory : UIColor
@end

@interface UIColor(changeBgColor)
+(UIColor *) colorFromHexString:(NSString *)hexString;
@end