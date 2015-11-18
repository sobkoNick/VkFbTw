//
//  WebLoginVC.h
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
// vova works now	with this project

#import <UIKit/UIKit.h>

@interface WebLoginVC : UIViewController <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *loginWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

- (IBAction)cancelLogin:(id)sender;

@end
