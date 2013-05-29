//
//  RPNDetailViewController.m
//  SplitViewSliderDemo
//
//  Created by Rob on 18/02/2013.
//  Copyright (c) 2013 Rob Nadin. All rights reserved.
//

#import "RPNDetailViewController.h"

@interface RPNDetailViewController () {
    BOOL masterIsHidden;
}

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end

@implementation RPNDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }

    toggleItem.title = (masterIsHidden) ? @"Show" : @"Hide";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    if (!masterIsHidden)
    {
        barButtonItem.title = NSLocalizedString(@"Master", @"Master");
        [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
        self.masterPopoverController = popoverController;
    }
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    //[self.navigationItem setLeftBarButtonItem:nil animated:YES];
    [self.navigationItem setLeftBarButtonItem:toggleItem animated:YES];
    self.masterPopoverController = nil;
}

-(BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsPortrait(orientation))
        return YES;

    return masterIsHidden;
}

#pragma mark Actions

// In split delegate
- (void)hideMaster:(BOOL)hideState
{
    masterIsHidden = hideState;

//    [UIView beginAnimations:@"toggleMaster" context:nil];
//    [UIView setAnimationDuration:0.30f];
    [self.splitViewController.view setNeedsLayout];
    self.splitViewController.delegate = nil;
    self.splitViewController.delegate = self;

    [self.splitViewController willRotateToInterfaceOrientation:[UIApplication sharedApplication].statusBarOrientation duration:0];
//    [UIView commitAnimations];
}

- (IBAction)toggleMasterView:(id)sender
{
	[self configureView];
    [self hideMaster:!masterIsHidden];
}

@end
