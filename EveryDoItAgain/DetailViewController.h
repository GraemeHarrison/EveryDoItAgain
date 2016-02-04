//
//  DetailViewController.h
//  EveryDoItAgain
//
//  Created by Graeme Harrison on 2016-02-03.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol DetailViewControllerDelegate <NSObject>

-(void)updateInputInfo:(ToDo *)newToDoObject;
-(void)cancelUpdate:(ToDo *)newToDoObject;

@end


@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo *detailItem;
@property (assign, nonatomic) BOOL isNewItem;
@property (weak, nonatomic) id <DetailViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *priorityTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;


@end

