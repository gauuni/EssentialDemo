//
//  NavSlideAlertView.m
//  TurnBaseHydra
//
//  Created by Gau Uni on 11/4/14.
//  Copyright (c) 2014 Thien Thanh. All rights reserved.
//

#import "NavSlideAlertView.h"



// TODO: Rebuild this class
@interface NavSlideAlertView ()
{

}

@property (nonatomic, strong)    UILabel *labelMessage;
@property (nonatomic, strong)    UIButton *btnDismiss;
@end

@implementation NavSlideAlertView

//-----------------------------------------------------------------------------------------
/**   */
+ (NavSlideAlertView *)shared
{
static dispatch_once_t once = 0;
static NavSlideAlertView *navSlideAlertView;

    dispatch_once(&once, ^{ navSlideAlertView = [[NavSlideAlertView alloc] init]; });

    return navSlideAlertView;
}

//------------------------------------------------------------------------------------------
/**   */
+(CGFloat)heightOfAlertView
{
    return CGRectGetHeight([self shared].frame);
}

//------------------------------------------------------------------------------------------
/**   */
-(NavSlideAlertView *)init
{
    self = [super init];

    [self destroyView];
    return self;
}



//------------------------------------------------------------------------------------------
/**   */
-(void)setUpAlertViewWithMessage: (NSString *)alertMessage OnView: (UIView *)view AtPosition:(CGFloat)postion
{


    if (_alertColor) {
        self.backgroundColor = _alertColor;
    }
    if (_isErrorMessage) {

    }
    
    CGSize alertMessageSize = CGSizeMake(CGRectGetWidth(view.frame) - 20, CGFLOAT_MAX);
    UIFont *alertFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
    NSDictionary *alertMessageAttribute = @{NSFontAttributeName: alertFont};
    CGRect alertMessageFrame = [alertMessage boundingRectWithSize:alertMessageSize
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:alertMessageAttribute
                                                          context:nil];

    self.frame = CGRectMake(0, -CGRectGetHeight(alertMessageFrame)-10, CGRectGetWidth(view.frame), CGRectGetHeight(alertMessageFrame) + 30);
    self.frame = CGRectMake(0, postion, CGRectGetWidth(view.frame), CGRectGetHeight(alertMessageFrame) + 30);
    
    CGRect labelRect = CGRectMake(10, 10 , CGRectGetWidth(self.frame) - 20, CGRectGetHeight(alertMessageFrame)+10);

    if (_labelMessage == nil) {
            _labelMessage = [[UILabel alloc] init];
    }
    _labelMessage.frame = labelRect;
    _labelMessage.numberOfLines = 0;
    _labelMessage.textColor = [UIColor whiteColor];
    _labelMessage.text = alertMessage;
    _labelMessage.lineBreakMode = NSLineBreakByWordWrapping;
    
    if (_labelMessage.superview == nil) {
            [self addSubview:_labelMessage];
    }

    
    [view addSubview:self];

}

//------------------------------------------------------------------------------------------
/**   */
+(void)showAtPosition: (CGPoint)postion WithMessage: (NSString *)alertMessage OnView: (UIView *)view completion: (completionBlock)completion
{
    [[self  shared] setUpAlertViewWithMessage:alertMessage OnView:view AtPosition:postion.y];

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
//        [self  shared].frame = CGRectMake(postion.x, postion.y, CGRectGetWidth([self  shared].frame), CGRectGetHeight([self  shared].frame));
        [self shared].alpha = 1;
    } completion:^(BOOL finished) {
        if (completion) {
            completion([self heightOfAlertView]);
        }
    }];
}

//------------------------------------------------------------------------------------------
/**   */
+(void)showAtTopWithMessage: (NSString *)alertMessage OnView: (UIView *)view completion: (completionBlock)completion
{
    [[self  shared] setUpAlertViewWithMessage:alertMessage OnView:view AtPosition:64];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
//        [self  shared].frame = CGRectMake(0, 64, CGRectGetWidth([self  shared].frame), CGRectGetHeight([self  shared].frame));
        [self shared].alpha = 1;
    } completion:^(BOOL finished) {
        if (completion) {
            completion([self heightOfAlertView]);
        }
    }];

}

//------------------------------------------------------------------------------------------
/**   */
-(void)destroyView
{
        self.alpha = 0;
    _alertColor = nil;
    [_labelMessage removeFromSuperview];
    _labelMessage = nil;
    _btnDismiss = nil;
    _isErrorMessage = NO;
}

//------------------------------------------------------------------------------------------
/**   */
+(void)dismissAlertViewWithCompletion: (completionBlock)completion
{
    [UIView animateWithDuration:0.3 animations:^{
//        [self  shared].frame = CGRectMake(0, -CGRectGetHeight([self  shared].frame), CGRectGetWidth([self  shared].frame), CGRectGetHeight([self shared].frame));
        [self shared].alpha = 0;
    } completion:^(BOOL finished) {
        if (completion) {
            completion([self heightOfAlertView]);
        }
    }];
    [[self shared] destroyView];
}

@end
