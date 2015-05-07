//
//  PageTableController.m
//  AssecoPraksa
//
//  Created by MTLab on 17/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ProfileTableController.h"

@interface ProfileTableController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *accNumber;
@property (strong, nonatomic) IBOutlet UILabel *currencyCode;

@property (strong, nonatomic) IBOutlet UILabel *amount;

//Labels - language

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *accNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *currencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;


@end



@implementation ProfileTableController



-(void)setUILocaliztionString
{
    self.nameLabel.text = NSLocalizedString(@"profileTableViewNameLabel", @"comment");
    self.accNumberLabel.text = NSLocalizedString(@"profileTableViewAccNumberLabel", @"comment");
    self.currencyLabel.text = NSLocalizedString(@"profileTableViewCurencyLabel", @"comment");
    self.amount.text = NSLocalizedString(@"profileTableViewAmountLabel", @"comment");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUILocaliztionString];
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    DLog(@"TEST")
    
    UserData *user =[UserData sharedManager];
    
    self.name.text = user.userNname;
    self.accNumber.text = user.userAccount.accountnumber;
    self.currencyCode.text = user.userAccount.currency.code;
    self.amount.text = [NSString stringWithFormat:@"%ld", (long)user.userAccount.currency.amount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
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
