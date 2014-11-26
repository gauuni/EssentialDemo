//
//  Network.m
//  EssentialLib
//
//  Created by Gau Uni on 11/25/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import "Network.h"

@implementation Network


//------------------------------------------------------------------------------------------
/**   */
+(BOOL) checkNetwork
{
    Reachability *r = [Reachability reachabilityForInternetConnection];
    NetworkStatus intenetStatus = [r currentReachabilityStatus];
    
    if ((intenetStatus != ReachableViaWiFi) && (intenetStatus != ReachableViaWWAN))
    {
        return NO;
    }
    return YES;
}


//------------------------------------------------------------------------------------------
/**   */

@end
