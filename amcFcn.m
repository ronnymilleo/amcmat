function [y1] = amcFcn(x1)
%AMCFCN neural network simulation function.
%
% Auto-generated by MATLAB, 05-Nov-2019 17:44:52.
% 
% [y1] = amcFcn(x1) takes these arguments:
%   x = 10xQ matrix, input #1
% and returns:
%   y = 6xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [1073.18191171963;1073.18191171963;0.00128168635199527;0.00211100039027637;2.26054788712929;0.114136716334837;0.0149446962379721;0.0736028093554586;0.122250367393419;-0.665464455746983];
x1_step1.gain = [0.000140339833457882;0.000140339833457882;108.638790646522;71.4486897988845;0.739295415004576;0.00738390592879353;3.26040768524802;4.81638916556653;2.9826656431822;1.0819412891288];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.2128934514089375618;-0.11824387765290543528;-1.0905704819164518948;1.5478764420597297402;0.51959595606579289662;1.0877491425530880775;-1.0178430305962318236;-3.5799279301789148633;1.2068471597612755453;0.32711653116514377571;2.1568442318804761371;-1.2450815514465054523;-0.54691856856366527495;1.1879031076517283516;-1.0669705522549026711;-1.2698394980364733353;1.5150565736314938192;1.8939202035533582169];
IW1_1 = [-0.84790646223746779508 0.49451085222701274269 -0.83533735806074893571 1.5865853949148107649 0.47271172812137457475 1.3211305569772104906 1.0548068780603536698 0.70919836493079169149 -0.3740200435927730771 0.9479632289445496518;1.2718979166411323867 0.35160333818151973118 1.3496731496308824738 -2.6442317938404089617 0.49542782374980576243 -1.5451130209906684954 -2.8332713054222931071 -1.1952031361752009087 -1.6773808423038600868 -1.4134158327943349143;1.0470713701086569181 0.64306303037048850868 -1.0038947480979352189 -0.20754646342958424365 -0.80435306098069103697 0.93856763502326434612 -0.77582303500015392661 0.23687764480597714445 -0.38372587469243740754 -0.1463748990157238139;-0.46160471387963630807 -0.1541363633594942939 -0.55911917434292768281 0.59915765965270351145 -0.88589049288311649821 -0.26528536263978125254 -0.41533843724817898213 -1.0980266761033259382 0.1176697032579786667 -0.23939198113943291335;-0.53405403330864908984 -1.4977981158568156594 0.97711453891019484086 -1.678359222960794872 -0.66119863551977275939 -0.53088508047250482225 -0.73476780076364944794 0.56037405297700537687 -0.55648084893265292727 -0.6635116237112675952;0.40585776987001953575 1.2966311249278996698 0.32404260679977547888 1.062342849936616318 0.94420019547652744851 -0.013364078638350098197 -2.6729605823467283976 -1.2833290838830393454 -2.2846254232736167289 -0.23023820976746584011;1.568379508477531159 1.9716397934794280822 0.13712122845254653969 3.0048790178770485859 0.45841744035027615078 -0.021788419774975427423 0.0022216266712840096985 -0.076273565690705535935 -0.15302324358849947461 -0.43191824813426360485;0.25668714915238993735 1.9338346892285547263 2.5158269741355101523 -0.003236792818497121263 -0.51424680248502874225 -1.1705880100071985872 2.0574730354668968602 1.0346772276924134371 -0.34928209158411199775 0.12216303705906886301;0.71952934690449266153 0.078070763583259039642 -2.512872789075628166 1.2342355189004878824 -0.82103106307745143955 0.19395998802397537708 -2.548678929059385645 -1.1497234720310478551 -2.1253510763392808869 -1.1523362356222341951;0.80760805429296944613 -0.70360012430463048094 0.89158478432839405325 -2.2196671719851206461 0.39854655315078019173 -0.82334834683735391714 0.36315161710914145576 -0.2172158503682289632 0.7745522420646671069 0.77525092987950994239;-1.3949777081169558723 -0.45699632911977050576 -0.79767472870368749671 -3.9802950351530044237 -0.67191536346325164697 -0.42766693813853601247 -2.5374049170578194534 0.14682505521794464443 -0.71004854702047803805 -1.397861786354246183;-1.1728474486173450231 0.19938822418628862621 -1.1297781433711904242 2.0227690470690027347 0.80957604356480372676 -1.7107582430167143084 -0.99898521823469799141 -0.53280592222217293408 -1.4713649664845038778 -0.4455846633134931678;0.1584171188632984284 0.57185458329994831583 0.39867196937696697256 -1.2469350322937629016 -0.20882433195545913041 -0.95178256915394787718 0.88126168376350821898 -1.0810409035303194525 -0.7299137050546361527 0.70105702846818684915;-4.0984683823351693022 -3.3137664852037831409 -3.0913097871183912169 0.74893017647349602317 -0.94668344130908876899 -0.38665699678946474638 -1.315011992807177732 0.72353953371519341697 -0.024719156060051237361 0.28954822169696203815;-1.5060134975707211158 -1.0907555063672293993 -2.6942479652503332765 -0.34348850101569727844 0.30044719470033032227 -3.2231591725964512385 0.13785565203097097098 1.2500163053805972702 1.4423632961950061393 0.84861141368222525738;0.029298300646450399498 -0.10668323615708127927 -1.3266896558170151454 0.029631475270813941586 0.10763599756322830836 -2.3974877740454472175 2.0743443961520617869 0.023016183995194717388 0.70510176153615178318 1.6128954741849683696;0.79946711265593095597 -0.43406629859332557242 -2.9631716796786378154 2.6970322292136650333 -0.1558496729510456813 1.2717368978375336308 0.38591901212719131875 0.27568539633797845001 0.62345348708386272296 -0.52035598673870786524;1.9885246225913066898 1.1993669675809033315 0.88612566841996753819 -0.57721170508745656136 -1.0054161091160209729 0.74358731867439609164 0.095805592491168697911 0.54009593392360522035 0.68830183958461965688 -0.39455765967637129732];

