#import "ExtrasViewController.h"

@interface ExtrasViewController ()

@end

@implementation ExtrasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedBackButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(askedToDismissExtra)]) {
        [_delegate askedToDismissExtra];
    }
}

@end
