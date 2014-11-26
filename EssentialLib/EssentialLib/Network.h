//
//  Network.h
//  EssentialLib
//
//  Created by Gau Uni on 11/25/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Network : NSObject

//------------------------------------------------------------------------------------------
/** Check network is available  */
+(BOOL) checkNetwork;

@end