% Layer 2
b2 = [-1.7877058916662889043;0.96522611408799885435;0.52760275481952256804;0.4702978024099584986;-0.80572512657323469565;0.029855787255088913484;0.47996366666015155555;-0.12436640321433244105;-1.0188039889209083988;0.73521497187468509704;1.2829274431240309529;0.98821012048735634714];
LW2_1 = [0.37444104348770512747 -0.12123659406266708294 0.39741474976473845082 -0.26994024581187098244 0.2610344379787837843 1.551961812894961934 -1.3060991984719190206 -1.9751066411241238185 -0.0076546661347968360939 0.26488518874562805294 1.8542415397793448051 -0.4264679032681468196 0.22384928760717731633 1.9022931437255945486 1.28451644112230845 -0.16630077035184273604 1.2800850691643035351 -0.6318799716877279149;-0.9480107177693292142 0.32688448133732750378 0.71881604090386841399 -0.94700719469878247292 -0.26280171132138424595 0.24115302330640078776 -0.85424222919035974755 0.42506974125621144189 -0.20105487226681711954 -0.33215295007907336133 -0.18693992591373975731 -0.43099940431648464667 0.60877958159296508001 -0.43732263431505019602 0.092334868338291797851 0.61833837636298760732 -0.43208280116714603558 -0.44525886629579086717;-1.3082517786210785538 3.7723612397602761526 -0.11984851725554369894 -0.51169517191381264087 0.12487341615622975233 0.30088623799162339534 -0.17175921394977103351 2.0177704838703345303 1.3115472962909406895 1.1464270769859410404 2.7901503330852004403 1.4732292368084471956 0.60358977754070219923 -2.1459338685756459419 0.61316034000843244733 -2.145220429765286152 -1.8133869067486878546 -0.15636005295565652551;-0.62266203093160676918 -1.1571672728315416379 0.23942512189872991457 -0.35515333462087494976 -0.046882045974539085509 1.774287151503229687 -0.67244813627092225872 2.7401726671146211523 -1.2787755899315058628 -0.11598313802281022544 -0.074780486948559737881 0.40376985444104440681 0.49327895598220777851 -0.62754404345767367257 3.625065524637640646 1.1126276634973670809 -0.75406025526105491252 0.51515685910910469225;-0.36278990583508358148 -0.6503433440603203497 1.2516130914671954599 -0.71037807743950132089 0.52923712839913605865 0.45019533653954230124 0.57180520325964911965 1.3050181659533948153 -0.26712016301274693619 -0.088545319344364603609 -0.73311523910834053286 0.53723008383443948688 0.63762139687575281055 -2.2661810861609432699 -1.1519672588800513591 -0.39770366152371044999 -0.57478193148706668847 0.013153845862314206966;-0.64858469506211524624 0.24606023489993336661 -0.26671329638475782531 0.52631209096236641898 -0.71060377849016220786 1.0732561788855399243 0.87013861667901581942 1.7339441280086977937 0.37775507302523181341 0.046912404772629562322 -0.11777602088679434145 0.52050283002749386796 0.32419687632155697044 -0.8252789383801554246 -0.29900898345954468605 -0.084629181749496795728 0.56779341873216648828 -0.067933854780664479356;-0.22893833775872640679 0.87851123447803591837 0.42597259927226005516 -0.027894357507727802342 1.7050744959988282101 -1.0763518666273732549 -0.78912668640288641253 0.066946770841499317339 -2.5599057217101766071 1.3002800901745412698 0.15035252289703376904 -2.1797677322330977212 1.2819886277558125709 -1.3393977548647593157 -0.88751823546579555746 -0.5145497555909565035 -2.1131592775369365533 -0.23054202163724732411;-0.22814196842391004649 -0.66797371611097056121 -0.22230164769548105275 0.14706006424193707183 -0.22895391295409978083 -0.617549354483208357 0.38667301176956087039 2.1251144836103037505 -1.0923187564712451003 -0.4369704236610254533 1.1716009585668569759 0.051326264147192469933 -0.4964756590443562545 -2.9624884965089419708 -2.7884863583485737237 -0.85144078345361107196 -1.454650777300215081 0.43675349152644610262;-0.56350319333087994789 -0.85654518280041802569 -0.35576105846029582036 0.29264051130589163741 -1.2943509557647441266 2.1009446037983625644 1.9353905995311937449 -0.24014164537413842937 0.38062273856048517429 0.25694401051890625176 0.57335211913138983686 -0.28540819309170784024 -0.056598812671090348303 0.7020180678588405776 0.73723653209647299622 -1.1690299845878335816 0.38871911381806079078 -0.80213682462156254971;1.0784672678560489611 -1.0811202545707849776 -0.4039434767530308279 -0.49865808049243592892 -0.7752832566775426093 -0.16237035470188199149 0.10781978621235746574 -0.20843454129488067639 -0.22158815760451047727 -0.41512385717844224597 -0.19658606347736964914 -0.26979605815249824152 0.20548086718820815499 0.10426108905483784384 0.54712801761056362171 0.14368224988721794988 1.6403364050367847948 -0.39659169750362438522;-0.60506296267112824605 -1.0444191275527463514 0.73523550937969739394 -0.29562825931025926707 -0.46018186115581410922 -0.19079953133586388669 1.0722679679282800524 0.41081625924285825047 -0.051946818634300631623 0.43628358115272519724 -0.58027031435556919448 -0.64433607601224507366 1.1418645277080810008 -0.61126987323760939574 -0.12119670247676499197 1.1807142801061958348 0.24480774745161207329 0.64980827255916884244;1.4834259264141242962 -1.1969699646548364047 0.97326463870559765112 -0.29288399666691927736 0.43134828970876265553 0.81151653154176250915 1.1253643150015821828 0.042845476462504791804 2.8170579915005213856 -2.3012723807483244087 -2.2465894228182272663 2.3851747927020952034 -0.45972197592128732913 -0.021695369145585331055 -0.093318280098546854684 0.025365373392167486072 1.0686552804576237019 -2.3955572096552963934];

