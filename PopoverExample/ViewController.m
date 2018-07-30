//
//  ViewController.m
//  PopoverExample
//
//  Created by Zaur Giyasov on 30/07/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"
#import "VCPopView.h"

@interface ViewController () <UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate>
@property (nonatomic) UIView *customView;
@property (nonatomic) UIBarButtonItem *showBarItem;
@property (nonatomic) UIBarButtonItem *cancelBarBtn;
@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self loading];
    [self closeCustomPopver];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self closeCustomPopver];
}

-(void)loading {
    [self createMainView];
    [self createLocalNavibarButtons];
}

-(void)createMainView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.origin.y = 40;
    self.customView = [[UIView alloc]initWithFrame:frame];
    self.customView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.customView];
}

-(void)createLocalNavibarButtons {
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
    UINavigationBar *naviBar = [[UINavigationBar alloc] initWithFrame:frame];
    
    // Items
    UINavigationItem *naviItem = [[UINavigationItem alloc] initWithTitle:@"example Title"];
    self.cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonAction:)];
    naviItem.leftBarButtonItem = self.cancelBarBtn;
    
    self.showBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showButtonAction:)];
    naviItem.rightBarButtonItem = self.showBarItem;
    
    [naviBar setItems:@[naviItem]];
    [self.view addSubview:naviBar];
}

-(void)cancelButtonAction: (id)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // cancel action
//    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    // or
    [self closeCustomPopver];
}

-(void)showButtonAction: (id)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // show action
    [self createPopover];
}

/* Create popver controller */
-(void)createPopover {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    /* old style code = working. but deprecated
    CGSize contentSize = CGSizeMake(400, 600);
    VCPopView *popView = [[VCPopView alloc] init];
    UIPopoverController *popVC = [[UIPopoverController alloc] initWithContentViewController:popView];
    popVC.popoverContentSize = contentSize;
    [popVC presentPopoverFromBarButtonItem:self.showBarItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    */

    //Prepare the controller you want to be displayed
    VCPopView *popView = [[VCPopView alloc] init];
    popView.modalPresentationStyle = UIModalPresentationPopover;
    popView.preferredContentSize = CGSizeMake(400, 600);
                                                                               
    //configure UIPopoverPresentationController
    UIPopoverPresentationController *popover = popView.popoverPresentationController;
    popover.delegate = self;
    // cityErrorPopover.sourceView = self.view;
    popover.barButtonItem = self.showBarItem;
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popover.backgroundColor = [UIColor yellowColor];
                                                                    
    // present popup
    [self presentViewController:popView animated:YES completion:nil];
    }
}

-(void)closeCustomPopver {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
