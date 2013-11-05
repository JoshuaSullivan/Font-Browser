//
//  NRDFontDetailViewController.m
//  FontBrowser
//
//  Created by Joshua Sullivan on 11/4/13.
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NRDFontDetailViewController.h"

static NSString *const kUsageExampleString = @"Forsaking monastic tradition, twelve jovial friars gave up their vocation for a questionable existence on the flying trapeze.";
static NSString *const kEnumerationString = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.!?,:";

@interface NRDFontDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;

@end

@implementation NRDFontDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.exampleLabel.text = [NSString stringWithFormat:@"%@\n\n%@", kUsageExampleString, kEnumerationString];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = self.fontFamilyName;
    self.titleLabel.text = self.fontName;
    
    self.exampleLabel.font = [UIFont fontWithName:self.fontName size:24.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
