//
//  MTDetailViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 01/08/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *answerCheck;

@property (weak, nonatomic) IBOutlet UILabel *questionNumber;

@property (weak, nonatomic) IBOutlet UITextField *audioPath;
@property (weak, nonatomic) IBOutlet UITextField *imagePath;
@property (weak, nonatomic) IBOutlet UITextField *questionText;
@property (weak, nonatomic) IBOutlet UITextField *AText;
@property (weak, nonatomic) IBOutlet UITextField *BText;
@property (weak, nonatomic) IBOutlet UITextField *CText;
@property (weak, nonatomic) IBOutlet UITextField *DText;

- (IBAction)ListenAudio:(id)sender;
- (IBAction)ShowImage:(id)sender;

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSIndexPath *num;

@property (nonatomic) NSUInteger indexSections;
@property (nonatomic) NSUInteger index;
@end
