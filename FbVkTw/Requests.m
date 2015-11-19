//
//  Requests.m
//  FbVkTw
//
//  Created by Mykola Sobko on 19.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "Requests.h"
#import "Constants.h"

@implementation Requests

+ (NSMutableURLRequest *) VKloginRequest{
    _request = [[NSMutableURLRequest alloc] init];
    
    NSString *lauthString = [NSString stringWithFormat:@"https://oauth.vk.com/authorize?client_id=%@&scope=%@&redirect_uri=%@&display=%@&v=%@&response_type=token", VK_APP_ID,VK_SCOPES,VK_REDIRECT_URI,VK_DISPLAY,VK_API_VERSION];
    _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:lauthString]];
    
    return _request;
}
@end
