//
//  NewsTableVC.m
//  FbVkTw
//
//  Created by Mykola Sobko on 08.04.16.
//  Copyright © 2016 Mykola Sobko. All rights reserved.
//

#import "NewsTableVC.h"
#import "NewsCellTVC.h"

@interface NewsTableVC ()

@end

@implementation NewsTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NewsTitle = @[@"Burj Khalifa",
              @"Eifel",
              @"Empire state",
              @"Kingdom towe",
              @"Taipei"];
    GroupNames = @[@"Football",
              @"manchester",
              @"ios development",
              @"Android",
              @"How to get 1000$$ free"];
    
    NewsTexts = @[@"Shahtart won away 1-2 in Portugal. Great news for Ukraine",
              @"Mour is getting closer to MAnchester Uniteed",
              @"Uncomment the following line to display an Edit button in the navigation bar for this view controller",
              @"Samsung and motorola creating new supper spped phones",
              @"No way"];
    GroupImages = @[@"Burj Khalifa",
                  @"Eifel",
                  @"Empire state",
                  @"Kingdom towe",
                  @"Taipei"];
    
    NewsImages = @[@"http://oi68.tinypic.com/dzy0xy.jpg",
                   @"http://i63.tinypic.com/dzz6ag.jpg",
                   @"http://i66.tinypic.com/dzz780.jpg",
                   @"http://i66.tinypic.com/e00htf.jpg",
                   @"http://i63.tinypic.com/e00vno.jpg"];
    
    SocialImages = @[@"https://g.twimg.com/Twitter_logo_blue.png",
                     @"http://cdn01.pelfusion.com/wp-content/uploads/2013/04/facebook-logo.jpg",
                     @"https://g.twimg.com/Twitter_logo_blue.png",
                     @"http://cdn01.pelfusion.com/wp-content/uploads/2013/04/facebook-logo.jpg",
                     @"http://cs424830.vk.me/v424830492/6804/zV6qPW7AYAg.jpg"];
    GroupImages = @[@"https://en.opensuse.org/images/a/aa/Nvidia_logo.jpg",
                     @"https://www.logaster.com/blog/wp-content/uploads/2013/06/jpg.png",
                     @"http://i-1.prod-cdn.webapps.microsoft.com/r/image/view/-/579640/highRes/1/-/nokia-logo-FB-jpg.jpg",
                     @"https://c1.staticflickr.com/4/3051/2890122360_e3df2a6576.jpg",
                     @"https://upload.wikimedia.org/wikipedia/commons/d/dd/Linux_logo.jpg"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return NewsTitle.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    NewsCellTVC *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = (int)[indexPath row];
    
    cell.groupName.text = GroupNames[row];
    cell.newsTitle.text = NewsTitle[row];
    cell.newsText.text = NewsTexts[row];
    
    cell.groupImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:GroupImages[row]]]];
    cell.socialImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:SocialImages[row]]]];
    cell.newsImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:NewsImages[row]]]];

    

    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
