//
//  SetingsTableViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 27/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "SetingsTableViewController.h"

@interface SetingsTableViewController ()


@property (strong, nonatomic) IBOutlet UILabel *getNotificationLabel;

@property (strong, nonatomic) IBOutlet UILabel *languageLabel;
@property (strong, nonatomic) IBOutlet UILabel *contractslabel;
@property (strong, nonatomic) IBOutlet UILabel *logoutLabel;

@property (strong, nonatomic) IBOutlet UILabel *language;
@end

@implementation SetingsTableViewController



-(void)setUILocaliztionString
{
    self.getNotificationLabel.text = NSLocalizedString(@"setingsGetNotifications", @"comment");
    self.languageLabel.text = NSLocalizedString(@"setingsLanguage", @"comment");
    self.contractslabel.text = NSLocalizedString(@"setingsContacts", @"comment");
    self.logoutLabel.text = NSLocalizedString(@"setingsLogout", @"comment");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUILocaliztionString];
    
    NSString *currentLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    self.language.text = [currentLanguage uppercaseString];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1 && indexPath.row == 1)
    {
        
    }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
