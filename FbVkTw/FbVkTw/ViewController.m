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
    BOOL isTwitterToken;
    
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
    
    
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:VK_ACCESS_TOKEN_KEY]) {
        NSLog(@"viewContr tokern = %@", [[NSUserDefaults standardUserDefaults] valueForKey:VK_ACCESS_TOKEN_KEY]);
        //self.VKLoginBtn.titleLabel.text = @"Log out";
        [self.VKLoginBtn setTitle:@"Log Out from Vk" forState:UIControlStateNormal];
        isToken = YES;
    }
    if ([[NSUserDefaults standardUserDefaults] valueForKey:TWITTER_ACCESS_TOKEN]) {
        [self.TWLoginBtn setTitle:@"Log Out from Twitter" forState:UIControlStateNormal];
        isTwitterToken = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    if ([[NSUserDefaults standardUserDefaults] valueForKey:VK_ACCESS_TOKEN_KEY]) {
        [self.VKLoginBtn setTitle:@"Log Out from Vk" forState:UIControlStateNormal];
        isToken = YES;
    } else {
        [self.VKLoginBtn setTitle:@"Log In to Vk" forState:UIControlStateNormal];
        isToken = NO;
    }
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:TWITTER_ACCESS_TOKEN]) {
        [self.TWLoginBtn setTitle:@"Log Out from Twitter" forState:UIControlStateNormal];
        isTwitterToken = YES;
    } else {
        [self.TWLoginBtn setTitle:@"Log In to Twitter" forState:UIControlStateNormal];
        isTwitterToken = NO;
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
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:VK_ACCESS_TOKEN_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.VKLoginBtn setTitle:@"Log In to Vk" forState:UIControlStateNormal];
        isToken = NO;
    } else {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"Vk" forKey:WEB_LOGIN_TO];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        WebLoginVC *webLoginVC = [self.storyboard  instantiateViewControllerWithIdentifier:@"WebLoginVC"];
        [self presentViewController:webLoginVC animated:YES completion:nil];
        //[self.navigationController pushViewController:webLoginVC animated:YES];
    }
}
- (IBAction)TWLogInLogOut:(id)sender {
    if (isTwitterToken == YES) {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:TWITTER_ACCESS_TOKEN];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.TWLoginBtn setTitle:@"Log In to Twitter" forState:UIControlStateNormal];
        isTwitterToken = NO;
    } else {
        [[FHSTwitterEngine sharedEngine] permanentlySetConsumerKey:COSTUMER_API_KEY andSecret:COSTUMER_API_SECRET];
        
        [[FHSTwitterEngine sharedEngine]setDelegate:self];
        [[FHSTwitterEngine sharedEngine]loadAccessToken];
        
        UIViewController *loginController = [[FHSTwitterEngine sharedEngine] loginControllerWithCompletionHandler:^(BOOL success) {
            if (success) {
                // Login User
            }
        }];
        [self presentViewController:loginController animated:YES completion:nil];
    }
}

- (void)storeAccessToken:(NSString *)accessToken {
    [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:TWITTER_ACCESS_TOKEN];
    NSLog(@"tw token = %@", accessToken);
    isTwitterToken = YES;
}

- (NSString *)loadAccessToken {
    return [[NSUserDefaults standardUserDefaults]objectForKey:TWITTER_ACCESS_TOKEN];
}


@end
