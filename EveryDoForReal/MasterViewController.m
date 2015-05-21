//
//  MasterViewController.m
//  EveryDo
//
//  Created by Alain  on 2015-05-20.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"

// *****Code to study according to Eli:*******
/*
 insertNewObject
 numberOfSectionsInTableView
 tableView:numberOfRowsInSection
 tableView:cellForRowAtIndexPath
 tableView:canEditRowAtIndexPath
 tableView:commitEditingStyle:forRowAtIndexPath
 */

@interface MasterViewController ()

@property NSMutableArray *objects; // *objects here is the data model. table view will check with this to see what information is available to display. UNDERSTANDABLY, IT IS AN NSMUTABLEARRAY
@end

@implementation MasterViewController

//awakFromNib is what will actually be displayed
- (void)awakeFromNib {
    [super awakeFromNib];
}


// when in doubt, put it in the viewDidLoad.
// viewDidLoad is what LOADS, but not necessarily what is DISPLAYED (in contrast to awakeFromNib)
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // step: instantiate several Todo objects, and fill out their values with some tasks of your choice.
    
    ToDo *firstTask = [[ToDo alloc] initWithTitle:@"Make breakfast" andDescription:@"Eggs and Toast" andPriorityNumber:@(1) andCompletedIndicator:YES];
    
    ToDo *secondTask = [[ToDo alloc] initWithTitle:@"Leave at 8 AM" andDescription:@"Catch last West Coast Express" andPriorityNumber:@(2) andCompletedIndicator:NO];
    
    ToDo *thirdTask = [[ToDo alloc] initWithTitle:@"Review the day's work" andDescription:@"Check Compass" andPriorityNumber:@(3) andCompletedIndicator:NO];
    
    // WRONG WRONG WRONG   NSMutableArray *objects = [firstTask, secondTask, thirdTask];
    
    // put them into an Array
    
    self.objects = [[NSMutableArray alloc] init];
    [self.objects addObject: firstTask]; // have to use self.objects because objects above is just the NAME of a property called objects....it is not a variable itself?
    [self.objects addObject: secondTask];
    [self.objects addObject: thirdTask];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    // instance toDo is just a placeholder for the purpose of the assignment
    ToDo *toDo = [[ToDo alloc] initWithTitle:@"New Task" andDescription:@"select to modify"andPriorityNumber:@(1) andCompletedIndicator:YES];
    [self.objects insertObject:toDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
// tricky: had to change return type UITableViewCell to ToDoCell here for it to work

// if you don't include the .text below it will say "incompatible pointer types assgining to UILabel from NSString, meaning that you're trying to assign something to the entire customTitle or customDetailDescription label when really you want to be only assigning it to the text.
    
    ToDo *object = self.objects[indexPath.row]; // used to have id object here instead on the left side, but because object is pointing to objets, which is an array of items of type ToDo (firstTask, secondTask, etc), we know the return type is object ToDo. Therefore use that as the returnType.
    cell.customTitle.text = [object title];
    cell.customDetailDescription.text = [object taskDescription];
    cell.customPriority.text = [NSString stringWithFormat:@"%@", [object priorityNumber]]; // used stringWithFormat to create string, because we cannot directly access a number from customPriority (not on the list), so we convert the right side into a string and access the text.
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
