#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "PhasesChoose.h"

@interface Player : NSObject

@property (nonatomic) BOOL fase1;
@property (nonatomic) BOOL medalha1fase1;
@property (nonatomic) BOOL medalha2fase1;

@property (nonatomic) BOOL fase2;
@property (nonatomic) BOOL medalha1fase2;
@property (nonatomic) BOOL medalha2fase2;

@property (nonatomic) BOOL fase3;
@property (nonatomic) BOOL medalha1fase3;
@property (nonatomic) BOOL medalha2fase3;

@property (nonatomic) BOOL fase4;
@property (nonatomic) BOOL medalha1fase4;
@property (nonatomic) BOOL medalha2fase4;

@property (nonatomic) UIImage* gasperEscolhido;

@property (nonatomic) NSString* nomeEscolhido;
@property (strong, nonatomic)  PhasesChoose* telaEscolha;
- (void)dismissToPhaseSelect;
@end
