//
//  DetailViewController.m
//  EveryDoItAgain
//
//  Created by Graeme Harrison on 2016-02-03.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate, UIPickerViewDelegate, UITextViewDelegate>

@property (strong, nonatomic) UIDatePicker *datePicker;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
    }
    
    if (self.isNewItem == NO) {
        self.titleTextField.alpha = 0.8;
        self.priorityTextField.alpha = 0.8;
        self.dateTextField.alpha = 0.8;
        self.descriptionTextView.alpha = 0.8;
    }
    
    [self setDate];
    
    self.titleTextField.delegate = self;
    self.titleTextField.text = self.detailItem.title;
    
    self.priorityTextField.delegate = self;
    self.priorityTextField.text = self.detailItem.priorityNum;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy hh:mm"];
    
    self.dateTextField.delegate = self;
    self.dateTextField.text = [dateFormatter stringFromDate:self.detailItem.deadline];
    
    self.descriptionTextView.delegate = self;
    self.descriptionTextView.text = self.detailItem.descript;
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    [self.datePicker addTarget:self action:@selector(setDate) forControlEvents:UIControlEventValueChanged];
    self.dateTextField.inputView = self.datePicker;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Change functionality of return key based on who is the first responder
    if (textField == self.titleTextField) {
        [self.titleTextField resignFirstResponder];
    }
    return YES;
}

-(void)setDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy hh:mm"];
    self.dateTextField.text = [dateFormatter stringFromDate:self.datePicker.date];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Dismiss the keyboard whenever we touch outside the textfields by telling our textfields to give up first responder status
    [self.titleTextField resignFirstResponder];
    [self.priorityTextField resignFirstResponder];
    [self.dateTextField resignFirstResponder];
    [self.descriptionTextView resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        if ([self.titleTextField.text isEqualToString:@""] &&
            [self.priorityTextField.text isEqualToString:@""] &&
            [self.descriptionTextView.text isEqualToString:@""] &&
            [self.dateTextField.text isEqualToString:@""]) {
            [self.delegate cancelUpdate:self.detailItem];
            return;
        }
        if ([self.titleTextField.text isEqualToString:@""]) {
            self.detailItem.title = @"New Task";
        } else {
            self.detailItem.title = self.titleTextField.text;
        }
        
        if ([self.priorityTextField.text isEqualToString:@""]) {
            self.detailItem.priorityNum = @"No Priority";
        } else {
            self.detailItem.priorityNum = self.priorityTextField.text;
        }
        
        if ([self.descriptionTextView.text isEqualToString:@""]) {
            self.detailItem.descript = @"No Description";
        } else {
            self.detailItem.descript = self.descriptionTextView.text;
        }
        if ([self.dateTextField.text isEqualToString:@""]) {
            self.detailItem.deadline = [NSDate date];
        } else {
            self.detailItem.deadline = self.datePicker.date;
        }
        
        
        [self.delegate updateInputInfo: self.detailItem];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
