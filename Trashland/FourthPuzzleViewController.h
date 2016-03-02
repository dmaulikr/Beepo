#import <UIKit/UIKit.h>

@protocol FourthPuzzleViewControllerDelegate <NSObject>

- (void) askedToDismissPuzzle;

@end

@interface FourthPuzzleViewController : UIViewController

@property (nonatomic, assign) id <FourthPuzzleViewControllerDelegate> delegate;

@end
