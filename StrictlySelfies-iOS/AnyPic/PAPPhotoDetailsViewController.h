//
//  PAPPhotoDetailViewController.h
//  StrictlySelfies
//

#import "PAPPhotoDetailsHeaderView.h"
#import "PAPBaseTextCell.h"

@interface PAPPhotoDetailsViewController : PFQueryTableViewController <UITextFieldDelegate, UIActionSheetDelegate, PAPPhotoDetailsHeaderViewDelegate, PAPBaseTextCellDelegate>

@property (nonatomic, strong) PFObject *photo;

- (id)initWithPhoto:(PFObject*)aPhoto;

@end
