//
//  ViewController.m
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BOOL _viewDidAppear;
    BOOL _viewIsVisible;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /*[FBSDKSettings setAppID:FACEBOOK_APP_ID];
    self.title = @"start";
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
    NSLog(@" token == %@", [FBSDKAccessToken currentAccessToken]);*/
    
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    
    CGRect VkLoginBtnFrame = self.VKLoginBtn.frame;
    
    VkLoginBtnFrame.origin.y -= 50;
    
    loginButton.frame = VkLoginBtnFrame;
    
    //loginButton.center.y = self.v
    
    [self.view addSubview:loginButton];
    
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    NSString *accessToken = [FBSDKAccessToken currentAccessToken];
    NSLog(@" token == %@", accessToken);
    
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
