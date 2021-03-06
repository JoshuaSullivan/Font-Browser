//
//  NRDRootViewController.m
//  FontBrowser
//
//  Created by Joshua Sullivan on 11/4/13.
//  Copyright (c) 2013 The Nerdery. All rights reserved.
//

#import "NRDRootViewController.h"
#import "NRDFontDetailViewController.h"
#import "NRDFontFamily.h"

static NSString *const kTestString = @"How razorback-jumping frogs can level six piqued gymnasts!";

@interface NRDRootViewController ()

@property (strong, nonatomic) NSArray *fontList;

@end

@implementation NRDRootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *fonts = [NSMutableArray array];
    
    for (NSString *familyName in [UIFont familyNames]) {
        NRDFontFamily *fontFamily = [[NRDFontFamily alloc] initWithFamilyName:familyName];
        [fonts addObject:fontFamily];
    }
    [fonts sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [((NRDFontFamily *)obj1).familyName compare:((NRDFontFamily *)obj2).familyName];
    }];
    
    self.fontList = [NSArray arrayWithArray:fonts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.fontList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NRDFontFamily *fontFamily = self.fontList[section];
    return [fontFamily.fontNames count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NRDFontFamily *fontFamily = self.fontList[section];
    return fontFamily.familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"fontListCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NRDFontFamily *fontFamily = self.fontList[indexPath.section];
    NSString *fontName = fontFamily.fontNames[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:fontName size:16.0f];
    cell.textLabel.text = kTestString;
    cell.detailTextLabel.text = fontName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.identifier isEqualToString:@"fontDetailSegue"]) {
        NRDFontFamily *fontFamily = self.fontList[indexPath.section];
        ((NRDFontDetailViewController *)segue.destinationViewController).fontFamilyName = fontFamily.familyName;
        ((NRDFontDetailViewController *)segue.destinationViewController).fontName = fontFamily.fontNames[indexPath.row];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
