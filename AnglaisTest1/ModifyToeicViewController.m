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
#import "MTDetailViewController.h"

@interface ModifyToeicViewController ()

@end

@implementation ModifyToeicViewController
@synthesize questionNumbers;
@synthesize questionTexts;
@synthesize questionAnswers;

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
    
    
    self.path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    
    self.dic = [[NSMutableDictionary alloc] initWithContentsOfFile:self.path];
    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[self.dic objectForKey:@"QuestionsAndAnswers"]];

    self.questionAnswers = [[NSMutableArray alloc] initWithObjects:nil, nil];
    self.questionTexts = [[NSMutableArray alloc] initWithObjects:nil, nil];
    self.questionNumbers = [[NSMutableArray alloc] initWithObjects:nil, nil];

    self.answerAs = [[NSMutableArray alloc] initWithObjects:nil, nil];
    self.answerBs = [[NSMutableArray alloc] initWithObjects:nil, nil];
    self.answerCs = [[NSMutableArray alloc] initWithObjects:nil, nil];
    self.answerDs = [[NSMutableArray alloc] initWithObjects:nil, nil];

    NSUInteger questionCount = 0;
    NSUInteger countSections = [sectionsArray count];
    for (NSUInteger indexSections = 0; indexSections < countSections; indexSections++) {
        
        NSArray *question = [sectionsArray objectAtIndex:indexSections];
        NSUInteger count = [question count];
        for (NSUInteger index = 0; index < count; index++)
        {
            [self.questionNumbers addObject:[NSString stringWithFormat:@"%u", questionCount+1]];
            [self.questionTexts addObject:[[[question objectAtIndex: index] copy] objectForKey: @"question"]];
            [self.questionAnswers addObject:[[question objectAtIndex: index] objectForKey: @"answer"]];

            [self.answerAs addObject:[[question objectAtIndex: index] objectForKey: @"A"]];
            [self.answerBs addObject:[[question objectAtIndex: index] objectForKey: @"B"]];
            [self.answerCs addObject:[[question objectAtIndex: index] objectForKey: @"C"]];
            [self.answerDs addObject:[[question objectAtIndex: index] objectForKey: @"D"]];
            questionCount++;
        }
        
    }
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
    return [self.questionTexts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModifyToeicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"modifyToeicCell"];
    
    cell.questionNumber.text = [self.questionNumbers objectAtIndex: [indexPath row]];
    cell.questionText.text = [self.questionTexts objectAtIndex:[indexPath row]];
    cell.questionAnswer.text = [self.questionAnswers objectAtIndex: [indexPath row]];

    cell.answerA.text = [self.answerAs objectAtIndex: [indexPath row]];
    cell.answerB.text = [self.answerBs objectAtIndex: [indexPath row]];
    cell.answerC.text = [self.answerCs objectAtIndex: [indexPath row]];
    cell.answerD.text = [self.answerDs objectAtIndex: [indexPath row]];
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
    MTDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ToeicAdminId"];
//    NSLog(@"%u", [indexPath indexAtPosition:1]);
    [detailViewController setNum:indexPath];
    [detailViewController setDic:self.dic];
    [detailViewController setPath:self.path];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