% Layer 3
b3 = [-1.5032446554738334576;0.60990233169576957284;-0.58777419001889652517;-0.19767303894519619445;-0.39894459968866952115;-0.63961799499922089574];
LW3_2 = [0.71988600511048872477 -0.048872190640799617611 -0.62242214748246960099 0.025303025890545564197 -0.38301824137914936008 -1.1300052848881296796 0.80571232822675931118 -0.71089992920679789812 -0.68834678956059758281 -0.48510212315788847626 0.84802358861538207346 -0.34696030250817022633;0.3154257114942256579 1.2583216663413383518 -0.7585113934693373805 -0.020545762208349010319 -0.0050224925267311889762 0.25259822359591166396 2.6848681233472051488 0.069258380684854153886 0.30165960458645302289 -0.47533112474857047713 1.3269585843758595622 -2.250206895035103738;-3.4933531847184298158 -0.033783353381708326746 -0.65293423923769822181 -2.6327979258313223276 -1.4647399816593911215 -2.3311117117795001619 -0.2024422125461178279 1.0954695626105255268 -3.8392610299656566575 1.7193448172632173065 -2.0195612749404192598 3.6181686684556448874;0.67075303297124566626 -0.70704348367049107971 3.1918557057224488105 -0.08907468676158629417 0.42782352465011203035 0.41866406648579157501 -4.0558835692699837239 -1.1521835762600807218 -0.27403267083181648278 1.9790852204695787986 -0.82616172949337063347 0.9294139378499087778;1.2801350304005620906 1.039366139690827584 1.6555248817231409397 2.3461833890740644293 1.1372246892841118004 1.7552689644477910136 0.95391304682686861582 -0.85744422969004741031 2.5209987724245213059 -1.1921370503037493904 -0.74332718102947237249 1.0942629922195008518;-0.65114131277629849759 -0.5053756108526799018 -0.71843188041535754884 0.47880181886535982949 -4.914545023216111197 0.48191293287622927188 -2.92887533313395787 -1.8620557705373610435 0.48720160287345454231 0.6197030996757385557 0.6637826585462451856 0.53868297897352812598];

