//
//  Requests.m
//  FbVkTw
//
//  Created by Mykola Sobko on 19.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "Requests.h"
#import "Constants.h"
#import <AFNetworking.h>

@implementation Requests

#pragma mark - Vk requests

+ (NSMutableURLRequest *) VKloginRequest {
    VKLoginURLRequest = [[NSMutableURLRequest alloc] init];
    
    NSString *loginString = [NSString stringWithFormat:@"https://oauth.vk.com/authorize?client_id=%@&scope=%@&redirect_uri=%@&display=%@&v=%@&response_type=token", VK_APP_ID,VK_SCOPES,VK_REDIRECT_URI,VK_DISPLAY,VK_API_VERSION];
    VKLoginURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:loginString]];
    
    return VKLoginURLRequest;
}

+ (NSMutableURLRequest *) TWloginRequest {
    TWLoginURLRequest = [[NSMutableURLRequest alloc] init];
    
    NSString *loginString = [NSString stringWithFormat:@"https://api.twitter.com/oauth/request_token"];
    TWLoginURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:loginString]];
    
    
    return TWLoginURLRequest;
}


@end
