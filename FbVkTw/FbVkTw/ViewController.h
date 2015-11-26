//
//  ViewController.h
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FHSTwitterEngine/FHSTwitterEngine.h"

@interface ViewController : UIViewController <FHSTwitterEngineAccessTokenDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *VKLoginBtn;
- (IBAction)LogInOrLogOut:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *TWLoginBtn;
- (IBAction)TWLogInLogOut:(id)sender;


@end

