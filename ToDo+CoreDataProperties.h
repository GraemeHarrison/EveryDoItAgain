//
//  ToDo+CoreDataProperties.h
//  EveryDoItAgain
//
//  Created by Graeme Harrison on 2016-02-03.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *descript;
@property (nullable, nonatomic, retain) NSString *priorityNum;
@property (nullable, nonatomic, retain) NSNumber *isComplete;
@property (nullable, nonatomic, retain) NSDate *deadline;

@end

NS_ASSUME_NONNULL_END
