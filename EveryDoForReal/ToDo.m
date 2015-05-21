//
//  ToDo.m
//  EveryDoForReal
//
//  Created by Alain  on 2015-05-20.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

// title, taskDescription, etc, pass through the information. Here you are *assigning* the properties with the variables they should correspond to.

- (instancetype)initWithTitle:(NSString*) title andDescription:(NSString*)taskDescription andPriorityNumber:(NSNumber*)priorityNumber andCompletedIndicator:(BOOL)isCompletedIndicator
{
    self = [super init];
    if (self) {
        self.title = title;
        self.taskDescription = taskDescription;
        self.priorityNumber = priorityNumber;
        self.isCompletedIndicator = isCompletedIndicator;
        
    }
    return self;
}

@end