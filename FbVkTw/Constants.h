//
//  Constants.h
//  FbVkTw
//
//  Created by Mykola Sobko on 19.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//-------------------

#pragma mark - VK data

#define VK_APP_ID @"5155064"
#define VK_SCOPES @"friends,photos,wall,notify,messages,offline"
#define VK_REDIRECT_URI @"https://oauth.vk.com/blank.html"
#define VK_DISPLAY @"mobile"
#define VK_API_VERSION @"5.34"

#define USER_ID_KEY @"user_id"
#define TOKEN_LIFE_TIME_KEY @"expires_in"
#define VK_ACCESS_TOKEN_KEY @"access_token"
#define CREATED @"created"
#define TEMPORAL_ERROR 3
#define AUTH_COMPLITED_KEY @"authComplited"
#define BASE_URL @"https://api.vk.com/method/"
/*
#define VK_ACCESS_TOKEN @"access_token"

#define GET_DEFAULT_VALUE(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]

#define SAVE_DEFAULT_VALUE(_value_, _key_)\
[[NSUserDefaults standardUserDefaults] setObject:_value_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

#define VK_USER_ID @"user_id"

#define GET_DEFAULT_IDVALUE(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]

#define SAVE_DEFAULT_IDVALUE(_value_, _key_)\
[[NSUserDefaults standardUserDefaults] setObject:_value_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]
*/

//-------------------

#pragma mark - Facebook data

#define FACEBOOK_APP_ID @"423786924485895"

#pragma mark - Twitter data

#define WEB_LOGIN_TO @"loginto"
#define TWITTER_ACCESS_TOKEN @"twitterToken"

#define TWITTER_OAUTH_ACCESS_TOKEN @"2301498467-9Ie6PTemnblbTRKjz3mKCR4wPEcCq1RMKCR0GDj" // TOKEN ONLY FOR DEVELOPER
#define TWITTER_OAUTH_ACCESS_SECRET @"cVlGiKHxFVjdCFMmSLVmNF2HJabdY6OpCTwj5yADIS0WO"

#define COSTUMER_API_KEY @"iwGMxSGXNCNzd7dbWpzLQStdl"
#define COSTUMER_API_SECRET @"8BOTQTxIYpKlsML7FHUz8Kmc4rgDbJIbEbVCC59vQqgQyzIaCs"


#endif /* Constants_h */
