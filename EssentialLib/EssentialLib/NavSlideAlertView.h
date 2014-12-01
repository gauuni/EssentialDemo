//
//  NavSlideAlertView.h
//  TurnBaseHydra
//
//  Created by Gau Uni on 11/4/14.
//  Copyright (c) 2014 Thien Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavSlideAlertView : UIView

 @property (nonatomic, strong) UIColor *alertColor;
@property (nonatomic, strong) UIColor *alertTextColor;
@property (nonatomic, strong) UIFont *alertTextFont;

@property (nonatomic, assign) BOOL isErrorMessage;
@property (nonatomic, assign) BOOL autoDismiss;

typedef void (^completionBlock)(CGFloat alertHeight);

- (NavSlideAlertView *)initWithMessage: (NSString *)alertMessage OnView: (UIView *)view;
- (NavSlideAlertView *)initWithMessage: (NSString *)alertMessage;

+ (NavSlideAlertView *)shared;
+(CGFloat)heightOfAlertView;
+(void)showAtTopWithMessage: (NSString *)alertMessage OnView: (UIView *)view completion: (completionBlock)completion;
+(void)showAtPosition: (CGPoint)postion WithMessage: (NSString *)alertMessage OnView: (UIView *)view completion: (completionBlock)completion;
+(void)dismissAlertViewWithCompletion: (completionBlock)completion;

@end
