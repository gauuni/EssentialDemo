//
//  Ultilities.m
//  EssentialLib
//
//  Created by Gau Uni on 11/26/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import "Ultilities.h"

@implementation Ultilities

//------------------------------------------------------------------------------------------
/** Skip back up attribute of item  */
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSString *) filePath
{
    assert([[NSFileManager defaultManager] fileExistsAtPath:filePath]);
    
    NSError *error = nil;
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    BOOL success = [url setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [filePath lastPathComponent], error);
    }
    
    return success;
}
@end
