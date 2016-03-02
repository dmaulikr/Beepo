#import <UIKit/UIKit.h>

@protocol FourthPhaseViewControllerDelegate <NSObject>

@end

@interface FourthPhaseViewController : UIViewController

@property (nonatomic, assign) id <FourthPhaseViewControllerDelegate> delegate;

@end
