//
//  DirectoryManager.m
//  EssentialLib
//
//  Created by Gau Uni on 11/25/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

#pragma mark -
#pragma mark Path
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/**   */
+(NSString *) getDocumentsDirectory
{
NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentDir = [searchPaths lastObject];
    
    return documentDir;
}


//------------------------------------------------------------------------------------------
/**   */
+ (NSString *) getBundlePath
{
    return [[NSBundle mainBundle] resourcePath];
}


//------------------------------------------------------------------------------------------
/**   */
+(NSString *)getCacheDirectory
{
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *ret  = [paths objectAtIndex:0];
    
    return  ret;
}

/*************************************************************************************************************************/


#pragma mark -
#pragma mark Check
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/** Check file is existed  */
+(BOOL) checkFileIsExisted:(NSString *) dataPath
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        return YES;
    
    return NO;
}


//------------------------------------------------------------------------------------------
/** Check folder is existed  */
+(BOOL) checkFolderIsExisted:(NSString *) dataPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = YES;
    
    if ([fileManager fileExistsAtPath:dataPath isDirectory:&isDirectory])
        return YES;
    
    return NO;
}
/*************************************************************************************************************************/



#pragma mark -
#pragma mark Copy
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/** Copy file from folder to another folder  */
+ (void) copyFilesInFolderPath:(NSString *) sourceDirectory toFolderPath:(NSString *) targetDirectory
{
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *list_Files = [fileManager contentsOfDirectoryAtPath:sourceDirectory error:&error];
    
    NSString *fromPath;
    NSString *toPath;
    
    for (NSString *fileName in list_Files)
    {
        fromPath = [sourceDirectory stringByAppendingPathComponent:fileName];
        toPath = [targetDirectory stringByAppendingPathComponent:fileName];
        
        [self deleteFileAtPath:toPath];
        
        [fileManager copyItemAtPath:fromPath toPath:toPath error:&error];
    }
    
    fileManager = nil;
}

//------------------------------------------------------------------------------------------
/** Copy file from path to another path  */
+(void) copyFileFromPath:(NSString *) fromPath toPath:(NSString *)toPath
{
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //    NSLog(@"fromPath = %@", fromPath);
    //    NSLog(@"toPath = %@", toPath);
    
    if([fileManager copyItemAtPath:fromPath toPath:toPath error:&error] == NO)
    {
        NSLog(@"error = %@", error);
    };
    
    fileManager = nil;
}

/*************************************************************************************************************************/

#pragma mark -
#pragma mark Make
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/** Make folder at specific path   */
// make folder
+( void) makeFolderAtPath:(NSString *) pathToFolder
{
    NSError *error = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:pathToFolder])
    {
        // Create folder
        [fileManager createDirectoryAtPath:pathToFolder withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    fileManager = nil;
}

/*************************************************************************************************************************/



#pragma mark -
#pragma mark Move
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/** Move file from path to another path  */
+(void) moveFileFromPath:(NSString *) fromPath toPath:(NSString *)toPath
{
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //    NSLog(@"fromPath = %@", fromPath);
    //    NSLog(@"toPath = %@", toPath);
    
    if([fileManager copyItemAtPath:fromPath toPath:toPath error:&error] == NO)
    {
        NSLog(@"error = %@", error);
    };
    
    [fileManager removeItemAtPath:fromPath error:NULL];
    
    fileManager = nil;
}

/*************************************************************************************************************************/


#pragma mark -
#pragma mark Delete
/*************************************************************************************************************************/
//------------------------------------------------------------------------------------------
/** Delete file at specific path  */
+(void)deleteFileAtPath:(NSString *)pathToFile
{
    NSError *error = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager removeItemAtPath:pathToFile error:&error];
    
    fileManager = nil;
}



//------------------------------------------------------------------------------------------
/** Delete all files in a folder  */
+(void)deleteAllFilesInFolder:(NSString *)directory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    NSArray *list_Files = [fileManager contentsOfDirectoryAtPath:directory error:&error];
    
    for (NSString *file in list_Files)
    {
        NSString *pathToFile = [directory stringByAppendingPathComponent:file];
        BOOL success = [fileManager removeItemAtPath:pathToFile error:&error];
        if (!success || error) {
            // it failed.
        }
    }
    
    fileManager = nil;
}

/*************************************************************************************************************************/

@end
