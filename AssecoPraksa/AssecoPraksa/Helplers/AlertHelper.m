//
//  AlertHelper.m
//  AssecoPraksa
//
//  Created by Alan Marcan on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper

+(void) showAlertWithMessage:(NSString*)message
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

	[alert show];
}

@end
