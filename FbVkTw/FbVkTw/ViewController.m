//
//  ViewController.m
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "WebLoginVC.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BOOL _viewDidAppear;
    BOOL isToken;
}
#pragma mark - program lifecycle

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
    
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init]; // add FB login
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    CGRect VkLoginBtnFrame = self.VKLoginBtn.frame;
    VkLoginBtnFrame.origin.y -= 50;
    loginButton.frame = VkLoginBtnFrame;
    
    [self.view addSubview:loginButton];
    
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    NSString *accessToken = [FBSDKAccessToken currentAccessToken];
    NSLog(@" token == %@", accessToken);
    
    
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:ACCESS_TOKEN_KEY]) {
        NSLog(@"viewContr tokern = %@", [[NSUserDefaults standardUserDefaults] valueForKey:ACCESS_TOKEN_KEY]);
        //self.VKLoginBtn.titleLabel.text = @"Log out";
        [self.VKLoginBtn setTitle:@"Log Out from Vk" forState:UIControlStateNormal];
        isToken = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    if ([[NSUserDefaults standardUserDefaults] valueForKey:ACCESS_TOKEN_KEY]) {
        [self.VKLoginBtn setTitle:@"Log Out from Vk" forState:UIControlStateNormal];
        isToken = YES;
    } else {
        [self.VKLoginBtn setTitle:@"Log In to Vk" forState:UIControlStateNormal];
        isToken = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - View Controller`s private methods

- (IBAction)LogInOrLogOut:(id)sender {
    
    if (isToken == YES) {
         //[self saveLoginObject:nil forKey:ACCESS_TOKEN_KEY];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:ACCESS_TOKEN_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.VKLoginBtn setTitle:@"Log In to Vk" forState:UIControlStateNormal];
        isToken = NO;
    } else {
        WebLoginVC *webLoginVC = [self.storyboard  instantiateViewControllerWithIdentifier:@"WebLoginVC"];
        [self presentViewController:webLoginVC animated:YES completion:nil];
        //[self.navigationController pushViewController:webLoginVC animated:YES];
    }
}
@end
