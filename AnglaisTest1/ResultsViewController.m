/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "ResultsViewController.h"
#import "ResultsCell.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController
@synthesize resultFirstNames;
@synthesize resultLastNames;
@synthesize resultGrades;
@synthesize resultMails;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"Results"]];
    
    self.resultFirstNames = [[NSMutableArray alloc] initWithObjects:nil];
    self.resultLastNames = [[NSMutableArray alloc] initWithObjects:nil];
    self.resultMails = [[NSMutableArray alloc] initWithObjects:nil];
    self.resultGrades = [[NSMutableArray alloc] initWithObjects:nil];
    
    for (NSUInteger index = 0; index < [sectionsArray count]; ++index) {
        [self.resultFirstNames addObject:[[sectionsArray objectAtIndex:index] objectForKey:@"firstName"]];
        [self.resultLastNames addObject:[[sectionsArray objectAtIndex:index] objectForKey:@"lastName"]];
        [self.resultMails addObject:[[sectionsArray objectAtIndex:index] objectForKey:@"mail"]];
        [self.resultGrades addObject:[[sectionsArray objectAtIndex:index] objectForKey:@"score"]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setResultFirstNames:nil];
    [self setResultLastNames:nil];
    [self setResultMails:nil];
    [self setResultGrades:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.resultLastNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultsCell"];

    cell.resultFirstName.text = [self.resultFirstNames objectAtIndex: [indexPath row]];
    cell.resultLastName.text = [self.resultLastNames objectAtIndex: [indexPath row]];
    cell.resultMail.text = [self.resultMails objectAtIndex: [indexPath row]];
    cell.resultGrade.text = [self.resultGrades objectAtIndex: [indexPath row]];
    return cell;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
