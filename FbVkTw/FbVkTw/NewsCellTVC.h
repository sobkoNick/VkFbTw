//
//  NewsCellTVC.h
//  FbVkTw
//
//  Created by Mykola Sobko on 08.04.16.
//  Copyright © 2016 Mykola Sobko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCellTVC : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *groupImage;
@property (weak, nonatomic) IBOutlet UIImageView *socialImage;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;


@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsText;


@end
