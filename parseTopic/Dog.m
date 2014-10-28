//
//  Dog.m
//  parseTopicStudentVersion
//
//  Created by S on 10/28/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@dynamic name;
@dynamic owner;

+(void)load
{
    [self registerSubclass];
}

+(NSString *)parseClassName
{
    return @"Dog";
}

@end
