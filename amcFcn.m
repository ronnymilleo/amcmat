function [y1] = amcFcn(x1)
%AMCFCN neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 30-Sep-2019 16:01:44.
% 
% [y1] = amcFcn(x1) takes these arguments:
%   x = 10xQ matrix, input #1
% and returns:
%   y = 6xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.278761526769025;1.56815224563654;0.123547951042153;0.137867945138523;2.27253440252444;0.117344364867359;0.0150635546707294;0.0738137495819348;0.122735546554229;0.01];
x1_step1.gain = [1.5477161874792;3.56152384025425;7.39327251307224;5.87462229558058;0.753624744337892;0.00787944022264668;3.23754599120932;4.90695231863619;2.97239303457189;0.0632655595299235];
x1_step1.ymin = -1;

% Layer 1
b1 = [6.2724809814364199667;-14.065016646799076483;-17.345210814139427669;-20.604202112172597339;-0.092979628888167603629;-1.3322768174330323898;-5.35745525004548373;11.012826815464956454;1.9217413365365991762;16.294385049609910965];
IW1_1 = [-1.2748892177586432783 0.1845014565849135979 -0.83486936848759896179 0.070029637921234969 0.0012891533319175181235 0.082149896203618455459 22.823208419965528293 -0.00085821305961107175256 -16.291293686025845489 -0.9253897602642334741;-6.6007315871291192266 -0.1243810058816990638 -1.3989362858805847178 0.85764146921804318424 -0.19450505536398818296 -0.3045095999106404161 -19.143937252308155905 0.83596096943594133677 27.025329876481453795 -4.4518543611559779904;11.044219387906290208 -3.8130557047497282142 12.565423433862207503 6.6614416606575135305 -0.31906886147604462955 -7.0435234400050577008 -9.910743182634126569 10.650646508579201921 -3.4338396166374995921 -3.167749411667297732;-1.4236977387655023186 0.57964971027928824387 -0.18931153316145579724 -1.177804810838352978 0.086233625763348309423 0.2008368344015389606 -49.489764157063305561 -0.22218347790239656447 51.512023405377689755 -3.4643489682468699975;0.2433682939281490154 -1.2159155690544780626 -1.7637136185244111086 2.2863812579343711917 -0.12319950728300528564 0.34411182084418867611 -0.052116548785772598418 -0.91182429301386325182 2.5520531890801083641 0.020745825399372221781;-0.033356543427406459834 -1.6418779758642942923 15.105287390547086801 -11.236699440957124807 -3.4229689243972982737 -3.5621662782709546669 -12.573690638656460195 5.6681724595345768236 -0.020489809260723607087 0.42241911332117060285;-1.7520726501475911707 0.11664795324445142999 -1.6161716325995560961 0.77646252288659778351 -0.028187566063377356151 0.26071450728521256002 -14.903089300666888306 0.042237264483176564789 5.4015232719745220891 -1.0211697790407012754;0.051453212960972008472 0.25795407659803010203 -2.0386782190047298968 1.4550834049197611808 -0.021517133814543804721 -0.045670337979409322826 -0.2750977605755363653 0.59954106548236718588 1.1006219873627425265 12.289540769204258197;12.222378053289062905 -7.0667268317742468753 -7.1260668618369473748 11.380872400309135273 -5.9122867939809067295 6.3488577834442354586 -2.0529602380759661706 1.6297927357743298149 -2.215244952059433281 10.705437855208304043;-2.9083059443816705603 0.23495322305396657003 -0.89956213289452213733 0.03115296747435765401 -0.031413353486797176983 0.037057229390970850003 43.25712130665264965 0.24068258081043661378 -58.246886803721587 -1.563035905364400735];

% Layer 2
b2 = [10.557275096327852992;21.131941251481741517;26.571103525028203052;-30.653228149330907115;15.373790946938040491;-6.7338105846863864912];
LW2_1 = [-0.039646858076687052641 -1.3905610557981971098 0.48271372986882254974 -6.4867661919363444056 -8.3485243305489404975 0.24502950400975423428 16.35938946806740546 -5.8217509343954452206 -3.1851401737644962076 -17.729952115538196722;-42.605285346240812316 19.85740080452099221 -5.5455745783497052415 32.035260983861263639 10.371753666291880336 -12.107865638378314088 22.386859623845332123 8.38242777923732163 19.129732998958466794 -65.925462530569134856;-38.53197978427570547 21.701336734811274454 4.2443010456642644712 43.72487543965565493 24.943962590739985785 -0.1505590648634901052 2.9508866426203028688 14.68185876572186821 23.793812326788930989 -43.874241959350932518;14.359537350945648981 -9.1118654046604312668 -4.852122287412336199 -15.429486231134349694 6.6263013787297344592 -9.149291566924503627 -14.081044185692556781 0.70139689726014087245 3.348483643781632324 31.474495114975621135;6.6452036220832884084 -1.6687311700208531384 8.8502285172165784388 2.5500943442837660236 -6.6166703380865783402 0.31663681771135249177 5.6807188321429959998 -4.6681030536980241408 0.93709906931087538773 -3.0266144850554641543;-6.3554140345866283468 -3.2792236056105315001 -1.865204070330706454 2.6681383315335636119 2.7153175804532430071 0.49437221251889373885 -11.662651352343242905 13.135392723050449248 4.312287985934599277 0.64796722311282750617];

% Layer 3
b3 = [2.4956162377987030077;7.6686375036321443588;16.088005472139599306;-10.06102894656911495;-25.976056860728984788;10.517287472539219806];
LW3_2 = [0.59506855686310733411 -14.953206145832954377 -9.9331614336825904132 -10.914148286551544231 18.980673613754056817 -15.610090968147783741;-8.2112992206562402941 3.7825146933181872377 -5.3284268726378316572 -27.563492067102004057 -11.578412911618386261 16.588625859697799569;27.059820572331187094 9.7401544472684413734 40.048180562875650423 -39.518908438225658131 -0.66494259455789117563 -0.26399879239062307157;-7.386473481853967904 53.953982577045970004 25.182138430064430423 10.234509395006263333 -16.610437434714423688 -10.651763662472896854;-6.2704442162440816588 -63.132159556807437184 -57.963609147540786637 59.019979591825951104 -2.7969085490139327099 -4.0318851446812820072;-6.4752118299569003668 10.53699683182136404 9.5976396782928876661 9.4009278866551309051 12.959862317019254618 13.266647169733776224];

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
a3 = softmax_apply(repmat(b3,1,Q) + LW3_2*a2);

% Output 1
y1 = a3;
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
