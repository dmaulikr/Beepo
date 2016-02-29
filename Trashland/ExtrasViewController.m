#import "ExtrasViewController.h"

@interface ExtrasViewController ()

@end

@implementation ExtrasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedBackButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
