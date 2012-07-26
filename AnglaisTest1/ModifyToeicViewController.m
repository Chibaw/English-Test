/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "ModifyToeicViewController.h"
#import "ModifyToeicCell.h"

@interface ModifyToeicViewController ()

@end

@implementation ModifyToeicViewController
@synthesize array;
@synthesize questionNumbers = _questionNumbers;
@synthesize questionTexts = _questionTexts;
@synthesize questionAnswers = _questionAnswers;


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
    
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"plist"];
//    
//    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
//    self.array = [NSArray alloc];
//    self.array = [dic objectForKey:@"QuestionsAndAnswers"];
//    
//    NSUInteger count = [self.array count];
//    for (NSUInteger index = 0; index < count; index++)
//    {  
//        [[self.array objectAtIndex: index] objectForKey: @"lastName"];
//        [[self.array objectAtIndex: index] objectForKey: @"firstName"];
//        [[self.array objectAtIndex: index] objectForKey: @"mail"];
//    }
    
    self.questionNumbers = [[NSArray alloc]
                            initWithObjects:
                            @"1",
                            @"2",
                            @"3",
                            @"4",
                            @"5", nil];
    
    self.questionTexts = [[NSArray alloc]
                            initWithObjects:
                            @"Would you ...",
                            @"What is the ...",
                            @"Is the ....",
                            @"In your opinion ...",
                            @"As regard of ...", nil];
    
    self.questionAnswers = [[NSArray alloc]
                            initWithObjects:
                            @"A",
                            @"B",
                            @"C",
                            @"D",
                            @"B", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.questionNumbers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModifyToeicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"modifyToeicCell"];
    
    cell.questionNumber.text = [self.questionNumbers objectAtIndex: [indexPath row]];
    cell.questionText.text = [self.questionTexts objectAtIndex:[indexPath row]];
    cell.questionAnswer.text = [self.questionAnswers objectAtIndex: [indexPath row]];
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
