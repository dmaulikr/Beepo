#import <UIKit/UIKit.h>

@protocol FirstStoryViewControllerDelegate <NSObject>

- (void) askedToDismissFirstStory;

@end

@interface FirstStoryViewController : UIViewController

@property (nonatomic, assign) id <FirstStoryViewControllerDelegate> delegate;

@end
