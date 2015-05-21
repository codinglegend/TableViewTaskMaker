//
//  ToDo.h
//  EveryDoForReal
//
//  Created by Alain  on 2015-05-20.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* taskDescription; // description is a method in NSObject, could fix by making it read-only but decided to change the name instead
@property (nonatomic) NSNumber* priorityNumber;
@property (nonatomic) BOOL isCompletedIndicator;


// does this need to be included here? compiler seems to understand it without it.
- (instancetype)initWithTitle:(NSString*) title andDescription:(NSString*)taskDescription andPriorityNumber:(NSNumber*)priorityNumber andCompletedIndicator:(BOOL)isCompletedIndicator;



@end

