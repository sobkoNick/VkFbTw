//
//  Requests.h
//  FbVkTw
//
//  Created by Mykola Sobko on 19.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSMutableURLRequest* VKLoginURLRequest;

@interface Requests : NSObject
+ (NSMutableURLRequest *) VKloginRequest;

@end
