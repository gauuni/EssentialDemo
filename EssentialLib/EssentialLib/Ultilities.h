//
//  Ultilities.h
//  EssentialLib
//
//  Created by Gau Uni on 11/26/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ultilities : NSObject


//  Check iOS version
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//------------------------------------------------------------------------------------------
/** Skip back up attribute of item  */
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSString *) filePath;

@end
