//
//  PAPPhotoTimelineViewController.h
//  StrictlySelfies
//

#import "PAPPhotoHeaderView.h"

@interface PAPPhotoTimelineViewController : PFQueryTableViewController <PAPPhotoHeaderViewDelegate>

- (PAPPhotoHeaderView *)dequeueReusableSectionHeaderView;

@end
