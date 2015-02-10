//
//  ShareTableViewController.h
//  StrictlySelfies
//
//  Created by Jeffrey Jackson on 2/10/15.
//
//

#import <UIKit/UIKit.h>

@interface ShareTableViewController : UITableViewController <UIDocumentInteractionControllerDelegate>

@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;

@end
