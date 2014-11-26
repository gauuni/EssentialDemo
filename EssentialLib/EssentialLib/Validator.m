//
//  Validator.m
//  EssentialLib
//
//  Created by Gau Uni on 11/26/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import "Validator.h"

@implementation Validator

//------------------------------------------------------------------------------------------
/** Check email is valid  */
+(BOOL) validateEmail:(NSString *)originalString
{
    NSString *regexString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [regex evaluateWithObject:originalString];
}

//------------------------------------------------------------------------------------------
/**  Check character has been inserted is a number or not */
+(BOOL)isNumeric: (NSString *)s
{
    NSUInteger len = [s length];
    NSUInteger i;
    BOOL status = NO;
    
    for(i=0; i < len; i++)
    {
        unichar singlechar = [s characterAtIndex: i];
        if ( (singlechar == ' ') && (!status) )
        {
            continue;
        }
        if ( ( singlechar == '+' ||
              singlechar == '-' ) && (!status) ) { status=YES; continue; }
        if ( ( singlechar >= '0' ) &&
            ( singlechar <= '9' ) )
        {
            status = YES;
        } else {
            return NO;
        }
    }
    return (i == len) && status;
}
@end
