{ buildVscodeMarketplaceExtension, lib }:
{
  kubukoz.nickel-syntax = buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "kubukoz";
      name = "nickel-syntax";
      version = "0.0.1";
      sha256 = "010zn58j9kdb2jpxmlfyyyais51pwn7v2c5cfi4051ayd02b9n3s";
    };
    meta.license = [ lib.licenses.mit ];
  };
}
