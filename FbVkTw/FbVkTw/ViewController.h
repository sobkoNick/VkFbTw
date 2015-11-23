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

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *VKLoginBtn;
- (IBAction)LogInOrLogOut:(id)sender;

@end

