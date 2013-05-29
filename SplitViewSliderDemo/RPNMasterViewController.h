//
//  RPNMasterViewController.h
//  SplitViewSliderDemo
//
//  Created by Rob on 18/02/2013.
//  Copyright (c) 2013 Rob Nadin. All rights reserved.
//

@class RPNDetailViewController;

@interface RPNMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) RPNDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
