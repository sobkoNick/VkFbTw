//
//  WebLoginVC.m
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "WebLoginVC.h"

@interface WebLoginVC ()

@end

@implementation WebLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"login";
    [self.loginActivityIndicator startAnimating];
    //[[self navigationController] setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
