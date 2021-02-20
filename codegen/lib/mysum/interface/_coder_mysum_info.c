/*
 * File: _coder_mysum_info.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 31-Oct-2020 18:03:41
 */

/* Include Files */
#include "_coder_mysum_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void);

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char * data[11] = {
    "789ced5b4b6fe3541476517948c30c5d001b168cd8568a9bb6696666c3744c5e930779b8d3a46566ead8378953df6bc776d2241bba850d4b660f4883c4627680"
    "d8648f04231e1bc46e24c42f0056053bcecd38a1c1199cde36573952ea9c7eb2bff3b03f9dd8d7cc5222bdc430cc15c6b1c79cb3bd6c7d4216b032f8ff73cca8",
    "8de34b83edcb633eb6e79965e6e47d673f8c6f5a7f3e1af8a28a4cd0361d0709100cf79454282301997c47038c0e0c556901a98f546405f0320405b793b13d18"
    "754143c786ecef5c0d8887852664f49af13442c5ed0cebf1c095af1d3fce77f9947ab8719c7fc8e5db38b695317c3f7297bbc1ee184037585d45a8c3bea38a4d",
    "089069b0e96d3eb57d8b8582a908e540553659d8319a30000771da7d38f019e74b13e374105130cc947c08309fe693ef92475d300e60194812900215b9ef63fe"
    "9e4ffe7d0f7e8cef2752c57e6bb2ba5ad50578d53e810c36ab2a1d431344c0e6d7d7d6d704d65455a5acb65900155691cb6c456e0349536564b237710eeccd8a",
    "cce242f6bbe7ddbf57a6ccc7bd75e773d9ea9fedbf59fa7989241f73e9e40fa27c033b2fbef684e34d7b3ebe3e816f650c37bb808bca993a0f8bb96c2b7a1456"
    "b424e49ec691f5e0f18a8371f9a7e579d6c7ef4dd89fb6eb7ada7c965dfe683e0e221b8e305e145d7ee4933fe1c18ff119f4cf2edda05be474e3e34f7e22aac3",
    "c7ca951b24f9b0d1aec3418ddf8b237133d346f556742d13d163ed58841e1d9ef7ebd8af0eba7fa79c163fc665035953ba2e8ba6fdf36476e7e1ab1efc181fea"
    "f06818c338bef21947de230e8ccfa48fae1c704369d565e6c7afd344f90646bb2e2743492d1b8c1f4ab52a68c485a370ce849b517a74b93761ff799d8f49cdab",
    "63f27861e6e59e4ffe7b1efc189f793fc7b49a94ae3cf8fc3bb2f3f3ea2f1f92e4c346bb4e2374fd5a82d7b564691b15bb958e56aa17830b9dbeb03a7de0339f"
    "1726e6e32015190a668d1e5d2e79f0637ce6fd730a49fcbe06715d3e79f801493e6cb4eb723e1c6bdd2e24a53adf291572b713908f297c8c1e5d9e97e7797efb",
    "fd9a479c18175509e8014b46808e0425a00054b565d8b7ee8fdba438b0cdea7e45ce830fe3ff4777edcf6abf60ec2aae18eb548cb8de7ec3ff40566fdffaf511"
    "493e6cf3aab7d35e7f7ceacede752815f5edddcd703bb87107ae6592cc426f49ebed81cf38bd9ed3694ad370d7e5bce75bbf3abbebc18ff199cfb77621adce91",
    "d2858735c2eb267e7bf22751be81cdabce4e3bd72622dc7a2dae640b5c33a4271b590964a3758a9ed7d1723d1ffbcce3aa471e181f9b7b0d5150405be354a809"
    "a65c56a859e7f69e073fc667360fffab92ce684c4a5f024f08afaf787ba741920f1bed7a0dab895ca49e6f6c6d84b676e156632381bac642af2f9c5e1ff8cc63",
    "b1be6d947fb1beedd9f816ebdb1c5bac6f7bb6e3d3a2bf7ef5d0fdbece6979605c36fa839d34bebeecbcf5b8e793ffbe073fc667de47774109decff8e2efefc9"
    "decff8ebf7cf88f20d6c5ef579dafbc6201d4609bd8be472ac53e7aedd4aa736721d861e7dee4dd89fb6eb7ada7c5e9c988f83d8c39e151135babce7c18ff133",
    "e85f1f22bdfe78a1cb67cb476a6e6e45cc750ea5423bb19256d79af94e3174f42e45efe7d132371ffbcce30d8f3c306ec5755fb4df3777d6655554bd2c2341ef"
    "a89a3152d7f3d6ebc73ef991073fc667ded7ff2830c975c9c4f5fbdb2f3f25ca3730daf57b7733920fc6f3ad8454b5b4bb56ac2ab96e233efffafd0f618c1e0e",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 17384U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/*
 * Arguments    : void
 * Return Type  : mxArray *
 */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * epFieldName[6] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs", "FullPath", "TimeStamp" };

  mxArray *xInputs;
  const char * propFieldName[4] = { "Version", "ResolvedFunctions",
    "EntryPoints", "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 6, epFieldName);
  xInputs = emlrtCreateLogicalMatrix(1, 2);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("mysum"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath", emlrtMxCreateString(
    "C:\\Users\\ronny\\Documents\\MATLAB\\matlab.git\\mysum.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp", emlrtMxCreateDoubleScalar
                (738095.74870370375));
  xResult = emlrtCreateStructMatrix(1, 1, 4, propFieldName);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.8.0.1323502 (R2020a)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_mysum_info.c
 *
 * [EOF]
 */
