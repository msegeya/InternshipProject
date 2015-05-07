//
//  ExchangeRateController.m
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ExchangeRateController.h"

@interface ExchangeRateController (){
    UserData *user;
}

@property (strong,nonatomic) APILayer *api;

@end

@implementation ExchangeRateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.api = [[APILayer alloc]initWithView:self.view];
    self.api.delegate = self;
    
    user = [UserData sharedManager];

    [self.api exchangeRateRequestWithToken:user.userToken];

    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *simpleTableIdentifier = @"IdExchangeRateCell";
    
    ExchangeRateCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    ExchangeRateModel *rates = [_dataSource objectAtIndex:indexPath.row];
    
    
    cell.currencyCode.text = rates.currencyCode;
    cell.buyRate.text = rates.buy ;
    cell.middleRate.text = rates.middle ;
    cell.sellRate.text = rates.sell;
    
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)responseExchangeRateRecivedWithData:(NSArray *)array
{
    _dataSource = array;
    [_tableView reloadData];
    
}

@end
