//
//  DetailViewController.h
//  EveryDoForReal
//
//  Created by Alain  on 2015-05-20.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

