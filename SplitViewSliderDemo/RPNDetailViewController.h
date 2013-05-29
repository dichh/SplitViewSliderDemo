//
//  RPNDetailViewController.h
//  SplitViewSliderDemo
//
//  Created by Rob on 18/02/2013.
//  Copyright (c) 2013 Rob Nadin. All rights reserved.
//

@interface RPNDetailViewController : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate> {
	IBOutlet UISplitViewController *splitController;
	IBOutlet UIBarButtonItem *toggleItem;
}

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)toggleMasterView:(id)sender;

@end
