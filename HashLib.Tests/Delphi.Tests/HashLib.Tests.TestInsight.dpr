program HashLib.Tests.TestInsight;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$WARN DUPLICATE_CTOR_DTOR OFF}
{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  TestInsight.DUnit,
  HlpHash in '..\..\HashLib\src\Base\HlpHash.pas',
  HlpKDF in '..\..\HashLib\src\Base\HlpKDF.pas',
  HlpHashBuffer in '..\..\HashLib\src\Base\HlpHashBuffer.pas',
  HlpHashCryptoNotBuildIn
    in '..\..\HashLib\src\Base\HlpHashCryptoNotBuildIn.pas',
  HlpHashFactory in '..\..\HashLib\src\Base\HlpHashFactory.pas',
  HlpHashResult in '..\..\HashLib\src\Base\HlpHashResult.pas',
  HlpHashRounds in '..\..\HashLib\src\Base\HlpHashRounds.pas',
  HlpHashSize in '..\..\HashLib\src\Base\HlpHashSize.pas',
  HlpHMACNotBuildInAdapter
    in '..\..\HashLib\src\Base\HlpHMACNotBuildInAdapter.pas',
  HlpMultipleTransformNonBlock
    in '..\..\HashLib\src\Base\HlpMultipleTransformNonBlock.pas',
  HlpAdler32 in '..\..\HashLib\src\Checksum\HlpAdler32.pas',
  HlpCRC in '..\..\HashLib\src\Checksum\HlpCRC.pas',
  HlpCRC16 in '..\..\HashLib\src\Checksum\HlpCRC16.pas',
  HlpCRC32 in '..\..\HashLib\src\Checksum\HlpCRC32.pas',
  HlpCRC64 in '..\..\HashLib\src\Checksum\HlpCRC64.pas',
  HlpGost in '..\..\HashLib\src\Crypto\HlpGost.pas',
  HlpGrindahl256 in '..\..\HashLib\src\Crypto\HlpGrindahl256.pas',
  HlpGrindahl512 in '..\..\HashLib\src\Crypto\HlpGrindahl512.pas',
  HlpHAS160 in '..\..\HashLib\src\Crypto\HlpHAS160.pas',
  HlpHaval in '..\..\HashLib\src\Crypto\HlpHaval.pas',
  HlpMD2 in '..\..\HashLib\src\Crypto\HlpMD2.pas',
  HlpMD4 in '..\..\HashLib\src\Crypto\HlpMD4.pas',
  HlpMD5 in '..\..\HashLib\src\Crypto\HlpMD5.pas',
  HlpMDBase in '..\..\HashLib\src\Crypto\HlpMDBase.pas',
  HlpPanama in '..\..\HashLib\src\Crypto\HlpPanama.pas',
  HlpRadioGatun32 in '..\..\HashLib\src\Crypto\HlpRadioGatun32.pas',
  HlpRadioGatun64 in '..\..\HashLib\src\Crypto\HlpRadioGatun64.pas',
  HlpRIPEMD in '..\..\HashLib\src\Crypto\HlpRIPEMD.pas',
  HlpRIPEMD128 in '..\..\HashLib\src\Crypto\HlpRIPEMD128.pas',
  HlpRIPEMD160 in '..\..\HashLib\src\Crypto\HlpRIPEMD160.pas',
  HlpRIPEMD256 in '..\..\HashLib\src\Crypto\HlpRIPEMD256.pas',
  HlpRIPEMD320 in '..\..\HashLib\src\Crypto\HlpRIPEMD320.pas',
  HlpSHA0 in '..\..\HashLib\src\Crypto\HlpSHA0.pas',
  HlpSHA1 in '..\..\HashLib\src\Crypto\HlpSHA1.pas',
  HlpSHA2_224 in '..\..\HashLib\src\Crypto\HlpSHA2_224.pas',
  HlpSHA2_256 in '..\..\HashLib\src\Crypto\HlpSHA2_256.pas',
  HlpSHA2_256Base in '..\..\HashLib\src\Crypto\HlpSHA2_256Base.pas',
  HlpSHA2_384 in '..\..\HashLib\src\Crypto\HlpSHA2_384.pas',
  HlpSHA2_512 in '..\..\HashLib\src\Crypto\HlpSHA2_512.pas',
  HlpSHA2_512_224 in '..\..\HashLib\src\Crypto\HlpSHA2_512_224.pas',
  HlpSHA2_512_256 in '..\..\HashLib\src\Crypto\HlpSHA2_512_256.pas',
  HlpSHA2_512Base in '..\..\HashLib\src\Crypto\HlpSHA2_512Base.pas',
  HlpSHA3 in '..\..\HashLib\src\Crypto\HlpSHA3.pas',
  HlpSnefru in '..\..\HashLib\src\Crypto\HlpSnefru.pas',
  HlpTiger in '..\..\HashLib\src\Crypto\HlpTiger.pas',
  HlpTiger2 in '..\..\HashLib\src\Crypto\HlpTiger2.pas',
  HlpWhirlPool in '..\..\HashLib\src\Crypto\HlpWhirlPool.pas',
  HlpBlake2B in '..\..\HashLib\src\Crypto\HlpBlake2B.pas',
  HlpBlake2S in '..\..\HashLib\src\Crypto\HlpBlake2S.pas',
  HlpBlake2BConfig
    in '..\..\HashLib\src\Crypto\Blake2BConfigurations\HlpBlake2BConfig.pas',
  HlpBlake2BIvBuilder
    in '..\..\HashLib\src\Crypto\Blake2BConfigurations\HlpBlake2BIvBuilder.pas',
  HlpBlake2BTreeConfig
    in '..\..\HashLib\src\Crypto\Blake2BConfigurations\HlpBlake2BTreeConfig.pas',
  HlpBlake2SConfig
    in '..\..\HashLib\src\Crypto\Blake2SConfigurations\HlpBlake2SConfig.pas',
  HlpBlake2SIvBuilder
    in '..\..\HashLib\src\Crypto\Blake2SConfigurations\HlpBlake2SIvBuilder.pas',
  HlpBlake2STreeConfig
    in '..\..\HashLib\src\Crypto\Blake2SConfigurations\HlpBlake2STreeConfig.pas',
  HlpAP in '..\..\HashLib\src\Hash32\HlpAP.pas',
  HlpBernstein in '..\..\HashLib\src\Hash32\HlpBernstein.pas',
  HlpBernstein1 in '..\..\HashLib\src\Hash32\HlpBernstein1.pas',
  HlpBKDR in '..\..\HashLib\src\Hash32\HlpBKDR.pas',
  HlpDEK in '..\..\HashLib\src\Hash32\HlpDEK.pas',
  HlpDJB in '..\..\HashLib\src\Hash32\HlpDJB.pas',
  HlpELF in '..\..\HashLib\src\Hash32\HlpELF.pas',
  HlpFNV in '..\..\HashLib\src\Hash32\HlpFNV.pas',
  HlpFNV1a in '..\..\HashLib\src\Hash32\HlpFNV1a.pas',
  HlpJenkins3 in '..\..\HashLib\src\Hash32\HlpJenkins3.pas',
  HlpJS in '..\..\HashLib\src\Hash32\HlpJS.pas',
  HlpMurmur2 in '..\..\HashLib\src\Hash32\HlpMurmur2.pas',
  HlpMurmurHash3_x86_32 in '..\..\HashLib\src\Hash32\HlpMurmurHash3_x86_32.pas',
  HlpOneAtTime in '..\..\HashLib\src\Hash32\HlpOneAtTime.pas',
  HlpPJW in '..\..\HashLib\src\Hash32\HlpPJW.pas',
  HlpRotating in '..\..\HashLib\src\Hash32\HlpRotating.pas',
  HlpRS in '..\..\HashLib\src\Hash32\HlpRS.pas',
  HlpSDBM in '..\..\HashLib\src\Hash32\HlpSDBM.pas',
  HlpShiftAndXor in '..\..\HashLib\src\Hash32\HlpShiftAndXor.pas',
  HlpSuperFast in '..\..\HashLib\src\Hash32\HlpSuperFast.pas',
  HlpXXHash32 in '..\..\HashLib\src\Hash32\HlpXXHash32.pas',
  HlpFNV1a64 in '..\..\HashLib\src\Hash64\HlpFNV1a64.pas',
  HlpFNV64 in '..\..\HashLib\src\Hash64\HlpFNV64.pas',
  HlpMurmur2_64 in '..\..\HashLib\src\Hash64\HlpMurmur2_64.pas',
  HlpSipHash in '..\..\HashLib\src\Hash64\HlpSipHash.pas',
  HlpXXHash64 in '..\..\HashLib\src\Hash64\HlpXXHash64.pas',
  HlpMurmurHash3_x86_128
    in '..\..\HashLib\src\Hash128\HlpMurmurHash3_x86_128.pas',
  HlpMurmurHash3_x64_128
    in '..\..\HashLib\src\Hash128\HlpMurmurHash3_x64_128.pas',
  HlpIHash in '..\..\HashLib\src\Interfaces\HlpIHash.pas',
  HlpIKDF in '..\..\HashLib\src\Interfaces\HlpIKDF.pas',
  HlpICRC in '..\..\HashLib\src\Interfaces\HlpICRC.pas',
  HlpIHashInfo in '..\..\HashLib\src\Interfaces\HlpIHashInfo.pas',
  HlpIHashResult in '..\..\HashLib\src\Interfaces\HlpIHashResult.pas',
  HlpIBlake2BConfig
    in '..\..\HashLib\src\Interfaces\IBlake2BConfigurations\HlpIBlake2BConfig.pas',
  HlpIBlake2SConfig
    in '..\..\HashLib\src\Interfaces\IBlake2SConfigurations\HlpIBlake2SConfig.pas',
  HlpIBlake2STreeConfig
    in '..\..\HashLib\src\Interfaces\IBlake2SConfigurations\HlpIBlake2STreeConfig.pas',
  HlpIBlake2BTreeConfig
    in '..\..\HashLib\src\Interfaces\IBlake2BConfigurations\HlpIBlake2BTreeConfig.pas',
  HlpPBKDF2_HMACNotBuildInAdapter
    in '..\..\HashLib\src\KDF\HlpPBKDF2_HMACNotBuildInAdapter.pas',
  HlpNullable in '..\..\HashLib\src\Nullable\HlpNullable.pas',
  HlpConverters in '..\..\HashLib\src\Utils\HlpConverters.pas',
  HlpBitConverter in '..\..\HashLib\src\Utils\HlpBitConverter.pas',
  HlpBits in '..\..\HashLib\src\Utils\HlpBits.pas',
  HlpHashLibTypes in '..\..\HashLib\src\Utils\HlpHashLibTypes.pas',
  HashLibTests in '..\src\HashLibTests.pas',
  BitConverterTests in '..\src\BitConverterTests.pas',
  PBKDF2_HMACTests in '..\src\PBKDF2_HMACTests.pas',
  Blake2BTestVectors in '..\src\Blake2BTestVectors.pas',
  Blake2STestVectors in '..\src\Blake2STestVectors.pas';

begin

  TestInsight.DUnit.RunRegisteredTests;

end.
