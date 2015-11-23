//
//  WebLoginVC.m
//  FbVkTw
//
//  Created by Mykola Sobko on 17.11.15.
//  Copyright © 2015 Mykola Sobko. All rights reserved.
//

#import "WebLoginVC.h"
#import "Requests.h"
#import "Constants.h"

@interface WebLoginVC ()
- (BOOL)getUserAthorizationData:(NSURL *)requestUrlString;
- (BOOL)connectedToInternet;
@end

@implementation WebLoginVC

#pragma mark - program lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"login";
    [self.loginActivityIndicator startAnimating];
    
    NSURLRequest *lRequest = (NSURLRequest *)[Requests VKloginRequest];
    [self.loginWebView loadRequest:lRequest];
    //[[self navigationController] setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView delegates

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    BOOL lResult = YES;
    
    if([self connectedToInternet]){
        
        lResult = ![self getUserAthorizationData:request.URL];
        
    } else {
        [self showAlertWithMessage:@"Check internet connection!"];
        [self dismissViewControllerAnimated:YES completion:nil];
        lResult =  NO;
    }
    
    return lResult;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.loginActivityIndicator stopAnimating];
    [self.loginActivityIndicator setHidden:YES];
}

#pragma mark - Private methods

- (BOOL)getUserAthorizationData:(NSURL *)requestUrlString {
    BOOL lResult = NO;
    
    NSURLComponents *lUrlCmponets = [NSURLComponents componentsWithURL:requestUrlString resolvingAgainstBaseURL:NO];
    if ([lUrlCmponets.path isEqualToString:@"/blank.html"]) {
        lResult = YES;
        [self saveLoginObject:[NSDate new] forKey:CREATED];
        lUrlCmponets.query = lUrlCmponets.fragment;
        NSArray *lQueryItems = lUrlCmponets.queryItems;
        [self dismissViewControllerAnimated:YES completion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"successfulLogin" object:nil];
        }];
        
        for (NSURLQueryItem *item in lQueryItems) {
            if ([item.name isEqualToString:ACCESS_TOKEN_KEY]) {
                
                [self saveLoginObject:item.value forKey:ACCESS_TOKEN_KEY];
                
            } else if ([item.name isEqualToString:USER_ID_KEY]) {
                
                [self saveLoginObject:item.value forKey:USER_ID_KEY];
                
            } else if ([item.name isEqualToString:TOKEN_LIFE_TIME_KEY]) {
                
                [self saveLoginObject:item.value forKey:TOKEN_LIFE_TIME_KEY];
            } else if ([item.name isEqualToString:@"error_description"]){
                
                [self showAlertWithMessage:item.value];
            }
            
        }
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:AUTH_COMPLITED_KEY];
    }
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:ACCESS_TOKEN_KEY]);
    return lResult;
}

- (void)saveLoginObject:(id)value forKey:(id)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)connectedToInternet {
    NSString *lUrlString = @"https://www.google.com/";
    NSURL *lUrl = [NSURL URLWithString:lUrlString];
    NSMutableURLRequest *lRequest = [NSMutableURLRequest requestWithURL:lUrl];
    [lRequest setHTTPMethod:@"HEAD"];
    NSHTTPURLResponse *lResponse;
    
    [NSURLConnection sendSynchronousRequest:lRequest returningResponse:&lResponse error: NULL];
    
    return ([lResponse statusCode] == 200) ? YES : NO;
}

- (void)showAlertWithMessage:(NSString *)message{
    UIAlertView *lAlert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [lAlert show];
}

- (IBAction)cancelLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
