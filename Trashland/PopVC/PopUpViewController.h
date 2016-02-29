#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PopUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;
- (void)setImageNamed:(NSString *)imageName;

@end
