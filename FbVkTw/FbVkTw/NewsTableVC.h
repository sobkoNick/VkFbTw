//
//  NewsTableVC.h
//  FbVkTw
//
//  Created by Mykola Sobko on 08.04.16.
//  Copyright © 2016 Mykola Sobko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableVC : UITableViewController {
    NSArray *GroupImages; // contains image urls
    NSArray *SocialImages;
    NSArray *NewsImages;
    
    NSArray *GroupNames; // simple texts
    NSArray *NewsTitle;
    NSArray *NewsTexts;
}

@end
