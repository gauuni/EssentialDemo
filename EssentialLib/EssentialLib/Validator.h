//
//  Validator.h
//  EssentialLib
//
//  Created by Gau Uni on 11/26/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

//------------------------------------------------------------------------------------------
/** Check email is valid  */
+(BOOL) validateEmail:(NSString *)originalString;

//------------------------------------------------------------------------------------------
/**  Check character has been inserted is a number or not */
+(BOOL)isNumeric: (NSString *)s;

@end
