#import "Extras.h"

@interface Extras ()

@end

@implementation Extras

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
