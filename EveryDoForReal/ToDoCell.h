//
//  ToDoTableViewCell.h
//  EveryDoForReal
//
//  Created by Alain  on 2015-05-20.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <UIKit/UIKit.h>

// here we are essentially making a custom cell style. i'm doing most of this in storyboard and you MUST click on cell, change class to ToDoCell, **AND** change style to CUSTOM. textLabel and detailedTextLabel will no long work since they are predefined to accompany the other styles. In your custom class, you must create your own.

@interface ToDoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *customTitle;
@property (weak, nonatomic) IBOutlet UILabel *customDetailDescription;
@property (weak, nonatomic) IBOutlet UILabel *customPriority; // not that there is such thing as a predefined priority label but just for clarifying that these are custom labels.


@end
