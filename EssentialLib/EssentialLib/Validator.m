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
    if ([s rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
    {
        // BasicAlert(@"", @"This field accepts only numeric entries.");
        return NO;
    }
    return YES;
}
@end
