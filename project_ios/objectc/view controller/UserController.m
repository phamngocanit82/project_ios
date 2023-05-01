#import "UserController.h"
@implementation UserController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *header = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[CTHHelper sha256:CTHUserDefined.SECRET_KEY], @"X-CSRF-Token", @"iOS", @"Platform", nil];
    if (!self.connection)
        self.connection = [[CTHConnection alloc] init];
    [self.connection connectToServer:GET_METHOD UrlRequest:@"https://datausa.io/api/data?drilldowns=Nation&measures=Population" Header:header Body:nil ShowLoading:YES LocalDatabase:NO WithLocalDatabase:^(NSMutableDictionary *response, NSInteger status) {
    } WithComplete:^(NSMutableDictionary *response, NSInteger status) {
        NSLog(@"response %@", response);
        //if(status == STATUS_SUCCESS)
            
    } WithError:^{
    }];
    //[self loadData];
}
-(void)viewDidDisappear:(BOOL)animated{
}
-(void)loadData{
    
}

-(void)reloadTable{
    [self performSelector:@selector(waitLoadData) withObject:nil afterDelay:0.01];
}
-(void)waitLoadData{
    [self doneLoadingTableViewData];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Table view methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