% Layer 4
b4 = [0.92591996370413187645;-0.46517269454176418675;-2.1577529400480939259;0.60812418201105244986;0.1352275127774567598;0.80474067766481249819];
LW4_3 = [-1.6103008846819319988 -3.8668267755110932171 6.9979620589204563075 1.8009017039693118178 -6.3031225769747916132 -1.8100281614292783594;-0.91892127302929227373 -1.8652415605001475551 0.84083873230091155104 0.36977509753776793833 5.8713124662069278159 7.6126575028058827144;0.24345505612961645947 -0.44650823260732769304 -5.98694141425038584 0.36588047230493309092 -3.5548308377190869223 6.1351228366282191118;-0.61953373403933409413 4.6358418893447126408 -1.3494020292957569218 -4.731487404078475123 0.58693235196770077167 -4.7954616573905823884;0.75853712143724849604 -2.7910095387010427359 -0.93140826106651442018 1.982527193745763805 4.7363447648726291206 -5.0136929185174379242;3.4130065781943401682 3.2688693697491886248 2.4746233114960549671 -1.3278932193961741071 -4.0895931952812487609 0.90385000519985680967];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);

% Layer 3
a3 = tansig_apply(repmat(b3,1,Q) + LW3_2*a2);

% Layer 4
a4 = softmax_apply(repmat(b4,1,Q) + LW4_3*a3);

% Output 1
y1 = a4;
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n,~)
  if isa(n,'gpuArray')
    a = iSoftmaxApplyGPU(n);
  else
    a = iSoftmaxApplyCPU(n);
  end
end
function a = iSoftmaxApplyCPU(n)
  nmax = max(n,[],1);
  n = bsxfun(@minus,n,nmax);
  numerator = exp(n);
  denominator = sum(numerator,1); 
  denominator(denominator == 0) = 1;
  a = bsxfun(@rdivide,numerator,denominator);
end
function a = iSoftmaxApplyGPU(n)
  nmax = max(n,[],1);
  numerator = arrayfun(@iSoftmaxApplyGPUHelper1,n,nmax);
  denominator = sum(numerator,1);
  a = arrayfun(@iSoftmaxApplyGPUHelper2,numerator,denominator);
end
function numerator = iSoftmaxApplyGPUHelper1(n,nmax)
  numerator = exp(n - nmax);
end
function a = iSoftmaxApplyGPUHelper2(numerator,denominator)
  if (denominator == 0)
    a = numerator;
  else
    a = numerator ./ denominator;
  end
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end
