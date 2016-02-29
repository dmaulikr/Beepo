#import "ParentsInfo.h"
#import "Extras.h"
#import "Pais.h"

@interface ParentsInfo ()

@end

@implementation ParentsInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.buttonCreditos];
    [self.view addSubview:self.buttonPai];
    [self.view addSubview:self.buttonVoltar];
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(IBAction)creditos:(id)sender{
        Extras *game = [self.storyboard instantiateViewControllerWithIdentifier:@"ExtrasVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:game animated:YES completion:nil];
}
-(IBAction)pais:(id)sender{
        Pais *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PaisVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:game animated:YES completion:nil];
}

@end
