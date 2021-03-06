//
//  YourViewController.m
//  ABPadLockScreen
//
//  Created by Aron Bury on 9/09/11.
//  Copyright 2011 Aron's IT Consultancy. All rights reserved.
//

#import "YourViewController.h"
#import "ABPadLockScreen.h"

@interface YourViewController()

-(void)showLockScreen:(id)sender;
@end

@implementation YourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, 768, 1024)];  
    
    UIButton *showLockScreen = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showLockScreen setFrame:CGRectMake(500.0f, 500.0f, 180.0f, 50.0f)];
    [showLockScreen setTitle:@"Show Lock Screen" forState:UIControlStateNormal];
    [showLockScreen addTarget:self action:@selector(showLockScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showLockScreen];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if UIInterfaceOrientationIsLandscape(fromInterfaceOrientation)
    {
        [self.view setFrame:CGRectMake(0, 0, 768, 1024)]; 
    }
    else if UIInterfaceOrientationIsPortrait(fromInterfaceOrientation)
    {
        [self.view setFrame:CGRectMake(0, 0, 1024, 768)]; 
    }
}

#pragma mark - private methods
-(void)showLockScreen:(id)sender
{
    //Create the ABLockScreen (Alloc init) and display how you wish. An easy way is by using it as a modal view as per below:
    ABPadLockScreen *lockScreen = [[ABPadLockScreen alloc] init];
    float centerLeft = self.view.frame.size.width/2.0f - lockScreen.view.frame.size.width/2.0f;
    float centerTop =  self.view.frame.size.height/2.0f - lockScreen.view.frame.size.height/2.0f;
    
    lockScreen.onSuccessfulUnlock = ^(ABPadLockScreen* lock) {
        [self dismissModalViewControllerAnimated:YES];
    };
    
    lockScreen.onUnlockCancelled = ^(ABPadLockScreen* lock) {
        [self dismissModalViewControllerAnimated:YES];
    };
    
    lockScreen.onAttemptsExpired = ^(ABPadLockScreen* lock) {
        [self dismissModalViewControllerAnimated:YES];
    };

    lockScreen.onUnsuccessfulAttempt = ^(ABPadLockScreen* lock, int tried, int attempts) {
        
    };
    
    [self presentModalViewController:lockScreen animated:YES];
    lockScreen.view.superview.frame = CGRectMake(centerLeft, centerTop, 332.0f, 465.0f);

    
    [lockScreen release];
}

@end