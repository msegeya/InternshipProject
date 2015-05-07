//
//  ProfileInfoViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "TransactionsTableViewController.h"
#import "ActivityIndicatorController.h"
#import "FilterTableViewController.h"

@interface TransactionsTableViewController ()
{
    UserData *user;
    ActivityIndicatorController *activityIndicator;
    BOOL isFiltering;
}

@property (strong,nonatomic) APILayer *api;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelFiltering;

@property (strong,nonatomic) NSArray *filteredArray;

- (IBAction)cancelFilteredAction:(id)sender;

@property (strong,nonatomic) NSArray *accNumbers;


@end

@implementation TransactionsTableViewController


#pragma mark ViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.api = [[APILayer alloc]initWithView:self.view];
    self.api.delegate = self;
    
    user = [UserData sharedManager];
    
    [self.api transactionRequestWithToken:user.userToken];
    isFiltering = NO;
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate methods

-(void)responseTrnasactionsRecivedWithArray:(NSArray *)array{
    
    self.datasouce = array;
    [self.tableView reloadData];
    
    [self getAllAcountNumbers];
    
    [activityIndicator stopActivityIndicator];
}

-(void)returnFilteredData:(FilterData *)data
{
    self.navigationItem.leftBarButtonItem.enabled = YES;
    
    isFiltering = YES;
    
    
    NSMutableArray *compoundPredicate = [NSMutableArray array];
    
    
    //[NSString stringWithFormat:@"(amount >= %@)", data.min];
    
    if(data.accNumber)
    {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"deptorAccountNumber CONTAINS[cd] %@", data.accNumber];
        [compoundPredicate addObject:p];
    }
    if(data.startDate)
    {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(valueDate >= %@)", data.startDate];
        [compoundPredicate addObject:p];
    }
    if(data.endDate)
    {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(valueDate <= %@)", data.endDate];
        [compoundPredicate addObject:p];
    }
    if(data.min !=-1 && data.max != -1 )
    {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(currency.amount >= %ld AND currency.amount <= %ld)", data.min,data.max];
        
        [compoundPredicate addObject:p];
    }else if(data.max != -1)
    {
        NSPredicate *p5 = [NSPredicate predicateWithFormat:@"(currency.amount <= %ld)", data.max];
        [compoundPredicate addObject:p5];
    }
    else if(data.min != -1)
    {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(currency.amount >= %ld)", data.min];
        [compoundPredicate addObject:p];
    }
    
    NSPredicate *allPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:compoundPredicate];
    
    
    self.filteredArray = [self.datasouce filteredArrayUsingPredicate:allPredicate];
    [self.tableView reloadData];
}











#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"idDetailSegue"]){
        TransactionDetailViewController *destiantionController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        if(isFiltering)
            destiantionController.transaction = [self.filteredArray objectAtIndex:indexPath.row];
        
        else
            destiantionController.transaction = [self.datasouce objectAtIndex:indexPath.row];
    }
    else if([segue.identifier isEqualToString:@"idFilterSegue"]){
        
        FilterTableViewController *destiantionController = [segue destinationViewController];
        destiantionController.delegate = self;
        isFiltering = NO;
        destiantionController.accNumbers = self.accNumbers;
        
    }
    
}

#pragma mark UITableController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(isFiltering)
        return [self.filteredArray count];
    else
        return self.datasouce.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"idTransactionCell";
    
    
    TransactionCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    Transaction *trans;
    
    if(isFiltering)
    {
        trans = [self.filteredArray objectAtIndex:indexPath.row];
    }else
    {
        
        trans = [self.datasouce objectAtIndex:indexPath.row];
    }
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"dd/MM/yyy"];
    NSString *date = [formater stringFromDate:trans.valueDate];
    
    
    cell.address.text =trans.creditor.address;
    cell.creditorName.text =trans.creditor.name ;
    cell.creditorAccNumber.text=trans.creditorAccountNumber;
    cell.paymentDescription.text = trans.paymentDescription;
    cell.valueDate.text = date;
    
    return cell;
}


#pragma mark - Class Methods

-(void)getAllAcountNumbers
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (Transaction *t in self.datasouce) {
        NSString *acc = t.deptorAccountNumber;
        [array addObject:acc];
    }
    
    self.accNumbers = [[NSArray alloc]initWithArray:[[NSSet setWithArray:array] allObjects]];
}


- (IBAction)cancelFilteredAction:(id)sender {
    
    isFiltering = NO;
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.tableView reloadData];
}
@end
